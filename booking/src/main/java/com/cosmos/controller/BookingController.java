package com.cosmos.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cosmos.service.RoomService;

@Controller
@RequestMapping("/booking")
public class BookingController {

	@Autowired
	public RoomService rService;

	@GetMapping("")
	public String booking() {
		return "booking/booking";
	} // booking page

	@GetMapping("/reservation/{no}")
	public String booking(@PathVariable("no") int no, Model model) {
		model.addAttribute("room_Info", rService.readRoomInfo(no));
		return "booking/booking";
	}
}
