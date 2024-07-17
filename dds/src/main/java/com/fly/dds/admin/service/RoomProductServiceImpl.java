package com.fly.dds.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fly.dds.admin.mapper.RoomManageMapper;
import com.fly.dds.domain.Room;

@Service
public class RoomProductServiceImpl implements RoomProductService {
	@Autowired
	private RoomManageMapper mapper;
	
	@Override
	public void insertProduct(Room dto, String pathname) throws Exception {
		try {
			mapper.insertRoom(dto);
			mapper.insertKeyword(dto);
			mapper.insertRoomFacility(dto);
			mapper.insertRoomFile(dto);
			mapper.insertRoomDetail(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateProduct(Room dto, String pathname) throws Exception {
		
	}

	@Override
	public void deleteProduct(long productNum, String pathname) throws Exception {
		
	}

	@Override
	public void deleteProductFile(long fileNum, String pathname) throws Exception {
		
	}

	@Override
	public void deleteOptionDetail(long detailNum) throws Exception {
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		return 0;
	}

	@Override
	public List<Room> listProduct(Map<String, Object> map) {
		return null;
	}

	@Override
	public Room findById(long productNum) {
		return null;
	}

	@Override
	public Room findByPrev(Map<String, Object> map) {
		return null;
	}

	@Override
	public Room findByNext(Map<String, Object> map) {
		return null;
	}

	@Override
	public List<Room> listProductFile(long productNum) {
		return null;
	}

	@Override
	public List<Room> listProductOption(long productNum) {
		return null;
	}

	@Override
	public List<Room> listOptionDetail(long optionNum) {
		return null;
	}

	@Override
	public Room findByCategory(long categoryNum) {
		return null;
	}

	@Override
	public List<Room> listCategory() {
		return null;
	}

	@Override
	public List<Room> listSubCategory(long parentNum) {
		return null;
	}
	
}
