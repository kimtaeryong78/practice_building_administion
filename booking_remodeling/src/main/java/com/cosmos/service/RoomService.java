package com.cosmos.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.cosmos.dto.RoomDTO;

@Service
public interface RoomService {
	public ArrayList<RoomDTO> readAllRoomInfo();

	public RoomDTO readRoomInfo(int no);

	public ArrayList<String> readImageList(int no, ArrayList<String> fileList) throws Exception;

	public String writeRoom(RoomDTO room);

	public String modifyRoom(RoomDTO room);

}
