package com.cosmos.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cosmos.dto.BookingDTO;
import com.cosmos.dto.DateDTO;
import com.cosmos.service.BookService;
import com.cosmos.service.RoomService;

@RestController
@RequestMapping("/ajax")
public class BookingRestController {
	@Autowired
	public BookService bService;

	@Autowired
	public RoomService rService;

	@GetMapping(value = "/booking", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public List<DateDTO> AllBookingDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");

		List<DateDTO> dateList = new ArrayList<DateDTO>();
		try {
			ArrayList<BookingDTO> list = bService.readAllBooking();
			for (BookingDTO booking : list) {
				DateDTO date = new DateDTO();
				date.setTitle(rService.readRoomInfo(booking.getRoom_no()).getRoom_title());
				date.setStart(dateFormat.format(sdf.parse(booking.getStart_date()).getTime()));
				date.setEnd(dateFormat.format(sdf.parse(booking.getEnd_date()).getTime()));
				dateList.add(date);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dateList;
	}

	@GetMapping(value = "/booking/{no}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public List<DateDTO> BookingDate(@PathVariable("no") int no) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");

		ArrayList<DateDTO> dateList = new ArrayList<DateDTO>();
		try {
			ArrayList<BookingDTO> list = bService.readBooking(no);
			for (BookingDTO booking : list) {
				DateDTO date = new DateDTO();
				date.setTitle(rService.readRoomInfo(booking.getRoom_no()).getRoom_title());
				date.setStart(dateFormat.format(sdf.parse(booking.getStart_date()).getTime()));
				date.setEnd(dateFormat.format(sdf.parse(booking.getEnd_date()).getTime()));
				dateList.add(date);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dateList;
	}

}
