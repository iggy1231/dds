package com.fly.dds.admin.service;

import java.util.List;
import java.util.Map;

import com.fly.dds.domain.Coupon;

public interface CouponManageService {

	public void insertCoupon(Coupon dto, String pathname);
	public List<Coupon> listCoupon(Map<String, Object> map);
	public int dataCount();
	public Coupon findByNum(long num);
	public void updateCoupon(Coupon dto, String pathname);
	public void deleteCoupon(long num);
	public int historyCount();
	public List<Coupon> listCouponHistory(Map<String, Object> map);
}
