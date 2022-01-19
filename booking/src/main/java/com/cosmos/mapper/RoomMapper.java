package com.cosmos.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.cosmos.dto.RoomDTO;

@Mapper
public interface RoomMapper {

	public ArrayList<RoomDTO> getAllMyRoomInfo();

	public RoomDTO getMyRoomInfoAtNo(int no);

	public String insertMyRoomInfo(RoomDTO room_Info);

	public String modifyRoomInfo(RoomDTO room_Info);

	public String deleteRoomInfo(int no);

}
