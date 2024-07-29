package com.fly.dds.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fly.dds.domain.Room;
import com.fly.dds.domain.RoomReview;

@Mapper
public interface roomMapper {
	public int dataCount(Map<String, Object> map);
	public List<Room> listRoom(Map<String, Object> map);
	public Room findByNum(long num);
	public Room findByDetail(long detail_num);
	public List<Room> listDetail(Map<String, Object> map);
	public List<Room> listPhoto(Map<String, Object> map);
	public void insertRoomWishList(Map<String, Object> map) throws SQLException;
	public int isLiked(Map<String, Object> map);
	public RoomReview findReviewSummaryByNum(long num);
}
