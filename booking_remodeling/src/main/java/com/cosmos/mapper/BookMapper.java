package com.cosmos.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.cosmos.dto.BookingDTO;

@Mapper
public interface BookMapper {
	public ArrayList<BookingDTO> getAllBooking(); // select * from booking

	public BookingDTO getBooking(int no);

	public void insertBooking(BookingDTO booking);

	public void modifyBooking(BookingDTO booking);
}
