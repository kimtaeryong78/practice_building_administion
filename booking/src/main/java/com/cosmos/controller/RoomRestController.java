package com.cosmos.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cosmos.dto.RoomDTO;
import com.cosmos.service.RoomService;
import com.cosmos.util.FolderArray;

@RestController
@RequestMapping("/ajax")
public class RoomRestController {

	@Autowired
	public RoomService rService;

	@GetMapping(value = "/room", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public Map<String, Object> totalRoomInfo(HttpServletRequest req) {
		Map<String, Object> roomMap = new HashMap<String, Object>();
		Map<String, Object> imageMap = new HashMap<String, Object>();

		List<RoomDTO> roomList = rService.readAllRoomInfo();
		String filePath = req.getServletContext().getRealPath("/");

		for (RoomDTO room : roomList) {
			try {
				imageMap.put(room.getRoom_num(), rService.readImageList(room.getNo(), FolderArray.getFileName(filePath)));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		roomMap.put("roomList", roomList);
		roomMap.put("imageList", imageMap);

		return roomMap;
	}

	@GetMapping(value = "/room/{no}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public RoomDTO roomInfo(@PathVariable("no") int no) {
		return rService.readRoomInfo(no);
	}

}
