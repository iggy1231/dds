package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import com.fly.dds.domain.Room;

public interface RoomService {

	public int dataCount(Map<String, Object> map);

	public List<Room> listRoom(Map<String, Object> map);
	
	public List<Room> searchRoom(Map<String, Object> map);
}
