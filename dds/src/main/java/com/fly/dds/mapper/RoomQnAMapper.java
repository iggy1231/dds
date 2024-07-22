package com.fly.dds.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fly.dds.domain.RoomQnA;

@Mapper
public interface RoomQnAMapper {
	public void insertQnA(RoomQnA dto) throws SQLException;
	public int dataCount(Map<String, Object> map);
	public List<RoomQnA> listQnA(Map<String, Object> map);
	public void updateQnA(RoomQnA dto) throws SQLException;
	
	

}
