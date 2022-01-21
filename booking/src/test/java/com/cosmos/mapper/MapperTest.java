package com.cosmos.mapper;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cosmos.dto.RoomDTO;
import com.cosmos.util.Checksum;
import com.cosmos.util.FolderArray;

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
		// System.out.println(BMapper.getCurrentDate());
		// System.out.println(NMapper.getAllNotice());
		// System.out.println(NMapper.getMainNotice());
		// System.out.println(CMapper.getAllBoard());
		try {
			/*
			 * ConsultationDTO consultation = new ConsultationDTO();
			 * consultation.setGrno(1); consultation.setGrgrod(0);
			 * consultation.setDepth(0);
			 * consultation.setTitle("test1234あかさた漢字");
			 * consultation.setContents("test1234あかさた漢字");
			 * consultation.setName("test1234あかさた漢字");
			 * consultation.setPasswd("test1234あかさた漢字");
			 * consultation.setLock_flag("1"); consultation.setBuild_code(1);
			 * CMapper.insertBoard(consultation);
			 * System.out.println(consultation);
			 */
			/*
			 * ConsultationDTO consultation = new ConsultationDTO();
			 * consultation.setNo(100);
			 * consultation.setTitle("modify1234あかさた漢字");
			 * consultation.setContents("modify1234あかさた漢字");
			 * consultation.setName("modify1234あかさた漢字");
			 * consultation.setPasswd("modify1234あかさた漢字");
			 * consultation.setLock_flag("1"); consultation.setDelete_flag("1");
			 * System.out.println(consultation);
			 * cMapper.updateBoard(consultation);
			 */
			// rMapper.deleteRoomInfo(26);
			// rMapper.modifyRoomInfo(room);
			RoomDTO room = new RoomDTO();
			/*
			 * for (int j = 2; j < 6; j++) { room.setRoom_num("10" + j);
			 * room.setRoom_title("10" + j + "号室"); room.setMax((int)
			 * (Math.random() * 10)); room.setAdult_cost((int) (Math.random() *
			 * 1000)); room.setChild_cost((int) (Math.random() * 1000));
			 * room.setExplanation(j + "asfdjalskdfjlasdkjf" + j);
			 * room.setColor_code("asdfds"); String image = "" + (int)
			 * (Math.random() * 1000); image = SHA256.getEnc(image);
			 * room.setImages(image); rMapper.insertMyRoomInfo(room); }
			 */
			/*
			 * room.setNo(27); room.setRoom_num("10");
			 * room.setRoom_title("10号室"); room.setMax((int) (Math.random() *
			 * 10)); room.setAdult_cost((int) (Math.random() * 1000));
			 * room.setChild_cost((int) (Math.random() * 1000));
			 * room.setExplanation("../img/room_01.jpg");
			 * room.setColor_code("asdfds"); String image = "../img/room01.jpg";
			 * String temp =
			 * "e4a8cff7b8b9941a7bb683fe852c4d79e903a49d442cc07546177fd72bb78309";
			 * image = SHA256.getEnc(image); room.setImages(image);
			 * System.out.println(image);
			 * System.out.println(temp.equals(image));
			 */
			/*
			 * String[] image = {"/img/room01.jpg", "/img/room02.jpg",
			 * "/img/room03.jpg", "/img/room04.jpg", "/img/room05.jpg"};
			 * ArrayList<String> encImage = new ArrayList<String>(); for (String
			 * s : image) { System.out.println(s);
			 * System.out.println(SHA256.getEnc(s));
			 * encImage.add(SHA256.getEnc(s)); }
			 */
			String temp = rMapper.getMyRoomInfoAtNo(28).getImages();
			String[] imageList = temp.split("/");
			ArrayList<String> fileList = FolderArray.getFileName("C:\\Users\\1\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\booking\\");
			for (String s : Checksum.checksum(fileList, imageList)) {
				System.out.println(s);
			}
		} catch (Exception e) {
			System.out.println("fail");
			e.printStackTrace();
		}
	}

	@Test
	public void Test1() {
		// System.out.println(CMapper.countApply(1));
		// System.out.println(NMapper.getMainNotice());
		// System.out.println(rMapper.getAllMyRoomInfo());
		System.out.println(rMapper.getMyRoomInfoAtNo(27));
	}
	@Test
	public void Test2() throws NoSuchAlgorithmException {
		String image = "" + (int) (Math.random() * 1000);
		System.out.println(rMapper.getAllMyRoomInfo());

	}
}