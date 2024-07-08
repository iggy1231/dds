package com.dds.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dds.app.domain.Member;
import com.dds.app.mapper.MemberMapper;
@Service
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
	

}