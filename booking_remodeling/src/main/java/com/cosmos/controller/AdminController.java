package com.cosmos.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@PostMapping("login")
	public String adminLoginProcess(@RequestParam("id") String id,@RequestParam("password") String password, Model model) {
		if(id.equals("admin")&&password.equals("admin")) {
			model.addAttribute("message","success");
			return "admin/main";
		} else {
			model.addAttribute("message", "fail");
			return "redirect:/admin";
		}
	}
	
	@GetMapping("main")
	public String adminMain() {
		return "admin/main";
	}
}
