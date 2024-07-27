package com.fly.dds.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fly.dds.domain.Coupon;
import com.fly.dds.admin.mapper.CouponManageMapper;
import com.fly.dds.common.FileManager;

@Service
public class CouponManageServiceImpl implements CouponManageService {
	@Autowired
	private CouponManageMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertCoupon(Coupon dto, String pathname) {
		String saveFilename=null;
		try {
			if(dto.getCoupon_image()!=null) {
				saveFilename=fileManager.doFileUpload(dto.getCoupon_image(), pathname);
			}
			dto.setSaveFilename(saveFilename);
			mapper.insertCoupon(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Coupon> listCoupon(Map<String, Object> map) {
		List<Coupon> list=null;
				
		try {
			list=mapper.listCoupon(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount() {
		int result=0;
		
		try {
			result=mapper.dataCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Coupon findByNum(long num) {
		Coupon dto=null;
		
		try {
			dto=mapper.findBynum(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateCoupon(Coupon dto, String pathname) {
		String saveFilename=null;
		try {
			if(dto.getCoupon_image()!=null) {
				saveFilename=fileManager.doFileUpload(dto.getCoupon_image(), pathname);
			}
			dto.setSaveFilename(saveFilename);
			mapper.updateCoupon(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteCoupon(long num) {
		try {
			mapper.deleteCoupon(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int historyCount() {
		int result=0;
		
		try {
			result=mapper.historyCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Coupon> listCouponHistory(Map<String, Object> map) {
		List<Coupon> list=null;
		
		try {
			list=mapper.listCouponHistory(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
