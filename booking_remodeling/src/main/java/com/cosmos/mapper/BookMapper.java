package com.cosmos.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.cosmos.dto.BookingDTO;

@Mapper
public interface BookMapper {
	/*
	 * @Select("select current_date") public String getCurrentDate(); //
	 * practice
	 * 
	 * public String getCurrentDate2(); // xml practice
	 */
	////////////////////////////////////////////////////////////////////
	public ArrayList<BookingDTO> getAllBooking(); // select * from booking

	public ArrayList<BookingDTO> getBooking(int no);

	public String insertBooking(BookingDTO booking);

	public int getPresentCost();

	public String modifyBooking(BookingDTO booking);
}
