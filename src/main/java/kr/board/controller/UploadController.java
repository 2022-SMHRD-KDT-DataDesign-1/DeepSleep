package kr.board.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

		memberMapper.downLoad(r);

	}
	
	// repository 저장
	@ResponseBody
	@PostMapping("repositorySave")
	public String repositorySave(@RequestBody List<HashMap<String, Object>> param, HttpSession session) {
		System.out.println("통신 o");
		System.out.println(param);
		
		int user_idx = ((Member)session.getAttribute("mvo")).getId();
		System.out.println("세션값: " + user_idx);
		
		Gson gson = new Gson();
		for(HashMap<String, Object> i : param) {
			Repository r = gson.fromJson(i.toString(), Repository.class);
			r.setUser_idx(user_idx);
			System.out.println(r.toString());
			memberMapper.downLoad(r);
		}
		
		
		return "tables";
	}
	
	
}
