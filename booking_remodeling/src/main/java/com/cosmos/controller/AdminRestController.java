package com.cosmos.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.cosmos.dto.BookingDTO;
import com.cosmos.dto.ConsultationDTO;
import com.cosmos.dto.NoticeDTO;
import com.cosmos.dto.OptionsDTO;
import com.cosmos.dto.RoomDTO;
import com.cosmos.dto.SliderImagesDTO;
import com.cosmos.service.BookService;
import com.cosmos.service.ConsultationService;
import com.cosmos.service.NoticeService;
import com.cosmos.service.OptionService;
import com.cosmos.service.RoomService;
import com.cosmos.service.SliderService;
import com.cosmos.util.SHA256;

@RestController
@RequestMapping("admin/ajax")
public class AdminRestController {

	private final ConsultationService cService;
	private final BookService bService;
	private final NoticeService nService;
	private final RoomService rService;
	private final SliderService sService;
	private final OptionService oService;

	@Autowired
	public AdminRestController(ConsultationService cService, BookService bService, NoticeService nService, RoomService rService, SliderService sService, OptionService oService) {
		this.cService = cService;
		this.bService = bService;
		this.nService = nService;
		this.rService = rService;
		this.sService = sService;
		this.oService = oService;
	}// injection

	//////////////////// board
	@PostMapping("insertBoard")
	public String insertBoard(ConsultationDTO consultation) {
		if (consultation.getGrno() == 0) {
			consultation.setGrno(cService.nextBoardNumber());
		}
		return cService.writeBoard(consultation);
	}

	@GetMapping("getBoard/{no}")
	public Map<String, Object> getBoard(@PathVariable("no") int no) {
		Map<String, Object> boardMap = new HashMap<String, Object>();
		ConsultationDTO board = cService.readBoard(no);
		boardMap.put("board", board);
		return boardMap;
	}

	@PostMapping("modifyBoard")
	public String modifyBoard(ConsultationDTO consultation) {
		return cService.modifyBoard(consultation);
	}
	//////////////////// notice
	@PostMapping("insertNotice")
	public String insertNotice(NoticeDTO notice) {
		return nService.writeNotice(notice);
	}

	@GetMapping("getNotice/{no}")
	public Map<String, Object> getNotice(@PathVariable("no") int no) {
		Map<String, Object> noticeMap = new HashMap<String, Object>();
		NoticeDTO notice = nService.readNotice(no);
		noticeMap.put("notice", notice);
		return noticeMap;
	}

	@PostMapping("modifyNotice")
	public String modifyNotice(NoticeDTO notice) {
		return nService.modifyNotice(notice);
	}

	/////////////////// booking
	@GetMapping("getAllBooking")
	public Map<Integer, ArrayList<BookingDTO>> getAllBooking() {
		Map<Integer, ArrayList<BookingDTO>> bookingMap = new HashMap<Integer, ArrayList<BookingDTO>>();
		ArrayList<BookingDTO> bookList = bService.readAllBooking();
		ArrayList<RoomDTO> roomList = rService.readAllRoomInfo();
		roomList.stream().forEach(room -> {
			bookingMap.put((Integer) room.getNo(), (ArrayList<BookingDTO>) bookList.stream().filter(book -> room.getNo() == book.getRoom_no()).collect(Collectors.toList()));
		});
		return bookingMap;
	}

	@GetMapping("getBooking/{no}")
	public Map<String, Object> getBooking(@PathVariable("no") int no) {
		Map<String, Object> bookingMap = new HashMap<String, Object>();
		BookingDTO booking = bService.readBooking(no);
		bookingMap.put("booking", booking);
		return bookingMap;
	}

	@PostMapping("modifyBooking")
	public String modifyBooking(BookingDTO booking) {
		return bService.modifyBooking(booking);
	}

	@PostMapping("writeBooking")
	public String writeBooking(BookingDTO booking) {
		return bService.writeBooking(booking);
	}
	///////////////////// options
	@PostMapping("insertOption")
	public String insertOption(OptionsDTO options) {
		return oService.writeOptions(options);
	}

	@GetMapping("getOption/{no}")
	public OptionsDTO getOption(@PathVariable("no") int no) {
		return oService.readOptions(no);
	}

	@PostMapping("modifyOption")
	public String modifyOption(OptionsDTO option) {
		return oService.modifyOptions(option);
	}

	////////////////////// slider
	@PostMapping("insertSilder")
	public String insertSilde(MultipartFile file, HttpServletRequest req) {
		// current server location
		String filePath = req.getServletContext().getRealPath("/") + "resources\\img\\";
		String file_origin_name = file.getOriginalFilename();
		String file_name = "/img/" + file_origin_name.substring(0, file_origin_name.lastIndexOf("."));
		String extension = file_origin_name.substring(file_origin_name.lastIndexOf(".") + 1);
		file_name = SHA256.encoding(file_name);

		File saveFile = new File(filePath, file_origin_name);
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}

		SliderImagesDTO sliderDTO = new SliderImagesDTO();
		sliderDTO.setFile_name(file_name + "." + extension);
		sService.writeSlider(sliderDTO);
		return "success";
	}

	@PostMapping("modifySlider")
	public String modifySlide(SliderImagesDTO slide) {
		return (sService.modifySlider(slide));
	}

	///////////////////////// room
	@GetMapping("getAllRoom")
	public Map<Integer, RoomDTO> getAllRoom() {
		Map<Integer, RoomDTO> roomMap = new HashMap<Integer, RoomDTO>();
		ArrayList<RoomDTO> roomList = rService.readAllRoomInfo();
		roomList.stream().forEach(room -> roomMap.put((Integer) room.getNo(), room));
		return roomMap;
	}

	@PostMapping("insertRoomImage/{no}")
	public String insertRoomImage(@PathVariable("no") int no, MultipartFile file, HttpServletRequest req) {
		// current server location
		String filePath = req.getServletContext().getRealPath("/") + "resources\\img\\";
		String file_origin_name = file.getOriginalFilename();
		String file_name = "/img/" + file_origin_name.substring(0, file_origin_name.lastIndexOf("."));
		String extension = file_origin_name.substring(file_origin_name.lastIndexOf(".") + 1);
		file_name = SHA256.encoding(file_name);

		File saveFile = new File(filePath, file_origin_name);
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		RoomDTO room = rService.readRoomInfo(no);
		String room_image = room.getImages();
		room.setImages(room_image + "/" + file_name + "." + extension);
		return rService.modifyRoom(room);
	}

	@PostMapping("modifyRoomImage/{no}")
	public String modifyRoomImage(@PathVariable("no") int no, @RequestParam(value = "removeImages[]") String[] removeImages, HttpServletRequest req) {
		// current server location
		String filePath = req.getServletContext().getRealPath("/") + "resources";
		RoomDTO room = rService.readRoomInfo(no);
		ArrayList<String> roomImages = new ArrayList<String>(Arrays.asList(room.getImages().split("/")));

		for (String s : removeImages) {
			File file = new File(filePath + s);
			String removetemp = SHA256.encoding(s.substring(0, s.length() - 4));
			System.out.println("remove file : " + s);
			System.out.println("remove file h : " + removetemp);
			for (int i = 0; i < roomImages.size(); i++) {
				String temp = roomImages.get(i).substring(0, roomImages.get(i).length() - 4);
				System.out.println("conf:" + temp);
				if (temp.equalsIgnoreCase(removetemp)) {
					roomImages.remove(i);
				}
			}
			file.delete();
		}

		String modifiedString = String.join("/", roomImages);
		room.setImages(modifiedString);
		return rService.modifyRoom(room);
	}

	@PostMapping("insertRoom")
	public String insertRoom() {
		return "success";
	}

	@PostMapping("modifyRoom")
	public String modifyRoom(RoomDTO room) {
		System.out.println(room);
		return rService.modifyRoom(room);
	}
}
