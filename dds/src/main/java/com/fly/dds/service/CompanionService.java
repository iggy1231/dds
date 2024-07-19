package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import com.fly.dds.domain.Companion;
import com.fly.dds.domain.InfoReply;

public interface CompanionService {
	public void insertCompanion(Companion dto);
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
	public List<InfoReply> listCompanionReply(Map<String, Object> map);
	public void deleteCompanionReply(long reply_num);
	public void insertCompanionReplyLike(Map<String, Object> map);
	public boolean isCompanionReplyLiked(Map<String, Object> map);
}
