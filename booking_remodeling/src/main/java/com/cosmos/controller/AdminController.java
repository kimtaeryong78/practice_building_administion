package com.cosmos.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cosmos.dto.BookingDTO;
import com.cosmos.dto.ConsultationDTO;
import com.cosmos.dto.Criteria;
import com.cosmos.dto.NoticeDTO;
import com.cosmos.dto.OptionsDTO;
import com.cosmos.dto.PageDTO;
import com.cosmos.dto.RoomDTO;
import com.cosmos.dto.SliderImagesDTO;
import com.cosmos.service.BookService;
import com.cosmos.service.ConsultationService;
import com.cosmos.service.NoticeService;
import com.cosmos.service.OptionService;
import com.cosmos.service.RoomService;
import com.cosmos.service.SliderService;
import com.cosmos.util.FolderArray;
import com.cosmos.util.SHA256;

@Controller
@RequestMapping("admin")
public class AdminController {

	/////// service area
	private final ConsultationService cService;
	private final RoomService rService;
	private final BookService bService;
	private final NoticeService nService;
	private final SliderService sService;
	private final OptionService oService;

	@Autowired
	public AdminController(ConsultationService cService, RoomService rService, BookService bService,
			NoticeService nService, SliderService sService, OptionService oService) {
		this.cService = cService;
		this.rService = rService;
		this.bService = bService;
		this.nService = nService;
		this.sService = sService;
		this.oService = oService;
	}

	///////////// admin main
	@GetMapping("main")
	public String adminMain() {
		return "admin/main";
	}

	///////////// admin login
	@PostMapping("login")
	public String adminLoginProcess(@RequestParam("id") String id, @RequestParam("password") String password,
			Model model, HttpServletRequest req) {
		if (id.equals("admin") && password.equals("admin")) {
			HttpSession session = req.getSession();
			session.setAttribute("id", id);
			session.setAttribute("password", password);
			model.addAttribute("message", "success");
			return "admin/main";
		} else {
			model.addAttribute("message", "fail");
			return "redirect:/admin";
		}
	}

	////////// admin logout
	@GetMapping("logout")
	public String logout(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		session.invalidate();
		model.addAttribute("message", "logout");
		return "redirect:/";
	}

	//////////////// consultation
	@GetMapping("consultation")
	public String consultationManagement(ConsultationDTO consultation, Criteria cri, Model model) {
		HashMap<String, Object> boardMap = new HashMap<String, Object>();

		if ((consultation.getContents() == null || consultation.getTitle() == null || consultation.getName() == null)) {
			consultation.setLock_flag(null);
		} else {
			consultation.setLock_flag("0");
		}

		boardMap.put("cri", cri);
		boardMap.put("board", consultation);

		ArrayList<ConsultationDTO> consultationList = cService.readAllBoard(boardMap);
		int boardCount = cService.allNumberBoard();
		model.addAttribute("title", "掲示板管理");
		model.addAttribute("boardList", consultationList);
		model.addAttribute("boardCount", boardCount);
		model.addAttribute("pageProp", new PageDTO(cri, boardCount));
		return "admin/consultation";
	}

	////// room
	@GetMapping("room")
	public String roomInfoManagement(Model model, HttpServletRequest req) {
		// current server location
		String filePath = req.getServletContext().getRealPath("/");
		// image file list at filepath
		ArrayList<String> folderList = FolderArray.getFileName(filePath);
		// room info List
		ArrayList<RoomDTO> roomList = rService.readAllRoomInfo();
		// decorded room image map <room_num,ArrayList<String>>
		Map<String, ArrayList<String>> roomImageMap = new HashMap<String, ArrayList<String>>();
		for (RoomDTO room : roomList) {
			ArrayList<String> filteredRoomImageList = new ArrayList<String>();
			String[] images = room.getImages().split("/");
			for (String image : images) {
				for (String file : folderList) {
					if (image.equalsIgnoreCase(SHA256.encoding(file) + ".jpg")) {
						filteredRoomImageList.add(".." + file + ".jpg");
					}
				}
			}
			roomImageMap.put(room.getRoom_num(), filteredRoomImageList);
		}
		model.addAttribute("title", "部屋情報管理");
		model.addAttribute("roomList", roomList);
		model.addAttribute("roomImageMap", roomImageMap);
		return "admin/room";
	}

	///////// notice
	@GetMapping("notice")
	public String noticeManagement(Model model) {
		ArrayList<NoticeDTO> noticeList = nService.readAllNotice();
		model.addAttribute("title", "お知らせ管理");
		model.addAttribute("noticeList", noticeList);
		return "admin/notice";
	}

	/////////// slider
	@GetMapping("slider")
	public String sliderManagement(HttpServletRequest req, Model model) {
		// current server location
		String filePath = req.getServletContext().getRealPath("/");
		// image file list at filepath
		ArrayList<String> folderList = FolderArray.getFileName(filePath);
		// sliderImage List
		ArrayList<SliderImagesDTO> sliderList = sService.readAllSlider();
		// decorded slider image list
		ArrayList<SliderImagesDTO> filteredSliderList = new ArrayList<SliderImagesDTO>();
		// decording slider images
		for (SliderImagesDTO slider : sliderList) {
			SliderImagesDTO filtered = slider;
			String file_origin_name = slider.getFile_name();
			String file_name = file_origin_name.substring(0, file_origin_name.lastIndexOf("."));
			String extension = file_origin_name.substring(file_origin_name.lastIndexOf("."));
			for (String file : folderList) {
				if (file_name.equalsIgnoreCase(SHA256.encoding(file))) {
					filtered.setFile_name(file + extension);
				}
			}
			filteredSliderList.add(filtered);
		}
		model.addAttribute("title", "スライドイメージ管理");
		model.addAttribute("sliderList", filteredSliderList);
		return "admin/slider";
	}

	@GetMapping("book")
	public String bookManagement(Model model) {
		ArrayList<BookingDTO> bookList = bService.readAllBooking();
		ArrayList<RoomDTO> roomList = rService.readAllRoomInfo();
		ArrayList<OptionsDTO> optionList = oService.readAllOptions();

		model.addAttribute("title", "予約情報管理");
		model.addAttribute("bookList", bookList);
		model.addAttribute("roomList", roomList);
		model.addAttribute("optionList", optionList);
		return "admin/book";
	}

	@GetMapping("options")
	public String optionsManagement(Model model) {
		model.addAttribute("title", "オプション管理");
		ArrayList<OptionsDTO> optionList = oService.readAllOptions();

		model.addAttribute("optionsList", optionList);
		return "admin/options";
	}
}
