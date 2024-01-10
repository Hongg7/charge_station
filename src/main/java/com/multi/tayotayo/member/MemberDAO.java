package com.multi.tayotayo.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Autowired
	SqlSessionTemplate my;
	
	//로그인
	public int count(MemberVO memberVO) {
		return my.selectOne("member.count", memberVO);
	}
	
	//사용자 정보 조회
	public MemberVO one(String member_id) {
		MemberVO result = my.selectOne("member.one", member_id);
		System.out.println("result 결과 전");
		System.out.println(result);
		return result;
	}
	
	//회원가입
	public void insert(MemberVO memberVO) {
		my.insert("member.insert", memberVO);
	}
	
	//이름변경
	public void nameupdate(MemberVO memberVO) {
		my.insert("member.nameupdate", memberVO);
	}
	
	//닉네임변경
	public void nicknameupdate(MemberVO memberVO) {
		my.insert("member.nicknameupdate", memberVO);
	}
	
	//이메일변경
	public void emailupdate(MemberVO memberVO) {
		my.insert("member.emailupdate", memberVO);
	}
	
	
	//휴대전화변경
	public void telupdate(MemberVO memberVO) {
		my.insert("member.telupdate", memberVO);
	}
	
	//비밀번호변경
	public void pwupdate(MemberVO memberVO) {
		my.insert("member.pwupdate", memberVO);
	}
	
	//계정삭제
	public void delete(MemberVO memberVO) {
		my.insert("member.delete", memberVO);
	}
	
	//id검사
	public String idConfirm(String member_id) {
		return my.selectOne("member.idConfirm", member_id);
	}
	
	//닉네임검사
	public String nicknameConfirm(String nickname) {
		return my.selectOne("member.nicknameConfirm", nickname);
	}
	
	//비밀번호검사
	public String pwConfirm(MemberVO memberVO) {
		return my.selectOne("member.pwConfirm", memberVO);
	}

	public List<MemberVO> myreviewlist(String member_id) {
		
		return my.selectList("member.myreviewlist",member_id);
	}
	
}
