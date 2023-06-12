package kr.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.board.entity.Member;
import kr.board.entity.Repository;
import kr.board.mapper.MemberMapper;
import kr.security.service.UserSHA256;

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
	
	// DB에 이미지 저장
	@GetMapping("downLoad.do")
	public void downLoad(Member m, Repository r) {

		memberMapper.downLoad(r);

	}	

}
