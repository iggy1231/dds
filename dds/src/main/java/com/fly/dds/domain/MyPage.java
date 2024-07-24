package com.fly.dds.domain;

public class MyPage {
	private long num;
	private long reply_num;
	private String content;
	private String reg_date;
	private String boardName;
	private long user_num;
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public long getReply_num() {
		return reply_num;
	}
	public void setReply_num(long reply_num) {
		this.reply_num = reply_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public long getUser_num() {
		return user_num;
	}
	public void setUser_num(long user_num) {
		this.user_num = user_num;
	}

}
