package com.cosmos.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.cosmos.dto.RoomDTO;
import com.cosmos.mapper.RoomMapper;
import com.cosmos.util.Checksum;

@Service
public class RoomServiceImpl implements RoomService {

	private final RoomMapper rMapper;

	public RoomServiceImpl(RoomMapper rMapper) {
		this.rMapper = rMapper;
	}

	@Override
	public ArrayList<RoomDTO> readAllRoomInfo() {
		return rMapper.getAllMyRoomInfo();
	}

	@Override
	public RoomDTO readRoomInfo(int no) {
		return rMapper.getMyRoomInfoAtNo(no);
	}

	@Override
	public ArrayList<String> readImageList(int no, ArrayList<String> fileList) throws Exception {
		return Checksum.checksum(fileList, rMapper.getMyRoomInfoAtNo(no).getImages().split("/"));
	}

	@Override
	public String writeRoom(RoomDTO room) {
		try {
			rMapper.insertMyRoomInfo(room);
			return "success";
		} catch (Exception e) {
			return "fail";
		}
	}

	@Override
	public String modifyRoom(RoomDTO room) {
		try {
			rMapper.updateRoomInfo(room);
			return "success";
		} catch (Exception e) {
			return "fail";
		}
	}

	@Override
	public String removeRoom(RoomDTO room) {
		try {
			room.setDelete_code("1");
			rMapper.updateRoomInfo(room);
			return "success";
		} catch (Exception e) {
			return "fail";
		}
	}

}
