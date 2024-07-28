package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fly.dds.domain.Home;
import com.fly.dds.mapper.HomeMapper;

@Service
public class HomeServiceImpl implements HomeService {
	@Autowired
	private HomeMapper mapper;

	@Override
	public List<Home> homeRoom(Map<String, Object> map) {
		List<Home> list = null;

		try {
			list = mapper.homeRoom(map);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	
	
	

}
