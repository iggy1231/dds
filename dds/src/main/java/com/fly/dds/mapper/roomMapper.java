package com.fly.dds.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fly.dds.domain.Room;

@Mapper
public interface roomMapper {
	public int dataCount(Map<String, Object> map);
	public List<Room> listRoom(Map<String, Object> map);
	
	public List<Room> searchRoom(Map<String, Object> map);
}
