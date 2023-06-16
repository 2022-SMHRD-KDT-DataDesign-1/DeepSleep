package kr.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.board.entity.Member;
import kr.board.entity.Repository;
import kr.board.mapper.MemberMapper;

@Controller
public class UploadController {
	@Autowired
	private MemberMapper memberMapper;

	// 이미지 업로드 페이지
	@GetMapping("imageupload")
	public String imageupload() {
		return "imageupload";
	}

	// 결과 확인 페이지
	@GetMapping("objectdetection")
	public String objectdetection() {
		return "objectdetection";
	}

	// 라벨 수정 페이지
	@GetMapping("labeledit")
	public String labeledit() {
		return "labeledit";
	}

	// DB에 이미지 저장
	@GetMapping("downLoad.do")
	public void downLoad(Member m, Repository r) {

		// memberMapper.downLoad(r);

	}

	// repository DB 저장
	@ResponseBody
	@PostMapping("repositorySave")
	public String repositorySave(@RequestBody List<HashMap<String, Object>> param, HttpSession session) {
		System.out.println("통신 o");
		System.out.println(param);

		int user_idx = ((Member) session.getAttribute("mvo")).getId();
		String category = "";
		String detected_object = "";
		String image_path = "";
		String result_path = "";

		System.out.println("세션값: " + user_idx);

		Gson gson = new Gson();
		List<Repository> list = new ArrayList<>();
		for (HashMap<String, Object> i : param) {

			// Repository r = gson.fromJson(i.toString(), Repository.class);
			System.out.println(i.getClass().getSimpleName());

			for (String key : i.keySet()) {
				System.out.println(key + ": " + i.get(key));
				if (key.equals("category")) {
					category = (String) i.get(key);
				} else if (key.equals("detected_object")) {
					detected_object = (String) i.get(key);
				} else if (key.equals("image_path")) {
					image_path = (String) i.get(key);
				} else if (key.equals("result_path")) {
					result_path = (String) i.get(key);
				}
			}

			Repository r = new Repository();
			r.setCategory(category);
			r.setDetected_object(detected_object);
			r.setImage_path(image_path);
			r.setResult_path(result_path);
			r.setUser_idx(user_idx);

			// System.out.println(r.toString());

			list.add(r);
		}

		memberMapper.downLoad(list);

		return "repository success";
	}

	@GetMapping("test")
	public String test() {
		return "test";
	}

	@ResponseBody
	@PostMapping("downloadZipFile.do")
	public void downloadZipFile(@RequestBody List<HashMap<String, Object>> param, HttpServletResponse response)
			throws FileNotFoundException, IOException {

		String zipPath = "C:\\Users\\SMHRD\\PycharmProjects\\pythonProject2\\data\\test.zip";

		// file 객체 만들 때는 filepath로 맵핑해줘야 하고
		// stream으로 읽을 때는 실제 경로를 그대로 적어줘야 함....

		// path 담을 list 생성
		List<String> pathList = new ArrayList<>();

		for (HashMap<String, Object> i : param) {
			System.out.println(i.get("path"));
			pathList.add((String) i.get("path")); // 리스트에 path 담아줌
		}

		// 압축될 zip 파일의 경로 지정
		String zipFolder = "/filepath/";
		// test.zip 이름으로 파일 객체 생성
		File zipFile = new File(zipFolder, "test.zip");
		byte[] buf = new byte[4096]; // Stream에 사용할 byte 지정

		System.out.println("여기까지 ㅇㅋ");
		// zip 파일 생성
		try (ZipOutputStream out = new ZipOutputStream(
				new FileOutputStream("C:\\Users\\SMHRD\\PycharmProjects\\pythonProject2\\data\\test.zip"))) {
			// 파일 객체 리스트로 loop
			System.out.println("여기까지 ㅇㅋ 2");
			for (String path : pathList) {

				String[] arr = path.split("\\\\");
				String fileName = arr[arr.length - 2] + "_" + arr[arr.length - 1];

				try (FileInputStream in = new FileInputStream(path)) {
					// 압축 되어지는 파일의 파일명을 지정
					ZipEntry ze = new ZipEntry(fileName);
					// 새 zip파일 항목 쓰기를 시작하고 항목 데이터의 시작에 스트림 배치
					out.putNextEntry(ze);
					int len;
					while ((len = in.read(buf)) > 0) {
						out.write(buf, 0, len);
					}
					// 스트림 배치
					out.closeEntry();
					// 압축 끝

				}
			} // for문 끝

			// 다운로드 기능
			System.out.println("다운로드 로직 시작");

			InputStream is = new FileInputStream("C:\\Users\\SMHRD\\PycharmProjects\\pythonProject2\\data\\test.zip");
			OutputStream os = response.getOutputStream();
			response.setHeader("Content-Disposition", "attachment; filename=\"test.zip" + "\";");
			response.setHeader("Content-Transfer-Encoding", "binary");

			FileCopyUtils.copy(is, os); // 다운로드 실행
			System.out.println("다운로드 완료");

			is.close();
		}

		// 끝

	}
}