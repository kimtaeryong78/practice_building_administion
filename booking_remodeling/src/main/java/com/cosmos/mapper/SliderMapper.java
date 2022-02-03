package com.cosmos.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.cosmos.dto.SliderImagesDTO;

@Mapper
public interface SliderMapper {

	public ArrayList<SliderImagesDTO> getSliders();

	public void updateSlider(SliderImagesDTO sliderDTO);

	public void insertSlider(SliderImagesDTO sliderDTO);
}
