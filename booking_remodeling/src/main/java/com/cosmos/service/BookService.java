package com.cosmos.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.cosmos.dto.BookingDTO;

@Service
public interface BookService {

	public ArrayList<BookingDTO> readAllBooking();

	public BookingDTO readBooking(int no);

	public String writeBooking(BookingDTO booking);

	public String modifyBooking(BookingDTO booking);

	public String deleteBooking(BookingDTO booking);
}
