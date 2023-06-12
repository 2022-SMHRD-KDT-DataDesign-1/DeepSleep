package kr.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


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

}
