package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fly.dds.common.MyUtil;
import com.fly.dds.domain.Info;
import com.fly.dds.mapper.InfoMapper;

@Service
public class InfoServiceImpl implements InfoService {
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private InfoMapper mapper;
	
	@Override
	public int dataCount() {
		int result = 0;

		try {
			result = mapper.dataCount();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<Info> listInfo(Map<String, Object> map) {
		List<Info> list=null;
		
		try {
			list=mapper.listInfo(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
