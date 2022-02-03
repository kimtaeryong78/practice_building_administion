package com.cosmos.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.cosmos.dto.SliderImagesDTO;

@Service
public interface SliderService {
	public ArrayList<SliderImagesDTO> readSlider();

	public String modifySlider(SliderImagesDTO sliderDTO);

	public String insertSlider(SliderImagesDTO sliderDTO);

	public String deleteSlider(SliderImagesDTO sliderDTO);
}
