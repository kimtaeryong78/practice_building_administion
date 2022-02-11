package com.cosmo.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cosmos.mapper.BookMapper;
import com.cosmos.mapper.ConsultationMapper;
import com.cosmos.mapper.NoticeMapper;
import com.cosmos.mapper.OptionMapper;
import com.cosmos.mapper.RoomMapper;
import com.cosmos.mapper.SliderMapper;
import com.cosmos.service.BookService;
import com.cosmos.service.ConsultationService;
import com.cosmos.service.NoticeService;
import com.cosmos.service.OptionService;
import com.cosmos.service.RoomService;
import com.cosmos.service.SliderService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MapperTest {
	@Autowired
	public BookMapper bMapper;

	@Autowired
	public ConsultationMapper cMapper;

	@Autowired
	public NoticeMapper nMapper;

	@Autowired
	public OptionMapper oMapper;

	@Autowired
	public RoomMapper rMapper;

	@Autowired
	public SliderMapper sMapper;

	@Autowired
	ConsultationService cService;
	@Autowired
	BookService bService;
	@Autowired
	NoticeService nService;
	@Autowired
	RoomService rService;
	@Autowired
	SliderService sService;
	@Autowired
	OptionService oService;

	@Test
	public void initTest() {
		System.out.println(bService.readBooking(117));
	}
}