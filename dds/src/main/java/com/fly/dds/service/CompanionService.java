package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import com.fly.dds.domain.Companion;

public interface CompanionService {
	public void insertCompanion(Companion dto);
	public Companion findByNum(long num);
	public int dataCount();
	public List<Companion> listCompanion(Map<String, Object> map);
	public List<Companion> listBymainRegion(Map<String, Object> map);
	public int dataCountByArea(String mainRegion);
}
