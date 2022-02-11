package com.cosmos.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.cosmos.dto.OptionsDTO;
import com.cosmos.mapper.OptionMapper;

@Service
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
	public OptionsDTO readOptions(int no) {
		return oMapper.getOptions(no);
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
