package com.cosmos.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cosmos.dto.ConsultationDTO;
import com.cosmos.service.ConsultationService;

@Controller
@RequestMapping(value = "/board")
public class ConsultationController {

	@Autowired
	public ConsultationService cService;

	@GetMapping("")
	public String boardMain(Model model) {
		int boardCount = cService.allNumberBoard();
		ArrayList<ConsultationDTO> consultationList = cService.readAllBoard();
		model.addAttribute("boardList", consultationList);
		model.addAttribute("boardCount", boardCount);
		return "board/board";
	}

	@GetMapping("/read")
	public String boardRead(@RequestParam int no, Model model) {
		ConsultationDTO consultation = new ConsultationDTO();
		try {
			consultation = cService.readBoard(no);
			model.addAttribute("board", consultation);
			return "board/write";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("stack", e);
			return "error/error_page";
		}
	}

	@GetMapping("/write")
	public String boardWrite() {
		return "board/write";
	}

	@PostMapping("/write")
	public String boardWritting(ConsultationDTO consultation, Model model) {
		try {
			String flag = consultation.getLock_flag();
			if (flag == null) {
				consultation.setPasswd(null);
				consultation.setLock_flag("0");
			} else {
				consultation.setLock_flag("1");
			}
			consultation.setGrno(cService.nextBoardNumber());
			consultation.setGrgrod(0);
			consultation.setDepth(0);
			System.out.println(consultation);
			cService.writeBoard(consultation);
			return "board/write";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("stack", e);
			return "error/error_page";
		}
	}

	@PostMapping("/modify/{no}")
	public String boardModify(@PathVariable("no") int no, ConsultationDTO consultation, Model model) {
		try {
			String flag = consultation.getLock_flag();
			if (flag == null) {
				consultation.setPasswd(null);
				consultation.setLock_flag("0");
			} else {
				consultation.setLock_flag("1");
			}
			System.out.println(consultation);
			System.out.println(cService.modifyBoard(consultation));
			return "redirect:board/board";
		} catch (Exception e) {
			model.addAttribute("stack", e);
			return "error/error_page";
		}
	}

}