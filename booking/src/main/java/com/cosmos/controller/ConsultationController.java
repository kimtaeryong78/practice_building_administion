package com.cosmos.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cosmos.dto.ConsultationDTO;
import com.cosmos.service.ConsultationService;

@Controller
@RequestMapping(value = "/board")
public class ConsultationController {

	@Autowired
	public ConsultationService cService;

	@GetMapping("/main")
	public String BoardMain(Model model) {
		int boardCount = cService.allNumberBoard();
		ArrayList<ConsultationDTO> consultationList = cService.readAllBoard();
		model.addAttribute("boardList", consultationList);
		model.addAttribute("boardCount", boardCount);
		return "board";
	}
}
