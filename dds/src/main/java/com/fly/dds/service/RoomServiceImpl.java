package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fly.dds.domain.Room;
import com.fly.dds.mapper.roomMapper;

@Service
public class RoomServiceImpl implements RoomService {
	@Autowired
	private roomMapper mapper;

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<Room> listRoom(Map<String, Object> map) {
		List<Room> list = null;

		try {
			list = mapper.listRoom(map);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Room findByNum(long num) {
		Room dto = null;

		try {
			dto = mapper.findByNum(num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public List<Room> listDetail(Map<String, Object> map) {
		List<Room> list = null;

		try {
			list = mapper.listDetail(map);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Room> listPhoto(Map<String, Object> map) {
		List<Room> list = null;
		
		try {
			list = mapper.listPhoto(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	/*
	 * @Override public List<Room> searchRoom(Map<String, Object> map) { return
	 * mapper.searchRoom(map); }
	 */

}
