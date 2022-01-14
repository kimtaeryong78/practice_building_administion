package com.cosmos.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/room")
public class RoomController {

	@GetMapping("/roomWriting")
	public String roomSetting() {
		return "roomWriting";
	}

}
