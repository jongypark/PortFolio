<%@page import="com.dto.MemberDTO"%>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    <%
    	String memberupdate = (String)session.getAttribute("memberupdate");
    	MemberDTO dto = (MemberDTO)session.getAttribute("login_member");
    
    	if( memberupdate != null) {System.out.print(memberupdate);
    %>
    
    
    <script>
    	alert("업데이트 성공");
    </script>

<%
    	}session.removeAttribute("memberupdate");
%>


  <div class="wrapper-signup">
    <div class="title-signup">My Page</div>
    <form action="#" method="post">
      <div class="inputfield">
        <label>아이디</label>
       
          <input type="text" class="input" name="mid" id="userid" value="${login_member.mid}" readonly > 
        
      </div>

      <div class="inputfield">
        
        <label>비번</label> 
        <div class="col-1">
	       	 <input type="password" class="input" name="mpw" id="passwdM" value="${login_member.mpw}" readonly required>
	       	 <span id="passwd1MR"></span>
	       	 <input type="button" class="input update" id="update1" value="비번수정" >
	       	 
        </div>
       
      </div>

      <div class="inputfield">
        <label>비번확인</label> 
        <div class="col-1">
	      	  <input type="password" class="input" name="mpw2" id="passwd2M" value="${login_member.mpw}" readonly required>
	          <span id="passwd2MR">read only</span>
        </div>
      </div>

      <div class="inputfield">
        <label>이름</label> <input type="text" class="input" name="mname" id="mname"  value="${login_member.mname}" required>
      </div>

      <div class="inputfield">
        <label>우편번호</label>
        <div class="col-2">
          <input type="text" class="input" name="mpost" id="sample4_postcode" placeholder="우편번호" value="${login_member.mpost}" required> 
          <input type="button" class="input btn-sign" value="우편번호 찾기" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
        </div>
      </div>

      <div class="inputfield">
        <label>주소</label>
        <div class="col-2">
          <input type="text" class="input" name="maddress1" id="sample4_roadAddress" placeholder="도로명주소" value="${login_member.maddress1}" required> 
          <input type="text" class="input" name="maddress2" id="sample4_jibunAddress" placeholder="지번주소" value="${login_member.maddress2}" required>
        </div>
      </div>

      <div class="inputfield">
        <label>전화번호</label>
        <div class="col-3">
          <div class="custom_select1">
            <select name="mphone1" id="mphone1">
              <option value="010" <% if(dto.getMphone1().equals("010")){ %> selected  <%} %>   >010</option>
              <option value="011" <% if(dto.getMphone1().equals("011")){ %> selected  <%} %>   >011</option>
              <option value="02" <% if(dto.getMphone1().equals("02")){ %> selected  <%} %>    >02</option>
            </select>
          </div>
          <span>-</span> 
          <input type="text" class="input"  id="mphone2" name="mphone2" value="${login_member.mphone2}" required>
          <span>-</span>
          <input type="text" class="input"  id="mphone3" name="mphone3" value="${login_member.mphone3}" required>
        </div>
      </div>

      <div class="inputfield">
        <label>이메일</label>
        <div class="col-3">
          <input type="text" class="input" name="memail1" id="memail1"  value="${login_member.memail1}" required><span>@</span> 
          <input type="text" class="input" name="memail2" id="email2M"  placeholder="직접입력" value="${login_member.memail2}" required>
          <div class="custom_select1">
            <select id="memail3">
              <option value="">직접입력</option>
              <option value="daum.net" <% if(dto.getMemail2().equals("daum.net")){ %> selected  <%} %>   >daum.net</option>
              <option value="naver.com"  <% if(dto.getMemail2().equals("naver.com")){ %> selected  <%} %>  >naver.com</option>
              <option value="google.com" <% if(dto.getMemail2().equals("google.com")){ %> selected  <%} %> >google.com</option>
            </select>
          </div>
        </div>
      </div>

      <div class="inputfield">
        <label>성별</label>
        <div class="custom_select">
          <select>
            <option value="">Select</option>
            <option value="male">Male</option>
            <option value="female">Female</option>
          </select>
        </div>
      </div>

      <div class="inputfield">
        <label>생일</label> <input type="date" id="mbirth" name="mbirth" class="input" value="${login_member.mbirth}" required>
      </div>

      <!-- 나중에 써먹기~~~  -->
      <!-- <div class="inputfield terms">
        <label class="check"> 
          <input type="checkbox"> 
          <span class="checkmark"></span>
        </label>
        <p>Agreed to terms and conditions</p>
      </div> -->

      <div class="inputfield">
        <input type="submit" value="수정하기" class="btn-sign" >
      </div>

    </form>
  </div>
  