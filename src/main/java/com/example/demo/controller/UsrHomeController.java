package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UsrHomeController {
	
	@GetMapping("/usr/home/main")
	public String showMain(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		return "usr/home/main";
	}
	
	@GetMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       