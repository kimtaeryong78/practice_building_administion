package com.cosmos.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cosmos.dto.SliderImagesDTO;
import com.cosmos.service.BookService;
import com.cosmos.service.ConsultationService;
import com.cosmos.service.RoomService;
import com.cosmos.service.SliderService;
import com.cosmos.util.FolderArray;
import com.cosmos.util.SHA256;

@Controller
@RequestMapping("")
public class MainController {

	private final BookService bService;
	private final ConsultationService cService;
	// private final noticeService nService;
	// private final optionsService oService;
	private final RoomService rService;
	private final SliderService sService;

	@Autowired
	public MainController(BookService bService, ConsultationService cService, RoomService rService, SliderService sService) {
		this.bService = bService;
		this.cService = cService;
		this.rService = rService;
		this.sService = sService;
	}

	@GetMapping("")
	public String main(HttpServletRequest req, Model model) {
		String filePath = req.getServletContext().getRealPath("/");
		ArrayList<String> folderList = FolderArray.getFileName(filePath);
		ArrayList<SliderImagesDTO> sliderList = sService.readSlider();
		ArrayList<SliderImagesDTO> filteredSliderList = new ArrayList<SliderImagesDTO>();
		for (SliderImagesDTO slider : sliderList) {
			SliderImagesDTO filtered = new SliderImagesDTO();
			System.out.println(slider.toString());
			for (String file : folderList) {
				if (slider.getFile_name().equalsIgnoreCase(SHA256.encoding(file) + ".jpg")) {
					filtered.setFile_name(file + ".jpg");
				}
			}
			filteredSliderList.add(filtered);
		}
		model.addAttribute("sliderList", filteredSliderList);

		return "";
	}
}
