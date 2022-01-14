package com.cosmos.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SliderMapper {

	public ArrayList<SliderMapper> getSliders();

}
