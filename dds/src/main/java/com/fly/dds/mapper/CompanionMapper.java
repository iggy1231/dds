package com.fly.dds.mapper;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.annotations.Mapper;

import com.fly.dds.domain.Companion;
import com.fly.dds.domain.CompanionReply;

@Mapper
public interface CompanionMapper {
	public void insertCompanion(Companion dto);
	public void insertCompanionInfo(Companion dto);
	public void insertCompanionRegion(Companion dto);
	public void insertCompanionTheme(Companion dto);
	public void insertCompanionAge(String age);
	
	public Companion findByNum(long num);
	public String findThemeByNum(long num);
	public List<Companion> findRegionByNum(long num);
	public Set<String> findAgeByNum(long num);
	
	public int dataCount();
	public List<Companion> listCompanion(Map<String, Object> map);
	
	public long numBymainRegion(String mainRegion);
	public List<Companion> listBymainRegion(Map<String, Object> map);
	public List<Companion> similiarList(Map<String, Object> map);
	
	public int likeCount(long num);
	public void insertCompanionLike(Map<String, Object> map);
	public int isCompanionLiked(Map<String, Object> map);
	public void insertCompanionReply(Map<String, Object> map);
	public int replyCount(long num);
	public int replyLikeCount(long reply_num);
	public List<CompanionReply> listCompanionReply(Map<String, Object> map);
	public int isCompnaionReplyLiked(Map<String, Object> likeMap);
	public void deleteCompanionReply(long reply_num);
	public void insertCompanionReplyLike(Map<String, Object> map);
	public int isCompanionReplyLiked(Map<String, Object> map);
	public void insertCompanionAnswer(Map<String, Object> map);
	
	public long getSeq_num();
	public void insertCompanion_File(Companion dto);
	public List<Companion> listImgFile(long num);
	
	public List<Companion> PopularList(Map<String, Object> map);
	public List<Companion> areaPopularList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public int areaDataCount(Map<String, Object> map);
}
