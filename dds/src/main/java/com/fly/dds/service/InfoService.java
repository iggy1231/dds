package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import com.fly.dds.domain.Info;

public interface InfoService {
	public int dataCount();

	public List<Info> listInfo(Map<String, Object> map);
}
