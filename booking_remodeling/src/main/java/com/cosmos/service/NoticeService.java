package com.cosmos.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.cosmos.dto.NoticeDTO;

@Service
public interface NoticeService {
	public int countNotice();

	public ArrayList<NoticeDTO> readAllNotice(HashMap<String, Object> noticeMap);

	public ArrayList<NoticeDTO> readMainNotice(); // 六つ

	public NoticeDTO readNotice(int no);

	public String writeNotice(NoticeDTO notice);

	public String removeNotice(int no);

	public String modifyNotice(NoticeDTO notice);
}
