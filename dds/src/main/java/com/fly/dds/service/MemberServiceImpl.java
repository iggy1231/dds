package com.fly.dds.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fly.dds.domain.Member;
import com.fly.dds.mapper.MemberMapper;
@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;

	@Override
	public Member loginMember(String userId) {
		Member dto=null;
		
		try {
			dto=mapper.loginMember(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	@Transactional
	public void signupMember(Map<String, Object> map) {
		try {
			long seq=mapper.memberSeq();
			
			map.put("num", seq);
			mapper.insertMember(map);
			mapper.insertMemberInfo(map);
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	

}