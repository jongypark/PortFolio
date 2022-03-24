package com.controller;

import java.util.HashMap;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.MemberDTO;
import com.dto.SellerDTO;
import com.service.MemberService;


@Controller
public class MemberController {

	@Autowired
	MemberService mservice;
	@Autowired//메일 전송을위해 추가한 함수
	JavaMailSenderImpl mailSender;
	
	//로그인
	@RequestMapping(value = "/loginM")
	public String loginM(@RequestParam HashMap<String, String> map ,  HttpSession session) {
		MemberDTO dto  = mservice.login(map);
		//1. 아이디 비번이 db와 다를경우
		if( dto == null) {
			session.setAttribute("loginfailed", "아이디 비번을 확인하세요");
			return "redirect:loginForm";
		}else {
		//2. 아이디 비번이 일치하면 session에 id/비번을 저장한다. 
			session.setAttribute("login_member", dto);
			return "redirect:main";
		}				
	}
	//로그아웃
	@RequestMapping(value = "/loginCheck/logout")
	public String logout(RedirectAttributes  attr , HttpSession session) {
		
		session.invalidate();		
		String memberAdd = "로그아웃 성공";
		attr.addFlashAttribute("logout" , memberAdd);
		return "redirect:../main";
	}
	
	
	//마이페이지로 이동하기전 세션에 사용자 정보를 업데이트 한다. 
	@RequestMapping(value = "/loginCheck/mypage")
	public String mypage(HttpSession session ) {
		
		MemberDTO dto = (MemberDTO) session.getAttribute("login_member");
		String mid = dto.getMid();
		MemberDTO updatedto = mservice.myPage(mid);
		
		// 생일이 시분초까지 나와서 이거 없애는 것. mapper를 수정해도 되지만 귀찮아서.. 
		String[] birth = updatedto.getMbirth().split(" ");
		System.out.println(birth[0]);
		updatedto.setMbirth(birth[0]);
		session.setAttribute("login_member", updatedto);
		
		return "redirect:../mypage";
	}
	@RequestMapping(value = "/mypage")
	public String mypage1(HttpSession session) {

		MemberDTO dto = (MemberDTO) session.getAttribute("login_member");
		if ( dto == null) {
			return "redirect:loginForm";
		}else {
			return "mypage";
		}
		
	}
	
	
	
	// mypage 수정은 ajax로 변경했다.
	@RequestMapping(value = "/memberUpdate")
	public @ResponseBody String memberUpdate( MemberDTO dto  ) {
		
		//db에 업데이트 하기
		int m = mservice.memberUpdate(dto);	
		if( m==0) {
			// db업데이트 실패 
			System.out.println("memberupdate uupdate 실패");
			return "failed";
		}else {
			return "success";
		}	
		
	}
	
	
	
	//ajax로 id중복체그 부분
	@RequestMapping(value = "/idDuplicateCheckM")
	public @ResponseBody String idDuplicateCheckM(@RequestParam String mid) {
		String result =null;
		//1. idCheck하기 	
		// mid가 공백으로 오면.. 
		if ( mid =="") { 
			result ="failed";
		}else {
			// 공백이 아니면
			int m =0;
			m = mservice.idCheck(mid);
			// 0이면 중복이 아니니 사용가능한 아이디
			if( m == 0) {
				result ="success";
			}else {
				//1이면 사용불가능한 아이디 
				result ="duplicate";
			}
		}
		return result;// @ResponseBody가 있어서 주소가 아닌 String으로 전달된다.
	}
	
	//memberForm -> db에 회원정보등록
	@RequestMapping(value = "/memberAdd")
	public String MemberAdd(MemberDTO dto , HttpSession session) {
		
		System.out.println("memberadd+" + dto);
		String nextpage =null;
		//1단계 db에 저장하기 
		int m = mservice.insert(dto);
		if ( m ==0) {
			System.out.println("memberadd db insert 실패");
			nextpage = "redirect:memberForm";//예상치못한 에러로 다시 회원가입폼으로이동
		}else {
			//2단계 session에 로그인 성공 메세지 저장하기
			session.setAttribute("memberAdd", "회원가입성공 + 즉시로그인하기");
			nextpage = "redirect:loginM?mid=" + dto.getMid() +"&mpw=" + dto.getMpw() ;//회원가입과 동시에 로그인하기.. 
		}
		return nextpage;
	}
	
	//비밀번호 메일 전송을 위한 함수
	@RequestMapping(value = "/selectpasswdM")
	public @ResponseBody String mailTest(MemberDTO dto) {
			
		MemberDTO member = mservice.selectpasswdM(dto);
		
		 
        String subject = member.getMname()+"님의 비밀번호 입니다."; // 메일제목
        String content = "비밀번호 :"+member.getMpw(); // 메일 내용 
        String from = "qwerkpjh@naver.com"; //보내는 사람의 이메일 주소 
        String to = member.getMemail1()+"@"+member.getMemail2(); // 받는 사람의 이메일 주소 
        
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8"); // 한글화 
            // true는 멀티파트 메세지를 사용하겠다는 의미
        
            
            mailHelper.setFrom(from);
            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);
            // true는 html을 사용하겠다는 의미입니다.
     
            
            mailSender.send(mail);
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return "성공";
	}
	

	
	
	
	
	
}
