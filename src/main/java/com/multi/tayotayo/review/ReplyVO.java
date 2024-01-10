package com.multi.tayotayo.review;

import java.util.Date;

public class ReplyVO {
	private int rr_num;
	private String rr_content;
	private String rr_writer;
	private Date rr_time;
	private int rr_ori_review;
	public int getRr_num() {
		return rr_num;
	}
	public void setRr_num(int rr_num) {
		this.rr_num = rr_num;
	}
	public String getRr_content() {
		return rr_content;
	}
	public void setRr_content(String rr_content) {
		this.rr_content = rr_content;
	}
	public String getRr_writer() {
		return rr_writer;
	}
	public void setRr_writer(String rr_writer) {
		this.rr_writer = rr_writer;
	}
	public Date getRr_time() {
		return rr_time;
	}
	public void setRr_time(Date rr_time) {
		this.rr_time = rr_time;
	}
	public int getRr_ori_review() {
		return rr_ori_review;
	}
	public void setRr_ori_review(int rr_ori_review) {
		this.rr_ori_review = rr_ori_review;
	}
	@Override
	public String toString() {
		return "ReplyVO [rr_num=" + rr_num + ", rr_content=" + rr_content + ", rr_writer=" + rr_writer + ", rr_time="
				+ rr_time + ", rr_ori_review=" + rr_ori_review + "]";
	}
	
}