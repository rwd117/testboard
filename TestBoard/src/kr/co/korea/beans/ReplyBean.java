package kr.co.korea.beans;

import java.util.*;

public class ReplyBean {
	
	private int reply_bno;//게시물 번호
	private int reply_rno;//댓글 번호
	private String reply_content;//댓글 내용
	private String reply_writer;//댓글 작성자
	private Date reply_regdate;//댓글 작성 날짜
	
	public int getReply_bno() {
		return reply_bno;
	}
	public void setReply_bno(int reply_bno) {
		this.reply_bno = reply_bno;
	}
	public int getReply_rno() {
		return reply_rno;
	}
	public void setReply_rno(int reply_rno) {
		this.reply_rno = reply_rno;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_writer() {
		return reply_writer;
	}
	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}
	public Date getReply_regdate() {
		return reply_regdate;
	}
	public void setReply_regdate(Date reply_regdate) {
		this.reply_regdate = reply_regdate;
	}
	
	
}
