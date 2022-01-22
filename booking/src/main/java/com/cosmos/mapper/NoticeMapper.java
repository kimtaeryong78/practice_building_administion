package com.cosmos.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.cosmos.dto.NoticeDTO;

@Mapper
public interface NoticeMapper {

	public ArrayList<NoticeDTO> getAllNotice();

	public ArrayList<NoticeDTO> getMainNotice();

	public NoticeDTO getNotice(int no);

	public String insertNotice(NoticeDTO notice);

	public String updateNotice(NoticeDTO notice);

}
