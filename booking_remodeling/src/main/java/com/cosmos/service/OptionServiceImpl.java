package com.cosmos.service;

import java.util.ArrayList;

import com.cosmos.dto.OptionsDTO;
import com.cosmos.mapper.OptionMapper;

public class OptionServiceImpl implements OptionService {

	private final OptionMapper oMapper;

	public OptionServiceImpl(OptionMapper oMapper) {
		this.oMapper = oMapper;
	}

	@Override
	public ArrayList<OptionsDTO> readAllOptions() {
		return oMapper.getAllOptions();
	}

	@Override
	public String writeOptions(OptionsDTO options) {
		try {
			oMapper.insertOptions(options);
			return "success";
		} catch (Exception e) {
			return "fail";
		}
	}

	@Override
	public String modifyOptions(OptionsDTO options) {
		try {
			oMapper.updateOptions(options);
			return "success";
		} catch (Exception e) {
			return "fail";
		}
	}

	@Override
	public String delteOptions(OptionsDTO options) {
		try {
			options.setDelete_flag("1");
			oMapper.updateOptions(options);
			return "success";
		} catch (Exception e) {
			return "fail";
		}
	}

}
