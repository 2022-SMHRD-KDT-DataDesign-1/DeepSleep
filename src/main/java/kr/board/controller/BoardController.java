package kr.board.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.board.entity.Board;
import kr.board.entity.Member;
import kr.board.mapper.BoardMapper;

@Controller
public class BoardController {

	@Autowired
	private BoardMapper boardmapper;

	// 보관 리스트 전체보기
	/*
	 * @GetMapping("tables") public String boardList(Model model,Member
	 * m,HttpSession session) { System.out.println("게시글 전체보기 실행");
	 * 
	 * int mvo = 0;
	 * 
	 * if(session.getAttribute("mvo") != null) {
	 * 
	 * int user_idx = ((Member)session.getAttribute("mvo")).getId();
	 * System.out.println("user_idx : "+ user_idx); List<Board> list =
	 * boardmapper.boardList(user_idx); model.addAttribute("list", list); }
	 * 
	 * return "tables"; }
	 */
	
	@GetMapping("tables")
	public String boardList(Model model,Member m,HttpSession session) {
		System.out.println("게시글 전체보기 실행");
		
		int mvo = 0;
		
		if(session.getAttribute("mvo") != null) {
			
			int user_idx = ((Member)session.getAttribute("mvo")).getId();
			System.out.println("user_idx : "+ user_idx);
				if(user_idx != 9) {
					List<Board> list = boardmapper.boardList(user_idx);
					model.addAttribute("list", list);
				}else {
					List<Board> list = boardmapper.adminList();
					model.addAttribute("list", list);
				}
		}
		
		return "tables";
	}
	
	// 삭제기능
	@GetMapping("boardDelete.do")
	public String boardDelete(@RequestParam("id") int id) {
		boardmapper.boardDelete(id);
		System.out.println("게시판 id : " + id);
		return "redirect:/tables";
	}
	
	// 월별 업로드 기능
		@RequestMapping("chartMonth.do")
		public @ResponseBody List<Board> chartMonth(@RequestParam("id") int id, Model model, Board vo) {
			List<Board> list = boardmapper.chartMonth(id);
			model.addAttribute("list", list);
			return list;
		}

		// 일별 업로드 기능
		@RequestMapping("chartDay.do")
		public @ResponseBody List<Board> chartDay(@RequestParam("id") int id, Model model, Board vo) {
			List<Board> list = boardmapper.chartDay(id);
			model.addAttribute("list", list);
			return list;
		}

		// 전체 사용자 월별 업로드 기능
		@RequestMapping("allChartMonth.do")
		public @ResponseBody List<Board> allChartMonth(Model model, Board vo) {
			List<Board> list = boardmapper.allChartMonth();
			model.addAttribute("list", list);
			return list;
		}

		// 전체 사용자 일별 업로드 기능
		@RequestMapping("allChartDay.do")
		public @ResponseBody List<Board> allChartDay(Model model, Board vo) {
			List<Board> list = boardmapper.allChartDay();
			model.addAttribute("list", list);
			return list;
		}

	

}
