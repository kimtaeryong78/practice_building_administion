package com.cosmos.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.cosmos.dto.OptionsDTO;

@Mapper
public interface OptionMapper {
	public ArrayList<OptionsDTO> getAllOptions();

	public OptionsDTO getOptions(int no);

	public void insertOptions(OptionsDTO options);

	public void updateOptions(OptionsDTO options);
}
