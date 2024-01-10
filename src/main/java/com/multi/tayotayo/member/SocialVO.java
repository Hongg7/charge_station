package com.multi.tayotayo.member;

public class SocialVO {
	private String id;
	private String type;
	private String member_id;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	@Override
	public String toString() {
		return "SocialVO [id=" + id + ", type=" + type + ", member_id=" + member_id + "]";
	}
	
}
