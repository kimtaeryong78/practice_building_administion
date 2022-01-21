package com.cosmos.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.cosmos.dto.NoticeDTO;
import com.cosmos.service.NoticeService;

@Controller
public class MainController {

	@Autowired
	public NoticeService nService;

	@GetMapping("/")
	public String main(HttpServletRequest req, Model model) {
		ArrayList<NoticeDTO> mainNoticeList = new ArrayList<NoticeDTO>();
		mainNoticeList = nService.readMainNotice();
		model.addAttribute("noticeList", mainNoticeList);

		return "main";
	} // main page

}
