package com.fly.dds.mapper;

import java.util.List;
import java.util.Map;

import com.fly.dds.domain.Room;

public interface roomMapper {
	public int dataCount(Map<String, Object> map);
	public List<Room> listRoom(Map<String, Object> map);
}
