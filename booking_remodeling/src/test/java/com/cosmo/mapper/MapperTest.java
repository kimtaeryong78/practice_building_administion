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

	@Test
	public void initTest() {
		System.out.println(bMapper.getAllBooking());
		System.out.println(oMapper.getAllOptions());
		System.out.println(rMapper.getAllMyRoomInfo());
		System.out.println(sMapper.getSliders());
	}
}