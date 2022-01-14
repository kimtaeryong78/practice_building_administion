package com.cosmos.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.cosmos.dto.RoomDTO;

@Mapper
public interface RoomMapper {

	public ArrayList<RoomDTO> getAllRoomInfo();
}
