package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Member;
import com.example.demo.service.MemberService;
import com.example.demo.util.Util;

@Controller
public class UsrMemberController {
	private MemberService memberService;

	public UsrMemberController(MemberService memberService) {
		this.memberService = memberService;
	}

	@GetMapping("/usr/member/join")
	public String join() {
		return "usr/member/join";
	}

	@PostMapping("/usr/member/doJoin")
	@ResponseBody
	public String doJoin(String loginId, String loginPw, String loginPwChk, String name) {

		if (name.trim().length() == 0) {
			return Util.jsReplace("이름을 입력해주세요", "hb");
		}

		if (loginId.trim().length() == 0) {
			return Util.jsReplace("아이디를 입력해주세요", "hb");
		}

		Member member = this.memberService.getMemberByLoginID(loginId);

		if (member != null) {
			return Util.jsReplace("이미 사용중인 아이디입니다", "hb");
		}
		if (loginPw.trim().length() == 0) {
			return Util.jsReplace("비밀번호를 입력해주세요", "hb");
		}
		if (!loginPw.equals(loginPwChk)) {
			return Util.jsReplace("비밀번호가 일치하지 않습니다", "hb");
		}

		this.memberService.memberJoin(loginId, loginPw, name);

		return Util.jsReplace("회원가입 완료 :)", "/");
	}
}