package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import com.fly.dds.domain.TravelReview;
import com.fly.dds.domain.TravelReviewReply;

public interface TravelReviewService {
	public void reviewInsert(TravelReview dto, String pathname);

	public int dataCount(Map<String, Object> map);

	public List<TravelReview> listReview(Map<String, Object> map);

	public void updateHitCount(long num);

	public TravelReview findByNum(long num);

	public void updateReview(TravelReview dto);

	public void deleteReview(long num);
	
	public void TravelReview_Like(Map<String, Object> map);
	
	public int likeCount(long num);
	
	public boolean isBoardLike(Map<String, Object> map);
}
