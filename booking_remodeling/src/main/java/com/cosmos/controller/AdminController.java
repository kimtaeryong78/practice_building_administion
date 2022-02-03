package com.cosmos.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cosmos.dto.ConsultationDTO;
import com.cosmos.dto.Criteria;
import com.cosmos.dto.PageDTO;
import com.cosmos.service.ConsultationService;

@Controller
@RequestMapping("admin")
public class AdminController {

	private final ConsultationService cService;

	@Autowired
	public AdminController(ConsultationService cService) {
		this.cService = cService;
	}

	@PostMapping("login")
	public String adminLoginProcess(@RequestParam("id") String id, @RequestParam("password") String password, Model model, HttpServletRequest req) {
		if (id.equals("admin") && password.equals("admin")) {
			HttpSession session = req.getSession();
			session.setAttribute("id", id);
			session.setAttribute("password", password);
			model.addAttribute("message", "success");
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

	@GetMapping("logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();

		return "redirect:/";
	}

	@GetMapping("consultation")
	public String consultationManagement(ConsultationDTO consultation, Criteria cri, Model model) {
		HashMap<String, Object> boardMap = new HashMap<String, Object>();

		if ((consultation.getContents() == null || consultation.getTitle() == null || consultation.getName() == null)) {
			consultation.setLock_flag(null);
		} else {
			consultation.setLock_flag("0");
		}

		boardMap.put("cri", cri);
		boardMap.put("board", consultation);

		ArrayList<ConsultationDTO> consultationList = cService.readAllBoard(boardMap);
		int boardCount = cService.allNumberBoard();
		model.addAttribute("title", "掲示板管理");
		model.addAttribute("boardList", consultationList);
		model.addAttribute("boardCount", boardCount);
		model.addAttribute("pageProp", new PageDTO(cri, boardCount));
		return "admin/consultation";
	}

}
