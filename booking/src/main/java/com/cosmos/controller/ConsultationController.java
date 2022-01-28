package com.cosmos.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cosmos.dto.ConsultationDTO;
import com.cosmos.dto.Criteria;
import com.cosmos.dto.PageDTO;
import com.cosmos.service.ConsultationService;

@Controller
@RequestMapping(value = "/board")
public class ConsultationController {

	@Autowired
	public ConsultationService cService;

	@GetMapping("")
	public String boardMain(ConsultationDTO consultation, Criteria cri, Model model) {
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
		System.out.println(consultation);
		model.addAttribute("title", "相談");
		model.addAttribute("boardList", consultationList);
		model.addAttribute("boardCount", boardCount);
		model.addAttribute("pageProp", new PageDTO(cri, boardCount));
		return "board/board";
	}

	@GetMapping("/read/{no}")
	public String boardRead(Criteria cri, @PathVariable("no") int no, Model model) {
		ConsultationDTO consultation = new ConsultationDTO();
		try {
			int boardCount = cService.allNumberBoard();

			consultation = cService.readBoard(no);

			model.addAttribute("title", "相談");
			model.addAttribute("board", consultation);
			model.addAttribute("pageProp", new PageDTO(cri, boardCount));
			return "board/write";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("stack", e);
			return "error/error_page";
		}
	}

	@GetMapping("/write")
	public String boardWrite(Model model) {
		model.addAttribute("title", "相談");
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

			cService.writeBoard(consultation);

			model.addAttribute("title", "相談");
			model.addAttribute("result", "success");

			return "board/board";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("stack", e);
			return "error/error_page";
		}
	}

	@PostMapping("/modify/{no}")
	public String boardModify(@PathVariable("no") int no, ConsultationDTO consultation, Model model) {
		try {
			consultation.setNo(no);
			String flag = consultation.getLock_flag();
			if (flag == null) {
				consultation.setPasswd(null);
				consultation.setLock_flag("0");
			} else {
				consultation.setLock_flag("1");
			}
			System.out.println(consultation);
			System.out.println(cService.modifyBoard(consultation));

			model.addAttribute("title", "相談");
			return "redirect:/board";
		} catch (Exception e) {
			model.addAttribute("stack", e);
			return "error/error_page";
		}
	}

}