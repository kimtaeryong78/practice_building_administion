package com.cosmos.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.cosmos.dto.NoticeDTO;

@Mapper
public interface NoticeMapper {
	public int getAllNoticeNumber();

	public ArrayList<NoticeDTO> getAllNotice();

	public ArrayList<NoticeDTO> getMainNotice();

	public NoticeDTO getNotice(int no);

	public void insertNotice(NoticeDTO notice);

	public void updateNotice(NoticeDTO notice);

}
