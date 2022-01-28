package com.cosmos.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.cosmos.dto.SliderImagesDTO;
import com.cosmos.mapper.SliderMapper;

@Service
public class SliderServiceImpl implements SliderService {

	private final SliderMapper sMapper;

	public SliderServiceImpl(SliderMapper sMapper) {
		this.sMapper = sMapper;
	}

	@Override
	public ArrayList<SliderImagesDTO> readSlider() {
		ArrayList<SliderImagesDTO> SliderList = sMapper.getSliders();
		return SliderList;
	}
}
