package com.fly.dds.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fly.dds.domain.Coupon;

@Mapper
public interface CouponManageMapper {
	public void insertCoupon(Coupon dto);
	public List<Coupon> listCoupon(Map<String, Object> map);
	public int dataCount();
	public Coupon findBynum(long num);
	public void updateCoupon(Coupon dto);
	public void deleteCoupon(long num);
	public int historyCount();
	public List<Coupon> listCouponHistory(Map<String, Object> map);
}
