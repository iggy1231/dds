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
	public void updateReview(TravelReview dto);
	public void deleteReview(long num);
	public void TravelReview_Like(Map<String, Object> map);
	public int likeCount(long num);
	public int isBoardLike(Map<String, Object> map);
	public void insertFile(TravelReview dto);
	public long travelreviewSeq();
	public List<TravelReview> listFile(long num);
}
