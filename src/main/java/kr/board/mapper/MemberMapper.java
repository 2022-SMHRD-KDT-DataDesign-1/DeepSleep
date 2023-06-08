package kr.board.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.board.entity.Member;
import kr.board.entity.Repository;

@Mapper
public interface MemberMapper {

	public Member login(Member m);

	public Member registerCheck(String email);

	public int forgetPw(Member m);

	public int SignUp(Member m);
	
	public Repository downLoad(Repository r);
	
	}
