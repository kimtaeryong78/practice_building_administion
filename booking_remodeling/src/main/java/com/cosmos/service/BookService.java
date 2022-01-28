package com.cosmos.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.cosmos.dto.BookingDTO;

@Service
public interface BookService {

	public ArrayList<BookingDTO> readAllBooking();

	public ArrayList<BookingDTO> readBooking(int no);
}
