package com.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dto.MemberDTO;

@Service
public class MemberDAO {

	@Autowired
	SqlSessionTemplate session;

	public MemberDTO login(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		MemberDTO dto = session.selectOne("MemberMapper.login" , map);
		return dto;
	}

	public int idCheck(String mid) {
		// TODO Auto-generated method stub
		int m = session.selectOne("MemberMapper.idCheck", mid);
		return m;
	}

	public int insert(MemberDTO dto) {
		// TODO Auto-generated method stub
		int m = session.insert("MemberMapper.insert", dto);
		return m;
	}

	public MemberDTO myPage(String mid) {
		// TODO Auto-generated method stub
		MemberDTO m = session.selectOne("MemberMapper.mypage", mid);
		return m;
	}

	public int memberUpdate(MemberDTO dto) {
		// TODO Auto-generated method stub
		int m = session.update("MemberMapper.memberUpdate", dto);
		return m;
	}

	public MemberDTO selectpasswdM(MemberDTO dto) {
		MemberDTO member = session.selectOne("MemberMapper.selectpasswdM",dto);
		return member;
	}
}
