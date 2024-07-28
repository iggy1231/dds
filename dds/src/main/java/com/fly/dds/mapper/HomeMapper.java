package com.fly.dds.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fly.dds.domain.Home;

@Mapper
public interface HomeMapper {
	
	// 숙소
	List<Home> homeRoom(Map<String, Object> map);
}
