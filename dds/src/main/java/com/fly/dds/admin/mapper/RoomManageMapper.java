package com.fly.dds.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fly.dds.domain.Room;
import com.fly.dds.domain.RoomPayment;

@Mapper
public interface RoomManageMapper {
	// 시퀀스 호출
	public long roomSeq();
	
	// 숙소 등록
	public void insertRoom(Room dto) throws SQLException;
	
	// 파일 등록
	public void insertRoomFile(Room dto) throws SQLException;
	
	// 상세정보 등록
	public void insertRoomDetail(Room dto) throws SQLException;
	
	
	// Room list
	public int dataCount(Map<String, Object> map);
	public List<Room> listRoom(Map<String, Object> map);
	public Room findById(long num);
	public List<Room> listRoomFile(long num);
	
	// update
	public void updateRoom(Room dto) throws SQLException;
	public void updateRoomFile(Room dto) throws SQLException;
	// public void updateRoomFacility(Room dto) throws SQLException;
	public void updateRoomDetail(Room dto) throws SQLException;
	
	
	// delete
	public void deleteRoomFile(long photo_num);
	
	// 주문 관련
	public List<RoomPayment> listSale(Map<String, Object> map);
	public int saleCount(Map<String, Object> map);
	
	
	
}
