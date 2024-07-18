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
	
	public Companion findByNum(long num);
	public String findThemeByNum(long num);
	public List<Companion> findRegionByNum(long num);
	public Set<String> findAgeByNum(long num);
	
	public int dataCount();
	public List<Companion> listCompanion(Map<String, Object> map);
	
	public long numBymainRegion(String mainRegion);
	public List<Companion> listBymainRegion(Map<String, Object> map);
	public int dataCountByArea(String mainRegion);
}
