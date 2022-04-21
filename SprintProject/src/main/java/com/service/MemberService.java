package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDAO;
import com.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	MemberDAO dao;

	public MemberDTO login(HashMap<String, String> map ) {
		// TODO Auto-generated method stub
		System.out.println(map);
		MemberDTO dto = dao.login(map);
		return dto;
	}

	public int idCheck(String mid) {
		// TODO Auto-generated method stub
		int m = dao.idCheck(mid);
		return m;
	}

	public int insert(MemberDTO dto) {
		// TODO Auto-generated method stub
		int m = dao.insert(dto);
		return m;
	}

	public MemberDTO myPage(String mid) {
		// TODO Auto-generated method stub
		MemberDTO m = dao.myPage(mid);
		return m;
	}

	public int memberUpdate(MemberDTO dto) {
		// TODO Auto-generated method stub
		int m = dao.memberUpdate(dto);
		return m;
	}

	public MemberDTO selectpasswdM(MemberDTO dto) {
		MemberDTO member = dao.selectpasswdM(dto);
		return member;
	}
	
	
	
	
	
	
	
	
}
