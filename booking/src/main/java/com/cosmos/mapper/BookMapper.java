package com.cosmos.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.cosmos.dto.BookingDTO;

@Mapper
public interface BookMapper {

	@Select("select current_date")
	public String getCurrentDate(); // practice

	public String getCurrentDate2(); // xml practice

////////////////////////////////////////////////////////////////////	

	public ArrayList<BookingDTO> getAllBooking(); // select * from booking

}
