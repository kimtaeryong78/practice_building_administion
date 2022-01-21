package com.cosmos.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cosmos.dto.RoomDTO;
import com.cosmos.service.RoomService;
import com.cosmos.util.FolderArray;

@Controller
@RequestMapping(value = "/room")
public class RoomController {

	@Autowired
	public RoomService rService;

	@GetMapping("roomWriting")
	public String roomSetting() {
		return "administrator/roomWriting";
	}

	@GetMapping("")
	public String roomInfo(HttpServletRequest req, Model model) {
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
		return "room/roomList";
	}

}
