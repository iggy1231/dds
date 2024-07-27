package com.fly.dds.domain;

import org.springframework.web.multipart.MultipartFile;

public class Coupon {
	private long num;
	private String name;
	private String content;
	private int rate_discount;
	private String issue_date;
	private String expiry_date;
	private MultipartFile coupon_image;
	private String saveFilename;
	private long user_num;
	private String nickname;
	private String code;
	
	private String reg_date;
	private String use_state;
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRate_discount() {
		return rate_discount;
	}
	public void setRate_discount(int rate_discount) {
		this.rate_discount = rate_discount;
	}
	public String getIssue_date() {
		return issue_date;
	}
	public void setIssue_date(String issue_date) {
		this.issue_date = issue_date;
	}
	public String getExpiry_date() {
		return expiry_date;
	}
	public void setExpiry_date(String expiry_date) {
		this.expiry_date = expiry_date;
	}
	public MultipartFile getCoupon_image() {
		return coupon_image;
	}
	public void setCoupon_image(MultipartFile coupon_image) {
		this.coupon_image = coupon_image;
	}
	public String getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	public long getUser_num() {
		return user_num;
	}
	public void setUser_num(long user_num) {
		this.user_num = user_num;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getUse_state() {
		return use_state;
	}
	public void setUse_state(String use_state) {
		this.use_state = use_state;
	}
}
