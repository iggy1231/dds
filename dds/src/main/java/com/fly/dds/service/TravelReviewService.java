package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import com.fly.dds.domain.TravelReview;

public interface TravelReviewService {
	public void reviewInsert(TravelReview dto, String pathname);

	public int dataCount(Map<String, Object> map);

	public List<TravelReview> listReview(Map<String, Object> map);

	public void updateHitCount(long num);

	public TravelReview findByNum(long num);
}
