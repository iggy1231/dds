package com.fly.dds.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Companion {
	private long num;
	private String nickname;
	private String subject;
	private String content;
	private String reg_date;
	private int hitcount;
	private long user_num;
	private int status;
	
	private List<String> region_main;
	private List<String> region_sub;
	private String mainRegion;
	private String subRegion;
	
	private List<MultipartFile> imgFiles;
	private long file_num;
	private String saveFilename;
	
	private String theme;
	
	private String sdate;
	private String edate;
	private String gender;
	private String age;

	private int total_people;
	private int current_people;
	private int estimate_cost;
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
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
	public int getHitcount() {
		return hitcount;
	}
	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}
	public long getUser_num() {
		return user_num;
	}
	public void setUser_num(long user_num) {
		this.user_num = user_num;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public List<String> getRegion_main() {
		return region_main;
	}
	public void setRegion_main(List<String> region_main) {
		this.region_main = region_main;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public int getTotal_people() {
		return total_people;
	}
	public void setTotal_people(int total_people) {
		this.total_people = total_people;
	}
	public int getCurrent_people() {
		return current_people;
	}
	public void setCurrent_people(int current_people) {
		this.current_people = current_people;
	}
	public int getEstimate_cost() {
		return estimate_cost;
	}
	public void setEstimate_cost(int estimate_cost) {
		this.estimate_cost = estimate_cost;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public List<String> getRegion_sub() {
		return region_sub;
	}
	public void setRegion_sub(List<String> region_sub) {
		this.region_sub = region_sub;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public long getFile_num() {
		return file_num;
	}
	public void setFile_num(long file_num) {
		this.file_num = file_num;
	}
	public String getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	public String getMainRegion() {
		return mainRegion;
	}
	public void setMainRegion(String mainRegion) {
		this.mainRegion = mainRegion;
	}
	public String getSubRegion() {
		return subRegion;
	}
	public void setSubRegion(String subRegion) {
		this.subRegion = subRegion;
	}
	public List<MultipartFile> getImgFiles() {
		return imgFiles;
	}
	public void setImgFiles(List<MultipartFile> imgFiles) {
		this.imgFiles = imgFiles;
	}
}
