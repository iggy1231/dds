package com.dds.app.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.dds.app.domain.Member;

@Mapper
public interface MemberMapper {
	public Member loginMember(String userId);
}
