package com.cosmos.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cosmos.service.NoticeService;

@Controller
@RequestMapping("/news")
public class NoticeController {

	@Autowired
	public NoticeService nService;

	@GetMapping("")
	public String noticeMain(Model model) {
		model.addAttribute("noticeList", nService.readAllNotice());
		return "notice/main";
	}

	@GetMapping("read/{no}")
	public String readNotice(@PathVariable("no") int no, Model model) {
		model.addAttribute("notice", nService.readNotice(no));
		return "notice/write";
	}
}
