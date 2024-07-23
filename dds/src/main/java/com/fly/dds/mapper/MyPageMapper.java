package com.fly.dds.mapper;

import java.sql.SQLException;

import com.fly.dds.domain.Member;

public interface MyPageMapper {
	public void updateMbti(Member dto) throws SQLException;
	public void updateProfile(Member dto) throws SQLException;
	public void updateInfo(Member dto) throws SQLException;
	public void updateMember(Member dto) throws SQLException;
	public void deleteMember(Long user_num) throws SQLException;
	
	public void deleteInfo(Long user_num) throws SQLException;
	public void deleteProfile(Long user_num) throws SQLException;
	public Member findById(Long user_num);
}
