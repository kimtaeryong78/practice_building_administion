package com.cosmos.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cosmos.dto.BookingDTO;
import com.cosmos.dto.ConsultationDTO;
import com.cosmos.dto.NoticeDTO;
import com.cosmos.service.BookService;
import com.cosmos.service.ConsultationService;
import com.cosmos.service.NoticeService;
import com.cosmos.service.RoomService;
import com.cosmos.service.SliderService;

@RestController
@RequestMapping("admin/ajax")
public class AdminRestController {

	private final ConsultationService cService;
	private final BookService bService;
	private final NoticeService nService;
	private final RoomService rService;
	private final SliderService sService;

	@Autowired
	public AdminRestController(ConsultationService cService, BookService bService, NoticeService nService, RoomService rService, SliderService sService) {
		this.cService = cService;
		this.bService = bService;
		this.nService = nService;
		this.rService = rService;
		this.sService = sService;
	}// injection

	//////////////////// board
	@PostMapping("insertBoard")
	public String insertBoard(ConsultationDTO consultation) {
		return cService.writeBoard(consultation);
	}

	@GetMapping("getBoard/{no}")
	public Map<String, Object> getBoard(@PathVariable("no") int no) {
		Map<String, Object> boardMap = new HashMap<String, Object>();
		ConsultationDTO board = cService.readBoard(no);
		boardMap.put("board", board);
		return boardMap;
	}

	@PostMapping("modifyBoard")
	public String modifyBoard(ConsultationDTO consultation) {
		return cService.modifyBoard(consultation);
	}
	//////////////////// notice
	@GetMapping("getNotice/{no}")
	public Map<String, Object> getNotice(@PathVariable("no") int no) {
		Map<String, Object> noticeMap = new HashMap<String, Object>();
		NoticeDTO notice = nService.readNotice(no);
		noticeMap.put("notice", notice);
		return noticeMap;
	}

	@PostMapping("modifyNotice")
	public String modifyNotice(NoticeDTO notice) {
		return nService.modifyNotice(notice);
	}

	/////////////////// booking
	@GetMapping("getBooking/{no}")
	public Map<String, Object> getBooking(@PathVariable("no") int no) {
		Map<String, Object> bookingMap = new HashMap<String, Object>();
		BookingDTO booking = bService.readBooking(no);
		bookingMap.put("booking", booking);
		return bookingMap;
	}

	@PostMapping("modifyBooking")
	public String modifyBooking(BookingDTO booking) {
		return bService.modifyBooking(booking);
	}

}
