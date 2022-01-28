package com.cosmos.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosmos.dto.NoticeDTO;
import com.cosmos.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	public NoticeMapper noticeMapper;

	@Override
	public int countNotice() {
		return noticeMapper.getAllNoticeNumber();
	}

	@Override
	public ArrayList<NoticeDTO> readAllNotice(HashMap<String, Object> noticeMap) {
		ArrayList<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
		noticeList = noticeMapper.getAllNotice(noticeMap);
		return noticeList;
	}

	@Override
	public ArrayList<NoticeDTO> readMainNotice() {
		ArrayList<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
		noticeList = noticeMapper.getMainNotice();
		return noticeList;
	}
	@Override
	public NoticeDTO readNotice(int no) {
		return noticeMapper.getNotice(no);
	}

	@Override
	public String writeNotice(NoticeDTO notice) {
		String result = null;
		try {
			noticeMapper.insertNotice(notice);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}
		return result;
	}

	@Override
	public String removeNotice(int no) {
		NoticeDTO notice = new NoticeDTO();
		notice.setNo(no);
		notice.setDelete_flag("1");
		String result = null;
		try {
			noticeMapper.updateNotice(notice);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}
		return result;
	}

	@Override
	public String modifyNotice(NoticeDTO notice) {
		String result = null;
		try {
			noticeMapper.updateNotice(notice);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}
		return result;
	}

}
