package kr.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.board.entity.EditLabel;
import kr.board.entity.Member;
import kr.board.entity.Repository;

@Mapper
public interface MemberMapper {

	public Member login(Member m);

	public Member registerCheck(String email);

	public int forgetPw(Member m);

	public int SignUp(Member m);
	
	public int downLoad(List<Repository> list);

	public void editLabel(EditLabel e);
	
	}
