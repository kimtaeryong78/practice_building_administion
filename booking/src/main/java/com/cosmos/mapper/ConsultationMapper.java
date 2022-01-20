package com.cosmos.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.cosmos.dto.ConsultationDTO;

@Mapper
public interface ConsultationMapper {
	public int allCountBoard();

	public ArrayList<ConsultationDTO> getAllBoard();

	public ConsultationDTO getBoard(int no);

	public int getNextBoardNum();

	public int countApply(int grno);

	public void insertBoard(ConsultationDTO consultation);

	public void updateBoard(ConsultationDTO consultation);

}
