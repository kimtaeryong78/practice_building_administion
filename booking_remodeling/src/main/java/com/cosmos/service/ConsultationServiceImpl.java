package com.cosmos.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosmos.dto.ConsultationDTO;
import com.cosmos.mapper.ConsultationMapper;

@Service
public class ConsultationServiceImpl implements ConsultationService {

	@Autowired
	public ConsultationMapper cMapper;

	@Override
	public int allNumberBoard() {
		int boardNumber = cMapper.allCountBoard();
		return boardNumber;
	}

	@Override
	public ArrayList<ConsultationDTO> readAllBoard(HashMap<String, Object> board) {
		ArrayList<ConsultationDTO> list = cMapper.getAllBoard(board);
		return list;
	}

	@Override
	public int allNumberApply(int grno) {
		int applyNumber = cMapper.countApply(grno);
		return applyNumber;
	}

	@Override
	public String writeBoard(ConsultationDTO consultation) {
		String result = null;
		try {
			cMapper.insertBoard(consultation);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}
		return result;
	}

	@Override
	public String modifyBoard(ConsultationDTO consultation) {
		String result = null;
		try {
			cMapper.updateBoard(consultation);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}
		return result;
	}

	@Override
	public ConsultationDTO readBoard(int no) {
		ConsultationDTO consultation = new ConsultationDTO();
		consultation = cMapper.getBoard(no);
		return consultation;
	}

	@Override
	public int nextBoardNumber() {
		return cMapper.getNextBoardNum();
	}
}
