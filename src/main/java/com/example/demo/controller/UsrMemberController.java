package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.demo.dto.Member;
import com.example.demo.dto.ResultData;
import com.example.demo.service.MemberService;
import com.example.demo.util.Util;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;

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

		this.memberService.memberJoin(loginId, loginPw, name);

		return Util.jsReplace("회원가입 완료 :)", "/");
	}
	
	@GetMapping("/usr/member/loginIdDupChk")
	@ResponseBody
	public ResultData loginIdDupChk(String loginId) {

		Member member = this.memberService.getMemberByLoginID(loginId);

		if (member != null) {
			return new ResultData<>("F-1", "이미 사용중인 아이디입니다");
		}
		return new ResultData<>("S-1", "사용 가능한 아이디입니다");
	}
}