package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import com.fly.dds.domain.Info;
import com.fly.dds.domain.InfoReply;

public interface InfoService {
	public int dataCount(Map<String, Object> map);	
	public List<Info> listInfo(Map<String, Object> map);
	public int likeCount(long num);
	public Info findByNum(long num);
	public boolean isInfoLiked(Map<String, Object> map);
	public void insertInfoLike(Map<String, Object> map);
	public void insertInfoReply(Map<String, Object> map);
	public int replyCount(long num);
	public List<InfoReply> listInfoReply(Map<String, Object> map);
	public int replyLikeCount(long reply_num);
	public void insertInfoReplyLike(Map<String, Object> map);
	public boolean isInfoReplyLiked(Map<String, Object> map);
	public List<Info> popularListallInfo(Map<String, Object> map);
	public void deleteInfoReply(long reply_num);
	public void reportInfoReply(Map<String, Object> map);
	public boolean isInfoReplyReported(Map<String, Object> map);
	public int countPopularData();
	public List<Info> popularListInfo(Map<String, Object> map);
}
