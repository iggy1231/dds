package com.fly.dds.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fly.dds.admin.domain.MemberManage;
import com.fly.dds.admin.mapper.MemberManageMapper;

@Service
public class MemberManageServiceImpl implements MemberManageService {
	@Autowired
	private MemberManageMapper mapper;
	
	@Override
	public List<MemberManage> listMember(Map<String, Object> map) {
		List<MemberManage> list = null;
		
		try {
			list = mapper.listMember(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return result;
	}

}
