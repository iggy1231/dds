package com.fly.dds.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.fly.dds.domain.Member;

@Mapper
public interface MemberMapper {
	public Member loginMember(String userId);
}
