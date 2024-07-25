package com.fly.dds.service;

import java.util.Map;

import com.fly.dds.domain.Member;

public interface MemberService {
	public Member loginMember(String userId);
	public void signupMember(Map<String, Object> map);
}
