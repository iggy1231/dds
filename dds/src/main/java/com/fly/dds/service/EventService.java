package com.fly.dds.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.fly.dds.domain.Event;

public interface EventService {
	public int dataCount(Map<String, Object> map);
	public List<Event> listEvent(Map<String, Object> map);
	
	public Event findByNum(long num);
	public void updateHitCount(long num) throws Exception;
	public Event findByPrev(Map<String, Object> map);
	public Event findByNext(Map<String, Object> map);
	
	public void insertEventTakers(Event dto) throws SQLException;
	public List<Event> listEventTakers(long num);
	public boolean userEventTakers(Map<String, Object> map);
	
	public Event findByEventWinner(Map<String, Object> map);
	public List<Event> listEventWinner(long num);
}
