package com.cosmos.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.cosmos.dto.ConsultationDTO;

@Service
public interface ConsultationService {
	public int allNumberBoard();

	public ConsultationDTO readBoard(int no);

	public int nextBoardNumber();

	public int allNumberApply(int grno);

	public String writeBoard(ConsultationDTO consultation);

	public String modifyBoard(ConsultationDTO consultation);

	public String deleteBoard(ConsultationDTO consultation);

	ArrayList<ConsultationDTO> readAllBoard(HashMap<String, Object> board);
}
