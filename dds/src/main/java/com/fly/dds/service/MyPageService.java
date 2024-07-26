package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import com.fly.dds.domain.Companion;
import com.fly.dds.domain.Info;
import com.fly.dds.domain.Member;
import com.fly.dds.domain.MyPage;
import com.fly.dds.domain.Room;
import com.fly.dds.domain.RoomQnA;
import com.fly.dds.domain.TravelReview;

public interface MyPageService {
	public void updateMbti(Member dto) throws Exception;
	public void updateProfile(Member dto , String pathname) throws Exception;
	public void updateInfo(Member dto) throws Exception;
	public void updateMember(Member dto) throws Exception;
	public void deleteMember(Long user_num) throws Exception;
	public int dataCount(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public Member findById(Long user_num);
	
	public void deleteInfo(Long user_num) throws Exception;
	public void deleteProfile(Long user_num) throws Exception;
	public List<TravelReview> listReview(Map<String, Object> map);
	public List<MyPage> listReply(Map<String, Object> map);
	
	public void deleteReply(String boardname , long reply_num) throws Exception; 
	
	public List<MyPage> listWishReview(Map<String, Object> map);
	public int wishReviewCount(long user_num);
	
	// 위시리스트에서 항목 제거
    void removeFromWishlist(long userNum, long travelReviewNum, String table_name) throws Exception;
	
    public List<Companion> listWishCompanion(Map<String, Object> map);
    public int wishCompanionCount(Long user_num);
    
    public List<Info> listWishInfo(Map<String, Object> map);
    public int wishInfoCount(Long user_num);
    
    // 동행 대기
    public List<Companion> listWaitingCompanion(Map<String, Object> map);
    public int waitingCompanionCount(Long user_num);
    
    public List<Room> listWishRoom(Map<String, Object> map);
    public int wishRoomCount(Long user_num);
    
    public Map<String, List<Room>> listMyRoom(Map<String, Object> map);
	
    // 숙소예약 삭제
    void deleteRoom(Map<String, Object> params);
    
    public List<RoomQnA> myRoomQnA(Map<String, Object> map);
    public int myRoomQnACount(Long user_num);
}
