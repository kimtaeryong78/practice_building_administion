package com.cosmos.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cosmos.dto.ConsultationDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MapperTest {
	@Autowired
	public BookMapper BMapper;

	@Autowired
	public NoticeMapper NMapper;

	@Autowired
	public ConsultationMapper CMapper;

	@Test
	public void initTest() {
		// System.out.println(BMapper.getCurrentDate());
		// System.out.println(NMapper.getAllNotice());
		// System.out.println(NMapper.getMainNotice());
		// System.out.println(CMapper.getAllBoard());
		try {
			ConsultationDTO consultation = new ConsultationDTO();
			consultation.setGrno(1);
			consultation.setGrgrod(0);
			consultation.setDepth(0);
			consultation.setTitle("test1234あかさた漢字");
			consultation.setContents("test1234あかさた漢字");
			consultation.setName("test1234あかさた漢字");
			consultation.setPasswd("test1234あかさた漢字");
			consultation.setLock_flag("1");
			consultation.setBuild_code(1);
			CMapper.insertBoard(consultation);
			System.out.println(consultation);
		} catch (Exception e) {
			System.out.println("fail");
			e.printStackTrace();
		}
	}

	@Test
	public void Test1() {
		System.out.println(CMapper.countApply(1));
	}

}