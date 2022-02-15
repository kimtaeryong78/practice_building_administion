package com.cosmos.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
@RequestMapping("")
public class MainController {

	private final BookService bService;
	private final ConsultationService cService;
	private final NoticeService nService;
	private final OptionService oService;
	private final RoomService rService;
	private final SliderService sService;

	@Autowired
	public MainController(BookService bService, ConsultationService cService, NoticeService nService,
			OptionService oService, RoomService rService, SliderService sService) {
		this.bService = bService;
		this.cService = cService;
		this.nService = nService;
		this.oService = oService;
		this.rService = rService;
		this.sService = sService;
	}

	@GetMapping("")
	public String main(HttpServletRequest req, Model model) {
		// current server location
		String filePath = req.getServletContext().getRealPath("/");
		// image file list at filepath
		ArrayList<String> folderList = FolderArray.getFileName(filePath);
		// sliderImage List
		ArrayList<SliderImagesDTO> sliderList = sService.readSlider();
		// room info List
		ArrayList<RoomDTO> roomList = rService.readAllRoomInfo();
		// decorded slider image list
		ArrayList<SliderImagesDTO> filteredSliderList = new ArrayList<SliderImagesDTO>();
		// decorded room image map <room_num,ArrayList<String>>
		Map<String, ArrayList<String>> roomImageMap = new HashMap<String, ArrayList<String>>();
		// decording slider images
		for (SliderImagesDTO slider : sliderList) {
			SliderImagesDTO filtered = new SliderImagesDTO();
			String file_origin_name = slider.getFile_name();
			String extension = file_origin_name.substring(file_origin_name.lastIndexOf("."));
			for (String file : folderList) {
				if (slider.getFile_name().equalsIgnoreCase(SHA256.encoding(file) + extension)) {
					filtered.setFile_name(file + extension);
				}
			}
			filteredSliderList.add(filtered);
		}
		// decording room images
		for (RoomDTO room : roomList) {
			ArrayList<String> filteredRoomImageList = new ArrayList<String>();
			String[] images = room.getImages().split("/");
			for (String image : images) {
				String extension = image.substring(image.lastIndexOf("."));
				for (String file : folderList) {
					if (image.equalsIgnoreCase(SHA256.encoding(file) + extension)) {
						filteredRoomImageList.add(file + extension);
					}
				}
			}
			roomImageMap.put(room.getRoom_num(), filteredRoomImageList);
		}
		// notice
		ArrayList<NoticeDTO> noticeList = nService.readAllNotice();
		int noticeCount = nService.countNotice();
		ArrayList<BookingDTO> bookList = bService.readAllBooking();
		ArrayList<OptionsDTO> optionList = oService.readAllOptions();

		ConsultationDTO consultation = new ConsultationDTO();
		HashMap<String, Object> boardMap = new HashMap<String, Object>();
		if ((consultation.getContents() == null || consultation.getTitle() == null || consultation.getName() == null)) {
			consultation.setLock_flag(null);
		} else {
			consultation.setLock_flag("0");
		}
		boardMap.put("cri", new Criteria());
		boardMap.put("board", consultation);

		ArrayList<ConsultationDTO> consultationList = cService.readAllBoard(boardMap);
		int boardCount = cService.allNumberBoard();

		ArrayList<OptionsDTO> optionsList = oService.readAllOptions();

		model.addAttribute("sliderList", filteredSliderList);
		model.addAttribute("roomList", roomList);
		model.addAttribute("imageMap", roomImageMap);

		model.addAttribute("bookList", bookList);
		model.addAttribute("optionList", optionList);

		model.addAttribute("boardList", consultationList);
		model.addAttribute("boardCount", boardCount);
		model.addAttribute("pageProp", new PageDTO(new Criteria(), boardCount));

		model.addAttribute("noticeList", noticeList);
		model.addAttribute("noticePageProp", new PageDTO(new Criteria(), noticeCount));

		model.addAttribute("optionsList", optionsList);
		return "";
	}

	@GetMapping("admin")
	public String main() {
		return "admin/login";
	}

}
