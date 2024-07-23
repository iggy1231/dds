package com.fly.dds.admin.service;

import java.util.List;
import java.util.Map;

import com.fly.dds.admin.domain.EventManage;

public interface EventManageService {
	public void insertEvent(EventManage dto) throws Exception; // 이벤트 등록
	public void updateEvent(EventManage dto) throws Exception; // 수정
	public void deleteEvent(long num) throws Exception; // 삭제
	
	public int dataCount(Map<String, Object> map);
	public List<EventManage> listEvent(Map<String, Object> map);
	
	public EventManage findByNum(long num);
	public void updateHitCount(long num) throws Exception;
	public EventManage findByPrev(Map<String, Object> map);
	public EventManage findByNext(Map<String, Object> map);
	
	// 이벤트 응모자 리스트
	public List<EventManage> listEventTakers(long num);
		
	// 이벤트 당첨자 처리 / 리스트
	public void insertEventWinner(EventManage dto) throws Exception;
	public List<EventManage> listEventWinner(long num);
}
