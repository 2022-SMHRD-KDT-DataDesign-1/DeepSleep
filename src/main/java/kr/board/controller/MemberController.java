package kr.board.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Locale;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.board.entity.Member;
import kr.board.mapper.MemberMapper;
import kr.security.service.UserSHA256;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper memberMapper;
	
	// index 테스트용
		@GetMapping("index")
		public String index() {
			return "index";
		}
		@GetMapping("objectdetection")
		public String objectdetection() {
			return "objectdetection";
		}
	
	
	// main
	@GetMapping("/")
	public String main() {
		return "main";
	}

	// 회원가입 페이지 이동
	@GetMapping("signUpForm")
	public String signUpForm() {
		return "member/signUpForm";
	}

	// 비밀번호 변경 페이지 이동
	@GetMapping("forgetPwForm")
	public String forgetPwForm() {
		return "member/forgetPwForm";
	}


	// 회원가입 기능
	@PostMapping("SignUp.do")
	public String SignUp(Member m, HttpSession session) {

		if (m.getEmail() == null || m.getEmail().equals("") || m.getNickname() == null || m.getNickname().equals("")
				|| m.getPassword() == null || m.getPassword().equals("")) {
			System.out.println("실패");
			return "redirect:signUpForm";
		} else {

			// 암호 확인
			System.out.println("첫번째:" + m.getPassword());
			// 비밀번호 암호화 (sha256)
			String encryPassword = UserSHA256.encrypt(m.getPassword());
			m.setPassword(encryPassword);
			System.out.println("두번째:" + m.getPassword());

			int cnt = memberMapper.SignUp(m);

			if (cnt == 1) {
				session.setAttribute("mvo", m);
				return "redirect:/";
			} else {
				return "redirect:signUpForm";
			}
		}

	}

	// 로그인 기능
	@PostMapping("login.do") // AJAX : 일반 로그인
	public String login(Member m, HttpSession session) {
		
		String encryPassword = UserSHA256.encrypt(m.getPassword());
		m.setPassword(encryPassword);
		Member mvo = memberMapper.login(m);

		if (mvo != null) {
			session.setAttribute("mvo", mvo);
			System.out.println(mvo.toString());
			return "redirect:/";
		} else {
			return "redirect:/";
		}

	}

	// 회원 인증 기능
	@GetMapping("registerCheck.do")
	public @ResponseBody int registerCheck(@RequestParam("email") String email) {

		Member m = memberMapper.registerCheck(email);

		if (email.equals("") || m == null) {
			return 0;
		} else {
			return 1;
		}
	}

	// 비밀번호 변경 기능
	@PostMapping("forgetPw.do")
	public String forgetPw(Member m, HttpSession session, RedirectAttributes rttr) {

		if (m.getEmail() == null || m.getEmail().equals("") || m.getPassword() == null || m.getPassword().equals("")) {
			System.out.println("실패");

			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "모든 내용을 입력하세요");

			return "redirect:forgetPwForm";
		} else {

			// 암호 확인
			System.out.println("첫번째:" + m.getPassword());
			// 비밀번호 암호화 (sha256)
			String encryPassword = UserSHA256.encrypt(m.getPassword());
			m.setPassword(encryPassword);
			System.out.println("두번째:" + m.getPassword());
			int cnt = memberMapper.forgetPw(m);

			if (cnt > 0) {
				System.out.println(m.toString());

				rttr.addFlashAttribute("msgType", "성공 메세지");
				rttr.addFlashAttribute("msg", "비밀번호 변경 성공. 다시 로그인 하세요");

				return "redirect:/";

			} else {
				return "redirect:forgetPwForm";
			}
		}
	}

	// 로그아웃 기능
	@GetMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

}
