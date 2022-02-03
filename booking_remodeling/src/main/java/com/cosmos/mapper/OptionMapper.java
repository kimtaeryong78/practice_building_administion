package com.cosmos.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.cosmos.dto.OptionsDTO;

@Mapper
public interface OptionMapper {
	public ArrayList<OptionsDTO> getAllOptions();

	public String insertOptions(OptionsDTO options);

	public String updateOptions(OptionsDTO options);
}
