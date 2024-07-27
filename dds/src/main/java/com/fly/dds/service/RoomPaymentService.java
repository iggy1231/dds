package com.fly.dds.service;

import java.util.Map;

import com.fly.dds.domain.RoomPayment;

public interface RoomPaymentService {
	public String roomPaymentNumber();
	public void insertPayment(RoomPayment dto) throws Exception;
	public void insertCardData(RoomPayment dto) throws Exception;
	public long payMentSeq();
	public void insertRefund(Map<String, Object> map) throws Exception;
	
	// public List<RoomPayment> listRoomPayment(List<>);
}
