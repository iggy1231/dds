package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import com.fly.dds.domain.Companion;
import com.fly.dds.domain.CompanionReply;

public interface CompanionService {
	public void insertCompanion(Companion dto, String pathname);
	public Companion findByNum(long num);
	public int dataCount();
	public List<Companion> listCompanion(Map<String, Object> map);
	public List<Companion> listBymainRegion(Map<String, Object> map);
	public List<Companion> similiarList(Map<String, Object> map);
	public int likeCount(long num);
	public boolean isCompanionLiked(Map<String, Object> likeMap);
	public void insertCompanionLike(Map<String, Object> likeMap);
	public void insertCompanionReply(Map<String, Object> map);
	public int replyCount(long num);
	public int replyLikeCount(long reply_num);
	public List<CompanionReply> listCompanionReply(Map<String, Object> map);
	public void deleteCompanionReply(long reply_num);
	public void insertCompanionReplyLike(Map<String, Object> map);
	public boolean isCompanionReplyLiked(Map<String, Object> map);
	public void insertCompanionAnswer(Map<String, Object> map);
	public List<Companion> listFile(long num);
	public List<Companion> PopularList(Map<String, Object> map);
	public List<Companion> areaPopularList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public int areaDataCount(Map<String, Object> map);
}
