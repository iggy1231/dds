package com.fly.dds.service;

import com.fly.dds.domain.RoomPayment;

public interface RoomPaymentService {
	public String roomPaymentNumber();
	public void insertPayment(RoomPayment dto) throws Exception;
	public long payMentSeq();
	
	// public List<RoomPayment> listRoomPayment(List<>);
}
