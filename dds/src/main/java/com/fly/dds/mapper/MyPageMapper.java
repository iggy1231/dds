package com.fly.dds.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.fly.dds.domain.Member;
import com.fly.dds.domain.TravelReview;

public interface MyPageMapper {
	public void updateMbti(Member dto) throws SQLException;
	public void updateProfile(Member dto) throws SQLException;
	public void updateInfo(Member dto) throws SQLException;
	public void updateMember(Member dto) throws SQLException;
	public void deleteMember(Long user_num) throws SQLException;
	
	public void deleteInfo(Long user_num) throws SQLException;
	public void deleteProfile(Long user_num) throws SQLException;
	public Member findById(Long user_num);
	
	public int dataCount(Map<String, Object> map);
	public List<TravelReview> listReview(Map<String, Object> map);
}
