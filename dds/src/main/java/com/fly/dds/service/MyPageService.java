package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import com.fly.dds.domain.Member;
import com.fly.dds.domain.TravelReview;

public interface MyPageService {
	public void updateMbti(Member dto) throws Exception;
	public void updateProfile(Member dto , String pathname) throws Exception;
	public void updateInfo(Member dto) throws Exception;
	public void updateMember(Member dto) throws Exception;
	public void deleteMember(Long user_num) throws Exception;
	public int dataCount(Map<String, Object> map);
	public Member findById(Long user_num);
	
	public void deleteInfo(Long user_num) throws Exception;
	public void deleteProfile(Long user_num) throws Exception;
	public List<TravelReview> listReview(Map<String, Object> map);
}
