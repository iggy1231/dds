package com.fly.dds.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fly.dds.domain.RoomReview;
import com.fly.dds.domain.Summary;

@Mapper
public interface RoomReviewMapper {
	public void insertRoomReview(RoomReview dto) throws SQLException;
	// public void insertRoomReviewFile(RoomReview dto) throws SQLException;
	
	public Summary findByRoomReviewSummary(Map<String, Object> map);
	public List<RoomReview>listRoomReview(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public void updateRoomReview(RoomReview dto) throws SQLException; 
	
	// public List<RoomReview>listReviewFile(long num);
	public void deleteRoomReview(long num) throws SQLException;
	
	
}
