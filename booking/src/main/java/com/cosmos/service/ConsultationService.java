package com.cosmos.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.cosmos.dto.ConsultationDTO;

@Service
public interface ConsultationService {
	public int allNumberBoard();

	public ArrayList<ConsultationDTO> readAllBoard();

	public int allNumberApply(int grno);

	public String writeBoard(ConsultationDTO consultation);

	public String modifyBoard(ConsultationDTO consultation);
}
