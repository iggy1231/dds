package com.fly.dds.admin.domain;

import java.util.List;

public class EventManage {
	private long num;
	private long user_num;
	private String userName;
	private String title;
	private String content;
	private String startDate;
	private String sday;
	private String stime;
	private String endDate;
	private String eday;
	private String etime;
	private String winningDate;
	private String wday;
	private String wtime;
	private int winnerNumber;
	private int showEvent;
	private int hitCount;
	
	private int rank;
	private String reg_date;
	
	private int applyCount;  // 응모자수
	private int winnerCount; // 당첨자수
	
	// 당첨자 발표
	private int winEvent;
	private List<Integer> rankNum;
	private List<Integer> rankCount;
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getSday() {
		return sday;
	}
	public void setSday(String sday) {
		this.sday = sday;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getEday() {
		return eday;
	}
	public void setEday(String eday) {
		this.eday = eday;
	}
	public String getEtime() {
		return etime;
	}
	public void setEtime(String etime) {
		this.etime = etime;
	}
	public String getWinningDate() {
		return winningDate;
	}
	public void setWinningDate(String winningDate) {
		this.winningDate = winningDate;
	}
	public String getWday() {
		return wday;
	}
	public void setWday(String wday) {
		this.wday = wday;
	}
	public String getWtime() {
		return wtime;
	}
	public void setWtime(String wtime) {
		this.wtime = wtime;
	}
	public int getWinnerNumber() {
		return winnerNumber;
	}
	public void setWinnerNumber(int winnerNumber) {
		this.winnerNumber = winnerNumber;
	}
	public int getShowEvent() {
		return showEvent;
	}
	public void setShowEvent(int showEvent) {
		this.showEvent = showEvent;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getApplyCount() {
		return applyCount;
	}
	public void setApplyCount(int applyCount) {
		this.applyCount = applyCount;
	}
	public int getWinnerCount() {
		return winnerCount;
	}
	public void setWinnerCount(int winnerCount) {
		this.winnerCount = winnerCount;
	}
	public int getWinEvent() {
		return winEvent;
	}
	public void setWinEvent(int winEvent) {
		this.winEvent = winEvent;
	}
	public List<Integer> getRankNum() {
		return rankNum;
	}
	public void setRankNum(List<Integer> rankNum) {
		this.rankNum = rankNum;
	}
	public List<Integer> getRankCount() {
		return rankCount;
	}
	public void setRankCount(List<Integer> rankCount) {
		this.rankCount = rankCount;
	}
}
