package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import com.fly.dds.domain.Companion;
import com.fly.dds.domain.Home;

public interface HomeService {
	
	// 숙소
	public List<Home> homeRoom(Map<String, Object> map);
	
	// 동행
	List<Companion> homeCompanion(Map<String, Object> map);
}
