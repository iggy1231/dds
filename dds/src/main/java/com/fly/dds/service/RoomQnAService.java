package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import com.fly.dds.domain.RoomQnA;

public interface RoomQnAService {
	public void insertQnA(RoomQnA dto) throws Exception;

	public int dataCount(Map<String, Object> map);
	public List<RoomQnA>listQnA(Map<String, Object> map);
	
	public int dataCount2(Map<String, Object> map);
	public List<RoomQnA> listQnA2(Map<String, Object> map);
	
	public void updateQnA(RoomQnA dto) throws Exception;
	
	public void deleteQnA(long qna_num) throws Exception;
	
}

