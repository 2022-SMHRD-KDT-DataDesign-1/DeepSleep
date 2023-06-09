package kr.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.ui.Model;

import kr.board.entity.Board;
import kr.board.entity.Member;

@Mapper
public interface BoardMapper {

	public List<Board> boardList(int user_idx);

	public void boardDelete(int id);

	public List<Board> adminList();

	public List<Board> chartMonth(int id);

	public List<Board> chartDay(int id);

	public List<Board> allChartMonth();

	public List<Board> allChartDay();



}
