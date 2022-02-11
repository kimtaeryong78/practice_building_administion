package com.cosmos.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.cosmos.dto.SliderImagesDTO;

@Service
public interface SliderService {
	public ArrayList<SliderImagesDTO> readSlider();

	public ArrayList<SliderImagesDTO> readAllSlider();

	public String modifySlider(SliderImagesDTO sliderDTO);

	public String writeSlider(SliderImagesDTO sliderDTO);

	public String removeSlider(SliderImagesDTO sliderDTO);
}
