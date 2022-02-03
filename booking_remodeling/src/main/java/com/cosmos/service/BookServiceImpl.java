package com.cosmos.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.cosmos.dto.BookingDTO;
import com.cosmos.mapper.BookMapper;

@Service
public class BookServiceImpl implements BookService {

	private final BookMapper bookMapper;

	public BookServiceImpl(BookMapper bookMapper) {
		this.bookMapper = bookMapper;
	}

	@Override
	public ArrayList<BookingDTO> readAllBooking() {
		// get all booking list
		return bookMapper.getAllBooking();
	}

	@Override
	public BookingDTO readBooking(int no) {
		return bookMapper.getBooking(no);
	}

	@Override
	public String modifyBooking(BookingDTO booking) {
		try {
			bookMapper.modifyBooking(booking);
			return "success";
		} catch (Exception e) {
			return "fail";
		}
	}

	@Override
	public String writeBooking(BookingDTO booking) {
		try {
			bookMapper.insertBooking(booking);
			return "success";
		} catch (Exception e) {
			return "fail";
		}
	}

	@Override
	public String deleteBooking(BookingDTO booking) {
		try {
			booking.setDelete_flag("1");
			bookMapper.modifyBooking(booking);
			return "success";
		} catch (Exception e) {
			return "fail";
		}
	}
}
