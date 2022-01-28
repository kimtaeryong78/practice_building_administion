package com.cosmos.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosmos.dto.RoomDTO;
import com.cosmos.mapper.RoomMapper;
import com.cosmos.util.Checksum;

@Service
public class RoomServiceImpl implements RoomService {

	@Autowired
	public RoomMapper rMapper;

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

}
