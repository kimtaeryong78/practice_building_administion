package com.cosmos.mapper;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cosmos.dto.NoticeDTO;
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
		// System.out.println(cMapper.getAllBoard(new Criteria(1, 10)));
		// System.out.println(CMapper.countApply(1));
		// System.out.println(NMapper.getMainNotice());
		// System.out.println(rMapper.getAllMyRoomInfo());
		// System.out.println(rMapper.getMyRoomInfoAtNo(27));
		// System.out.println(nMapper.getNotice(1));
		// System.out.println(cMapper.getAllBoard(new Criteria(1, 2)));
		/*
		 * ConsultationDTO consultation = new ConsultationDTO();
		 * System.out.println(consultation); HashMap<String, Object> map = new
		 * HashMap<String, Object>(); Criteria cri = new Criteria(1, 15);
		 * map.put("board", consultation); map.put("cri", cri);
		 * System.out.println(cMapper.getAllBoard(map));
		 */

		NoticeDTO notice = new NoticeDTO();
		notice.setTitle("【国内感染】新型コロナ 初の6万人超 過去最多更新 (25日19時)");
		notice.setContents("25日は午後7時の時点で全国で62612人の感染が発表されています。また大阪府で10人、北海道で4人、愛知県で4人、神奈川県で3人、千葉県で2人、埼玉県で2人、愛媛県で2人、鹿児島県で2人、三重県で1人、佐賀県で1人、兵庫県で1人、奈良県で1人、岐阜県で1人、広島県で1人、徳島県で1人、福岡県で1人、茨城県で1人、高知県で1人の合わせて39人の死亡の発表がありました。\r\n" + "\r\n" + "国内で感染が確認された人は空港の検疫などを含め228万7650人、クルーズ船の乗客・乗員が712人で合わせて228万8362人となっています。\r\n" + "\r\n" + "亡くなった人は国内で感染が確認された人が1万8567人、クルーズ船の乗船者が13人の合わせて1万8580人です。\r\n" + "\r\n" + "各自治体などによりますと、国内で感染が確認された人は累計で次のとおりです。\r\n" + "\r\n" + "（　）内は25日の新たな感染者数です。\r\n" + "\r\n" + "▽東京都は48万4463人（12813）\r\n" + "▽大阪府は27万6098人（8612）\r\n" + "▽神奈川県は20万7480人（4131）\r\n" + "▽埼玉県は14万4271人（3166）\r\n" + "▽愛知県は14万98人（4120）\r\n" + "▽千葉県は12万4798人（3251）\r\n" + "▽兵庫県は10万5722人（3360）\r\n" + "▽福岡県は10万450人（3389）\r\n" + "▽沖縄県は7万7102人（1175）\r\n" + "▽北海道は7万6542人（1536）\r\n" + "▽京都府は5万1734人（1622）\r\n" + "▽広島県は4万1886人（1099）\r\n" + "▽静岡県は3万8035人（1336）\r\n" + "▽茨城県は3万567人（611）\r\n" + "▽岐阜県は2万4638人（816）\r\n" + "▽群馬県は2万4286人（973）\r\n" + "▽熊本県は2万2366人（901）\r\n" + "▽岡山県は2万1082人（641）\r\n" + "▽奈良県は2万939人（494）\r\n" + "▽栃木県は2万591人（584）\r\n" + "▽三重県は1万8808人（382）\r\n" + "▽宮城県は1万8613人（331）\r\n" + "▽滋賀県は1万8490人（499）\r\n" + "▽長野県は1万4291人（448）\r\n" + "▽新潟県は1万3387人（432）\r\n" + "▽鹿児島県は1万3264人（526）\r\n" + "▽大分県は1万1245人（390）\r\n" + "▽福島県は1万1006人（220）\r\n" + "▽山口県は1万926人（385）\r\n" + "▽長崎県は1万885人（614）\r\n" + "▽石川県は1万267人（354）\r\n" + "▽宮崎県は9037人（311）\r\n" + "▽佐賀県は9017人（323）\r\n" + "▽愛媛県は8635人（367）\r\n" + "▽和歌山県は8393人（303）\r\n" + "▽青森県は8107人（196）\r\n" + "▽山梨県は7325人（371）\r\n" + "▽香川県は6508人（191）\r\n" + "▽富山県は5762人（100）\r\n" + "▽高知県は5029人（142）\r\n" + "▽山形県は4531人（153）\r\n" + "▽福井県は4486人（125）\r\n" + "▽徳島県は3999人（92）\r\n" + "▽岩手県は3993人（132）\r\n" + "▽島根県は3693人（129）\r\n" + "▽秋田県は2868人（245）\r\n" + "▽鳥取県は2687人（111）です。\r\n" + "\r\n" + "このほか\r\n" + "▽空港などの検疫での感染確認は9077人（110）\r\n" + "▽中国からのチャーター機で帰国した人と国の職員や検疫官などの感染は合わせて173人です。\r\n" + "\r\n" + "厚生労働省によりますと、新型コロナウイルスへの感染が確認された人で人工呼吸器や集中治療室などで治療を受けるなどしている重症者は25日時点で444人（＋5）となっています。\r\n" + "\r\n" + "一方、症状が改善して退院した人などは25日時点で\r\n" + "▽国内で感染が確認された人が183万8915人\r\n" + "▽クルーズ船の乗客・乗員が659人の合わせて183万9574人となっています。\r\n" + "\r\n" + "また23日の一日に行われた自主検査を除くPCR検査などの数は速報値で5万4332件でした。\r\n" + "\r\n" + "▽島根県　 1月24日 感染者3人追加。\r\n" + "▽千葉県　 1日9日 感染者1人取り下げ。\r\n" + "▽兵庫県　 1月22日 感染者1人取り下げ、1月23日 感染者1人取り下げ、\r\n" + "　　　　　 1月24日 死亡1人追加。\r\n" + "▽栃木県　 1月24日 感染者1人取り下げ。\r\n" + "▽神奈川県 1月23日 感染者2人取り下げ。\r\n" + "▽静岡県　 1月21日 感染者1人取り下げ。\r\n" + "▽埼玉県 　1月23日 感染者1人取り下げ、1月24日 感染者2人取り下げ。\r\n" + "▽福岡県 　1月23日 感染者1人取り下げ。\r\n" + "▽熊本県　 1月21日 感染者1人取り下げ、1月22日 感染者1人取り下げ、\r\n" + "　　　　　 1月23日 感染者1人取り下げ。\r\n" + "\r\n" + "・集計は後日、自治体などにより修正される可能性がありますが、過去の原稿はさかのぼって修正しないため累計数などで差が出ることがあります。\r\n" + "\r\n" + "・在日米軍の感染者は含めていません。");
		nMapper.insertNotice(notice);
	}
	@Test
	public void Test2() throws NoSuchAlgorithmException {
		String image = "" + (int) (Math.random() * 1000);
		System.out.println(rMapper.getAllMyRoomInfo());
	}

	@Test
	public void dateTest() {
		/*
		 * SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		 * SimpleDateFormat dateFormat = new
		 * SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss"); try {
		 * System.out.println(dateFormat.format(sdf.parse("20220213"))); } catch
		 * (ParseException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */

		System.out.println(bMapper.getBooking(6));
	}
}