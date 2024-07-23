package com.fly.dds.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fly.dds.domain.Room;

@Mapper
public interface roomMapper {
	public int dataCount(Map<String, Object> map);
	public List<Room> listRoom(Map<String, Object> map);
	public Room findByNum(long num);
	public Room findByDetail(long detail_num);
	public List<Room> listDetail(Map<String, Object> map);
	public List<Room> listPhoto(Map<String, Object> map);
	
}
