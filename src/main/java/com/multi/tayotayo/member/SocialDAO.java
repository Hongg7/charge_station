package com.multi.tayotayo.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SocialDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	//id검사
	public String socialidConfirm(SocialVO socialVO) {
		
		return my.selectOne("social.idConfirm", socialVO);
	}

	//
	public void insert(SocialVO socialVO) {
		my.insert("social.insert", socialVO);
	}
	
	public String member_id_select(SocialVO socialVO) {
		return my.selectOne("social.member_id_select",socialVO);
	}

	public void member_id_update(SocialVO socialVO) {
		my.update("social.member_id_update", socialVO);
	}
}
