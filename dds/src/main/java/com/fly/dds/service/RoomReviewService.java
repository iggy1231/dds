package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import com.fly.dds.domain.RoomReview;
import com.fly.dds.domain.Summary;

public interface RoomReviewService {
	public void insertRoomReview(RoomReview dto, String pathname) throws Exception;
	// public void insertRoomReviewFile(RoomReview dto) throws SQLException;
	
	public Summary findByRoomReviewSummary(Map<String, Object> map);
	public List<RoomReview>listRoomReview(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public void updateRoomReview(RoomReview dto) throws Exception; 
	
	// public List<RoomReview>listReviewFile(long num);
	public void deleteRoomReview(long num) throws Exception;
}
