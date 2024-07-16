package com.fly.dds.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fly.dds.domain.Info;
import com.fly.dds.domain.InfoReply;

@Mapper
public interface InfoMapper {
	public int dataCount();
	public int dataCount(Map<String, Object> map);
	public List<Info> listInfo(Map<String, Object> map);
	public int likeCount(long num);
	public Info findByNum(long num);
	public int isInfoLiked(Map<String, Object> map);
	public void insertInfoLike(Map<String, Object> map);
	public void insertInfoReply(Map<String, Object> map);
	public int replyCount(long num);
	public List<InfoReply> listInfoReply(Map<String, Object> map);
	public int replyLikeCount(long reply_num);
	public void insertinfoReplyLike(Map<String, Object> map);
	public int isInfoReplyLiked(Map<String, Object> map);
	public List<Info> popularListallInfo(Map<String, Object> map);
	public void deleteInfoReply(long reply_num);
	public void reportInfoReply(Map<String, Object> map);
	public int isInfoReplyReported(Map<String, Object> map);
	public int countPopularData();
	public List<Info> popularListInfo(Map<String, Object> map);
}