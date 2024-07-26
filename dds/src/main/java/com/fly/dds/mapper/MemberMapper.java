package com.fly.dds.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fly.dds.domain.Member;

@Mapper
public interface MemberMapper {
	public Member loginMember(String userId);
	public long memberSeq();
	public void insertMember(Map<String, Object> map);
	public void insertMemberInfo(Map<String, Object> map);
	public void insertMemberProfile(Map<String, Object> map);
}
