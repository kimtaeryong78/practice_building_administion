package com.cosmos.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.cosmos.dto.OptionsDTO;

@Service
public interface OptionService {
	public ArrayList<OptionsDTO> readAllOptions();

	public String writeOptions(OptionsDTO options);

	public String modifyOptions(OptionsDTO options);

	public String delteOptions(OptionsDTO options);
}
