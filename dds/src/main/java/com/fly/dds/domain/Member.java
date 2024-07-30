package com.fly.dds.domain;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;

import org.springframework.web.multipart.MultipartFile;

public class Member {
	private long user_num;
	private String userId;
	private String pwd;
	private String userName;
	private String nickName;
	private String birth;
	private String gender;
	private String email;
	private String tel;
	
	private String reg_date;
	private String modify_date;
	private int activity;
	private int grade;
	
	private int status;
	
	private String content;
	private MultipartFile photoFile;
	private String photo;
	private String mbti;
	
	private int age;
	private int ageDecade;
	
	private int enabled;
	
	

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public void setAgeDecade(int ageDecade) {
		this.ageDecade = ageDecade;
	}

	public long getUser_num() {
		return user_num;
	}

	public void setUser_num(long user_num) {
		this.user_num = user_num;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getModify_date() {
		return modify_date;
	}

	public void setModify_date(String modify_date) {
		this.modify_date = modify_date;
	}

	public int getActivity() {
		return activity;
	}

	public void setActivity(int activity) {
		this.activity = activity;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public MultipartFile getPhotoFile() {
		return photoFile;
	}

	public void setPhotoFile(MultipartFile photoFile) {
		this.photoFile = photoFile;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getMbti() {
		return mbti;
	}

	public void setMbti(String mbti) {
		this.mbti = mbti;
	}

	public int getAge() {
		String birthDateString = birth;
		LocalDate currentDate = LocalDate.now();
        
        // 생년월일을 LocalDate로 변환
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate birthDate = LocalDate.parse(birthDateString, formatter);
        
        // 만나이 계산
        age = Period.between(birthDate, currentDate).getYears();
        
        return age;
	}
	
	public int getAgeDecade() {
        // 일의 자리 숫자를 제거한 나이대 계산
        ageDecade = (getAge() / 10) * 10;

        return ageDecade;
	}	
}
