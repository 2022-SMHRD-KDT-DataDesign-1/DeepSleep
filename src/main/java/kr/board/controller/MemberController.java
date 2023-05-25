package kr.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.board.entity.Member;
import kr.board.mapper.MemberMapper;

@Controller
public class MemberController {
	
	
	@Autowired
	private MemberMapper memberMapper;
	
	// 로그인 페이지로 이동
	@GetMapping("loginForm.do")
	public String loginForm() {
		return "member/loginForm";
	}
	
	// 로그인 기능
	@PostMapping("login.do")
	public String login(Member m,HttpSession session) {
		
		Member mvo = memberMapper.login(m);
		
		if(mvo != null) {
			session.setAttribute("mvo", mvo);
			System.out.println(mvo.toString());
			
			return "redirect:/";
		}else {
			
			return "redirect:/loginForm.do";
		}
		
	}
	
}
