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

import com.cosmos.dto.Criteria;
import com.cosmos.dto.NoticeDTO;
import com.cosmos.dto.PageDTO;
import com.cosmos.service.NoticeService;

@Controller
@RequestMapping("/news")
public class NoticeController {

	@Autowired
	public NoticeService nService;

	@GetMapping("")
	public String noticeMain(NoticeDTO notice, Criteria cri, Model model) {
		HashMap<String, Object> boardMap = new HashMap<String, Object>();

		boardMap.put("cri", cri);
		boardMap.put("notice", notice);

		ArrayList<NoticeDTO> noticeList = nService.readAllNotice(boardMap);
		int boardCount = nService.countNotice();

		model.addAttribute("title", "お知らせ");
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageProp", new PageDTO(cri, boardCount));
		return "notice/main";
	}

	@GetMapping("read/{no}")
	public String readNotice(@PathVariable("no") int no, Model model) {
		model.addAttribute("action", "read");
		model.addAttribute("title", "お知らせ");
		model.addAttribute("notice", nService.readNotice(no));
		return "notice/write";
	}

	@GetMapping("write")
	public String writeNotice(Model model) {
		model.addAttribute("action", "write");
		model.addAttribute("title", "お知らせ");
		return "notice/write";
	}

	@PostMapping("write")
	public String writeNotice(NoticeDTO notice, Model model) {
		HashMap<String, Object> boardMap = new HashMap<String, Object>();

		boardMap.put("cri", new Criteria());
		boardMap.put("notice", notice);

		ArrayList<NoticeDTO> noticeList = nService.readAllNotice(boardMap);
		int boardCount = nService.countNotice();

		model.addAttribute("title", "お知らせ");
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageProp", new PageDTO(new Criteria(), boardCount));
		nService.writeNotice(notice);
		model.addAttribute("title", "お知らせ");

		return "notice/main";
	}

	@PostMapping("modify/{no}")
	public String modifyNotice(@PathVariable("no") int no, NoticeDTO notice, Model model) {
		notice.setNo(no);
		try {
			nService.modifyNotice(notice);
			return "redirect:/news";
		} catch (Exception e) {
			model.addAttribute("stack", e);
			return "error/error_page";
		}
	}

	@GetMapping("remove/{no}")
	public String removeNotice(@PathVariable("no") int no, Model model) {
		NoticeDTO notice = new NoticeDTO();

		notice.setNo(no);
		notice.setDelete_flag("1");

		try {
			nService.modifyNotice(notice);
			return "redirect:/news";
		} catch (Exception e) {
			model.addAttribute("stack", e);
			return "error/error_page";
		}
	}

}
