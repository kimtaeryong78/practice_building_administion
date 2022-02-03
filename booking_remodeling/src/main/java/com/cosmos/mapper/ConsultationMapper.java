package com.cosmos.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.cosmos.dto.ConsultationDTO;

@Mapper
public interface ConsultationMapper {
	public int allCountBoard();

	public ConsultationDTO getBoard(int no);

	public int getNextBoardNum();

	public int countApply(int grno);

	public void insertBoard(ConsultationDTO consultation);

	public void updateBoard(ConsultationDTO consultation);

	public ArrayList<ConsultationDTO> getAllBoard(HashMap<String, Object> boardMap);
}
