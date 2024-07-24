package com.fly.dds.admin.service;

import java.util.List;
import java.util.Map;

import com.fly.dds.domain.Room;

public interface RoomProductService {
	public void insertProduct(Room dto , String pathname) throws Exception;
	public void updateProduct(Room  dto, String pathname) throws Exception;
	public void deleteProduct(long productNum, String pathname) throws Exception;
	public void deleteProductFile(long fileNum, String pathname) throws Exception;
	public void deleteOptionDetail(long detailNum) throws Exception;
	
	public int dataCountRoom(Map<String, Object> map);
	public List<Room> listRoomProduct(Map<String, Object> map);
	
	public Room findById(long productNum);
	
	public List<Room> listProductFile(long productNum);
	public List<Room> listProductOption(long productNum);
	public List<Room> listOptionDetail(long optionNum);
	
}
