package com.fly.dds.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fly.dds.admin.domain.EventManage;

@Mapper
public interface EventManageMapper {
	public void insertEvent(EventManage dto) throws SQLException;
	public void updateEvent(EventManage dto) throws SQLException;
	public void deleteEvent(long num) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<EventManage> listEvent(Map<String, Object> map);
	
	public EventManage findByNum(long num);
	public void updateHitCount(long num) throws SQLException;
	public EventManage findByPrev(Map<String, Object> map);
	public EventManage findByNext(Map<String, Object> map);
	
	// 이벤트 응모자 리스트
	public List<EventManage> listEventTakers(long num);
		
	// 이벤트 당첨자 등록(발표)
	public void insertEventWinner1(EventManage dto) throws SQLException;
	public void insertEventWinner2(EventManage dto) throws SQLException;
	// 이벤트 당첨자 리스트
	public List<EventManage> listEventWinner(long num);
}
