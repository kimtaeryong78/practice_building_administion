package com.cosmos.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cosmos.dto.BookingDTO;
import com.cosmos.dto.Criteria;
import com.cosmos.dto.RoomDTO;
import com.cosmos.service.RoomService;
import com.cosmos.util.FolderArray;

@Controller
@RequestMapping("/booking")
public class BookingController {

	@Autowired
	public RoomService rService;

	@GetMapping("")
	public String booking(BookingDTO booking, Criteria cri, Model model, HttpServletRequest req) {
		ArrayList<RoomDTO> roomList = new ArrayList<RoomDTO>();
		Map<String, ArrayList<String>> imageMap = new HashMap<String, ArrayList<String>>();
		roomList = rService.readAllRoomInfo();

		String filePath = req.getServletContext().getRealPath("/");
		for (RoomDTO room : roomList) {
			try {
				imageMap.put(room.getRoom_num(), rService.readImageList(room.getNo(), FolderArray.getFileName(filePath)));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("roomList", roomList);
		model.addAttribute("imageMap", imageMap);
		model.addAttribute("title", "予約");
		model.addAttribute("text", "予約ページでございます。");
		return "booking/booking";
	} // booking page

	@GetMapping("/reservation/{no}")
	public String booking(@PathVariable("no") int no, Model model, HttpServletRequest req) {
		ArrayList<RoomDTO> roomList = new ArrayList<RoomDTO>();
		Map<String, ArrayList<String>> imageMap = new HashMap<String, ArrayList<String>>();
		roomList = rService.readAllRoomInfo();

		String filePath = req.getServletContext().getRealPath("/");
		for (RoomDTO room : roomList) {
			try {
				imageMap.put(room.getRoom_num(), rService.readImageList(room.getNo(), FolderArray.getFileName(filePath)));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("roomList", roomList);
		model.addAttribute("imageMap", imageMap);
		model.addAttribute("title", "予約");
		model.addAttribute("text", "予約ページでございます。");
		model.addAttribute("room_Info", rService.readRoomInfo(no));
		return "booking/booking";
	}
}
