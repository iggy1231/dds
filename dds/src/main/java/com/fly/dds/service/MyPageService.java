package com.fly.dds.service;

import com.fly.dds.domain.Member;

public interface MyPageService {
	public void updateMbti(Member dto) throws Exception;
	public void updateProfile(Member dto , String pathname) throws Exception;
	public void updateInfo(Member dto) throws Exception;
	public void updateMember(Member dto) throws Exception;
	public void deleteMember(Long user_num) throws Exception;
	public Member findById(Long user_num);
	
	public void deleteInfo(Long user_num) throws Exception;
	public void deleteProfile(Long user_num) throws Exception;
}
