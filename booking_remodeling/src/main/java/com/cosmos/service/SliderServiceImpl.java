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

	@Override
	public String writeSlider(SliderImagesDTO sliderDTO) {
		try {
			sMapper.insertSlider(sliderDTO);
			return "success";
		} catch (Exception e) {
			return "fail";
		}
	}

	@Override
	public String modifySlider(SliderImagesDTO sliderDTO) {
		try {
			sMapper.updateSlider(sliderDTO);
			return "success";
		} catch (Exception e) {
			return "fail";
		}

	}

	@Override
	public String removeSlider(SliderImagesDTO sliderDTO) {
		try {
			sliderDTO.setDelete_flag("1");
			sMapper.updateSlider(sliderDTO);
			return "success";
		} catch (Exception e) {
			return "fail";
		}
	}

	@Override
	public ArrayList<SliderImagesDTO> readAllSlider() {
		return sMapper.getSliderList();
	}
}
