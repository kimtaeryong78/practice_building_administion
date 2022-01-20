package com.cosmos.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.cosmos.dto.NoticeDTO;

@Service
public interface NoticeService {
	public ArrayList<NoticeDTO> readAllNotice();

	public ArrayList<NoticeDTO> readMainNotice(); // 六つ

	public String writeNotice(NoticeDTO notice);

	public String removeNotice(int no);

	public String modifyNotice(NoticeDTO notice);
}
