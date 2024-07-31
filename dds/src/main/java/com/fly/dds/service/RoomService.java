package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import com.fly.dds.domain.Room;

public interface RoomService {

	public int dataCount(Map<String, Object> map);

	public List<Room> listRoom(Map<String, Object> map);
	public List<Room> listDetail(Map<String, Object> map);
	public List<Room> listPhoto(Map<String, Object> map);
	
	public Room findByNum(long num);
	public Room findByDetail(long detail_num);
	public void insertRoomWishList(Map<String, Object> map) throws Exception;

	public boolean isLiked(Map<String, Object> map);

}
