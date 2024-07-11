package com.fly.dds.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fly.dds.domain.TravelReview;

@Mapper
public interface TravelReviewMapper {
	public void insertReview(TravelReview dto);
	public int dataCount(Map<String, Object> map);
	public List<TravelReview> listReview(Map<String, Object> map);
	public TravelReview findByNum(long num);
	public void updateHitCount(long num);
}
