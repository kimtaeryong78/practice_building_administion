package com.cosmos.Service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cosmos.dto.ConsultationDTO;
import com.cosmos.service.ConsultationService;
import com.cosmos.service.NoticeService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ServiceTest {
	@Autowired
	public NoticeService nService;

	@Autowired
	public ConsultationService cService;

	@Test
	public void Test() {
		// System.out.println(Cservice.readAllBoard());
		ConsultationDTO consultation = new ConsultationDTO();
		consultation.setNo(100);
		consultation.setTitle("modify1234あかさた漢字");
		consultation.setContents("modify1234あかさた漢字");
		consultation.setName("modify1234あかさた漢字");
		consultation.setPasswd("modify1234あかさた漢字");
		consultation.setLock_flag("1");
		consultation.setDelete_flag("1");

		System.out.println(consultation);

		cService.modifyBoard(consultation);
	}

	@Test
	public void Test1() {
		System.out.println(nService.readMainNotice());
	}

}
