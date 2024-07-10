package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fly.dds.domain.TravelReview;
import com.fly.dds.mapper.TravelReviewMapper;

@Service
public class TravelReviewServiceImpl implements TravelReviewService {
	@Autowired
	private TravelReviewMapper mapper;
	
	@Override
	public void reviewInsert(TravelReview dto, String pathname) {
		try {
			mapper.insertReview(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<TravelReview> listReview(Map<String, Object> map) {
		List<TravelReview> list=null;
		
		try {
			list=mapper.listReview(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
