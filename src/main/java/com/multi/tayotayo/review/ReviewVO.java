package com.multi.tayotayo.review;

import java.util.Date;

public class ReviewVO {
	private int r_no;
	private int r_num;
	private String r_title;
	private String r_content;
	private String r_writer;
	private int r_like;
	private Date r_time;
	private String r_charger;
	private int r_rank;
	private String type;
	private String keyword;
	
	
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public String getR_title() {
		return r_title;
	}
	public void setR_title(String r_title) {
		this.r_title = r_title;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_writer() {
		return r_writer;
	}
	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}
	public int getR_like() {
		return r_like;
	}
	public void setR_like(int r_like) {
		this.r_like = r_like;
	}
	public Date getR_time() {
		return r_time;
	}
	public void setR_time(Date r_time) {
		this.r_time = r_time;
	}
	public String getR_charger() {
		return r_charger;
	}
	public void setR_charger(String r_charger) {
		this.r_charger = r_charger;
	}
	
	public int getR_rank() {
		return r_rank;
	}
	public void setR_rank(int r_rank) {
		this.r_rank = r_rank;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "ReviewVO [r_no=" + r_no + ", r_num=" + r_num + ", r_title=" + r_title + ", r_content=" + r_content
				+ ", r_writer=" + r_writer + ", r_like=" + r_like + ", r_time=" + r_time + ", r_charger=" + r_charger
				+ ", r_rank=" + r_rank + ", type=" + type + ", keyword=" + keyword + "]";
	}
	
}