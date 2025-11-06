package com.example.demo.service;

import org.springframework.stereotype.Service;
import com.example.demo.dao.MemberDao;
import com.example.demo.dto.Member;

@Service
public class MemberService {
	private MemberDao memberDao;
	
	public MemberService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	public void memberJoin(String loginId, String loginPw, String name) {
		this.memberDao.memberJoin(loginId, loginPw, name);
	}
	
	public Member getMemberByLoginID(String loginId) {
		return this.memberDao.getMemberByLoginId(loginId);
	}
}
