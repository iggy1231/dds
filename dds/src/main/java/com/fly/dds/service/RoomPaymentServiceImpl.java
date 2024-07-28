package com.fly.dds.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fly.dds.domain.RoomPayment;
import com.fly.dds.mapper.RoomPaymentMapper;

@Service
public class RoomPaymentServiceImpl implements RoomPaymentService{
	@Autowired
	private RoomPaymentMapper mapper;

	@Override
	public String roomPaymentNumber() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertPayment(RoomPayment dto) throws Exception {
		try {
			mapper.insertPayment(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public long payMentSeq() {
		long result = 0;
		try {
			result = mapper.payMentSeq();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void insertCardData(RoomPayment dto) throws Exception {
		try {
			mapper.insertCardData(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertRefund(Map<String, Object> map) throws Exception {
		try {
			mapper.insertRefund(map);
			System.out.println("insertrefund 호출 성공");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
