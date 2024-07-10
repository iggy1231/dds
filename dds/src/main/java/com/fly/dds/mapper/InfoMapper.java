package com.fly.dds.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fly.dds.domain.Info;

@Mapper
public interface InfoMapper {
	public int dataCount();
	
	public List<Info> listInfo(Map<String, Object> map);
}
