package com.fly.dds.domain;

public class CompanionReply {
	private long reply_num;
	private long num;
	private long user_num;
	private long answer_num;
	private String nickname;
	private String content;
	private String reg_date;
	
	private int likeCount;
	private String liked;
	
	public long getReply_num() {
		return reply_num;
	}
	public void setReply_num(long reply_num) {
		this.reply_num = reply_num;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public long getUser_num() {
		return user_num;
	}
	public void setUser_num(long user_num) {
		this.user_num = user_num;
	}
	public long getAnswer_num() {
		return answer_num;
	}
	public void setAnswer_num(long answer_num) {
		this.answer_num = answer_num;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public String getLiked() {
		return liked;
	}
	public void setLiked(String liked) {
		this.liked = liked;
	}
}
