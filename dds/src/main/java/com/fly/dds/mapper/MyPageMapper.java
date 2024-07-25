package com.fly.dds.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fly.dds.domain.Info;
import com.fly.dds.domain.Member;
import com.fly.dds.domain.MyPage;
import com.fly.dds.domain.TravelReview;

public interface MyPageMapper {
	public void updateMbti(Member dto) throws SQLException;
	public void updateProfile(Member dto) throws SQLException;
	public void updateInfo(Member dto) throws SQLException;
	public void updateMember(Member dto) throws SQLException;
	public void deleteMember(Long user_num) throws SQLException;
	
	public void deleteInfo(Long user_num) throws SQLException;
	public void deleteProfile(Long user_num) throws SQLException;
	public Member findById(Long user_num);
	
	public int dataCount(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public List<TravelReview> listReview(Map<String, Object> map);
	public List<MyPage> listReply(Map<String, Object> map);
	
	public void deleteReply(@Param("boardname") String boardname ,@Param("reply_num") long reply_num) throws SQLException; 
	
	public List<MyPage> listWishReview(Map<String, Object> map);
	public int wishReviewCount(Long user_num);
	
	// 위시리스트에서 항목 제거
    void deleteWishlistReview(@Param("userNum") long userNum, @Param("num") long num);
    void deleteWishlistInfo(@Param("userNum") long userNum, @Param("num") long num);
    
    public List<Info> listWishInfo(Map<String, Object> map);
    public int wishInfoCount(Long user_num);
    
}
