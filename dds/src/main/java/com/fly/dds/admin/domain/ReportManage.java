package com.fly.dds.admin.domain;

public class ReportManage {
	private long num; // 신고번호, 차단번호
	private String reason; // 신고사유
	private long user_num; // 신고당한 사람
	private String user_nick;
	private String reporter_nick;
	private long reporter_num; // 신고한 사람
	private int reply; // 댓글여부
	private String reportPage; // 신고 게시글
	private long article_num; // 게시글 번호
	private String reg_date; // 신고 등록일
	
	private String ban_edate;
	private int ban_state;
	private String ban_sdate;
	private String nickName;
	
	private int state;
	
	
	
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getReporter_nick() {
		return reporter_nick;
	}
	public void setReporter_nick(String reporter_nick) {
		this.reporter_nick = reporter_nick;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public long getUser_num() {
		return user_num;
	}
	public void setUser_num(long user_num) {
		this.user_num = user_num;
	}
	public long getReporter_num() {
		return reporter_num;
	}
	public void setReporter_num(long reporter_num) {
		this.reporter_num = reporter_num;
	}
	public int getReply() {
		return reply;
	}
	public void setReply(int reply) {
		this.reply = reply;
	}
	public String getReportPage() {
		return reportPage;
	}
	public void setReportPage(String reportPage) {
		this.reportPage = reportPage;
	}
	public long getArticle_num() {
		return article_num;
	}
	public void setArticle_num(long article_num) {
		this.article_num = article_num;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getBan_edate() {
		return ban_edate;
	}
	public void setBan_edate(String ban_edate) {
		this.ban_edate = ban_edate;
	}
	public int getBan_state() {
		return ban_state;
	}
	public void setBan_state(int ban_state) {
		this.ban_state = ban_state;
	}
	public String getBan_sdate() {
		return ban_sdate;
	}
	public void setBan_sdate(String ban_sdate) {
		this.ban_sdate = ban_sdate;
	}
	
	
	
	
}
