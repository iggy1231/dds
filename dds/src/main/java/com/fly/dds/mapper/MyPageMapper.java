package com.fly.dds.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fly.dds.domain.Companion;
import com.fly.dds.domain.Info;
import com.fly.dds.domain.Member;
import com.fly.dds.domain.MyPage;
import com.fly.dds.domain.Room;
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
	
	// 프로필 댓글 삭제
	public void deleteReply(@Param("boardname") String boardname ,@Param("reply_num") long reply_num) throws SQLException; 
	
	// 위시리스트 여행 후기
	public List<MyPage> listWishReview(Map<String, Object> map);
	public int wishReviewCount(Long user_num);
	
	// 위시리스트에서 항목 제거
    void deleteWishlistReview(@Param("userNum") long userNum, @Param("num") long num);
    void deleteWishlistInfo(@Param("userNum") long userNum, @Param("num") long num);
    void deleteWishlistCompanion(@Param("userNum") long userNum, @Param("num") long num);
    void deleteWishlistRoom(@Param("userNum") long userNum, @Param("num") long num);
    
    // 위시리스트 정보
    public List<Info> listWishInfo(Map<String, Object> map);
    public int wishInfoCount(Long user_num);
    
    // 위시리스트 동행
    public List<Companion> listWishCompanion(Map<String, Object> map);
    public int wishCompanionCount(Long user_num);
    
    // 동행 대기
    public List<Companion> listWaitingCompanion(Map<String, Object> map);
    public int waitingCompanionCount(Long user_num);
    public String companionThumbnail(long num);
    
    // 위시리스트 숙소
    public List<Room> listWishRoom(Map<String, Object> map);
    public int wishRoomCount(Long user_num);
    
    // 숙소 예약내역
    public List<Room> listMyRoom(Map<String, Object> map);
    
    void deleteRoom(Map<String, Object> params);
}
