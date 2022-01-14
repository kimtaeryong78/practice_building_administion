package com.cosmos.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.cosmos.dto.BookingDTO;
import com.cosmos.mapper.BookMapper;

public class BookServiceImpl implements BookService {

	@Autowired
	public BookMapper bookMapper;

	@Override
	public ArrayList<BookingDTO> readAllBooking() {
		// get all booking list
		return bookMapper.getAllBooking();
	}

}
