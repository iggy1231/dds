package com.fly.dds.mapper;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.annotations.Mapper;

import com.fly.dds.domain.Companion;

@Mapper
public interface CompanionMapper {
	public void insertCompanion(Companion dto);
	public void insertCompanionInfo(Companion dto);
	public void insertCompanionRegion(Companion dto);
	public void insertCompanionTheme(Companion dto);
	public void insertCompanionAge(String age);
	
	public Companion findByid(long num);
	public String findThemeByid(long num);
	public List<Companion> findRegionByid(long num);
	public Set<String> findAgeByid(long num);
	
	public int dataCount();
	public List<Companion> listCompanion(Map<String, Object> map);
}
