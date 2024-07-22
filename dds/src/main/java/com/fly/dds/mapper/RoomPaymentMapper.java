package com.fly.dds.mapper;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import com.fly.dds.domain.RoomPayment;

@Mapper
public interface RoomPaymentMapper {
	// sale_num
	public String findBySaleNum();
	
	public void insertPayment(RoomPayment dto) throws SQLException;
	public void insertPayDetail(RoomPayment dto) throws SQLException;
	
	
	// public void insertUserPoint(Point dto) throws SQLException;
	
}
