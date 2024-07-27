package com.fly.dds.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fly.dds.common.FileManager;
import com.fly.dds.domain.Companion;
import com.fly.dds.domain.Coupon;
import com.fly.dds.domain.Info;
import com.fly.dds.domain.Member;
import com.fly.dds.domain.MyPage;
import com.fly.dds.domain.Room;
import com.fly.dds.domain.RoomQnA;
import com.fly.dds.domain.RoomReview;
import com.fly.dds.domain.TravelReview;
import com.fly.dds.mapper.MyPageMapper;

@Service
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private MyPageMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void updateMbti(Member dto) throws Exception {
		try {
			mapper.updateMbti(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateProfile(Member dto , String pathname) throws Exception {
		try {
		
			String filename = fileManager.doFileUpload(dto.getPhotoFile(), pathname);
			dto.setPhoto(filename);
			mapper.updateProfile(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateInfo(Member dto) throws Exception {
		try {
			mapper.updateInfo(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateMember(Member dto) throws Exception {
		try {
			mapper.updateMember(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteMember(Long user_num) throws Exception {
		try {
			mapper.deleteMember(user_num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteInfo(Long user_num) throws Exception {
		try {
			mapper.deleteInfo(user_num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteProfile(Long user_num) throws Exception {
		try {
			mapper.deleteProfile(user_num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Member findById(Long user_num) {
		Member dto = null;
		
		try {
			
			dto = mapper.findById(user_num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<TravelReview> listReview(Map<String, Object> map) {
		List<TravelReview> list = null;
		try {
			list = mapper.listReview(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<MyPage> listReply(Map<String, Object> map) {
		List<MyPage> list = null;
		try {
			list = mapper.listReply(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.replyCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteReply(String boardname, long reply_num) throws Exception {
		try {
			mapper.deleteReply(boardname,reply_num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<MyPage> listWishReview(Map<String, Object> map) {
		List<MyPage> list = null;
		try {
			list = mapper.listWishReview(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int wishReviewCount(long user_num) {
		int result = 0;
		
		try {
			result = mapper.wishReviewCount(user_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void removeFromWishlist(long userNum, long num, String table_name) throws Exception {
		try {
			switch (table_name) {
			case "review" :  mapper.deleteWishlistReview(userNum, num); break;
			case "info" : mapper.deleteWishlistInfo(userNum, num); break;
			case "companion" : mapper.deleteWishlistCompanion(userNum, num); break;
			case "room" : mapper.deleteWishlistRoom(userNum, num); break;
			}
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
		
	}

	@Override
	public List<Info> listWishInfo(Map<String, Object> map) {
		List<Info> list = null;
		
		try {
			list = mapper.listWishInfo(map);
			for(Info dto:list) {
				Set<String> tag=new HashSet<String>();
				tag.add(dto.getContentType());
				tag.add(dto.getMain_Category());
				tag.add(dto.getMiddle_Category());
				tag.add(dto.getSub_Category());
	
				dto.setTags(tag);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int wishInfoCount(Long user_num) {
		int result = 0;
		
		try {
			result = mapper.wishInfoCount(user_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Companion> listWishCompanion(Map<String, Object> map) {
		List<Companion> list = null;
		try {
			list = mapper.listWishCompanion(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int wishCompanionCount(Long user_num) {
		int result = 0;
		
		try {
			result = mapper.wishCompanionCount(user_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Companion> listWaitingCompanion(Map<String, Object> map) {
		List<Companion> list = null;
		try {
			list = mapper.listWaitingCompanion(map);
			for(Companion dto:list) {
				dto.setSaveFilename(mapper.companionThumbnail(dto.getNum()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int waitingCompanionCount(Long user_num) {
		int result = 0;
		
		try {
			result = mapper.waitingCompanionCount(user_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Room> listWishRoom(Map<String, Object> map) {
		List<Room> list = null;
		try {
			list = mapper.listWishRoom(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int wishRoomCount(Long user_num) {
		int result = 0;
		
		try {
			result = mapper.wishRoomCount(user_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public Map<String, List<Room>> listMyRoom(Map<String, Object> map) {
	    Map<String, List<Room>> resultMap = new HashMap<>();
	    List<Room> currentTrips = new ArrayList<>();
	    List<Room> pastTrips = new ArrayList<>();

	    try {
	    	List<Room> list = mapper.listMyRoom(map);
            LocalDateTime today = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

            for (Room room : list) {
                LocalDateTime checkInDate = LocalDateTime.parse(room.getSdate(), formatter);
                LocalDateTime checkOutDate = LocalDateTime.parse(room.getEdate(), formatter);

                if (!today.isAfter(checkOutDate)) { // 오늘 날짜가 체크아웃 날짜 이후가 아니면 현재 여행 목록에 추가
                    currentTrips.add(room);
                } else { // 오늘 날짜가 체크아웃 날짜 이후이면 과거 여행 목록에 추가
                    pastTrips.add(room);
                }
            }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    resultMap.put("currentTrips", currentTrips);
	    resultMap.put("pastTrips", pastTrips);

	    return resultMap;
	}

	@Override
	public void deleteRoom(Map<String, Object> params) {
		System.out.println("Params: " + params); // 로그 추가
		try {
            mapper.deleteRoom(params);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("예약 삭제 중 오류 발생", e);
        }
		
	}

	@Override
	public List<RoomQnA> myRoomQnA(Map<String, Object> map) {
		List<RoomQnA> list = null;
		try {
			list = mapper.myRoomQnA(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int myRoomQnACount(Long user_num) {
		int result = 0;
		
		try {
			result = mapper.myRoomQnACount(user_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<RoomReview> myTripReview(Map<String, Object> map) {
		List<RoomReview> list = null;
		try {
			list = mapper.myTripReview(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int myTripCount(Long user_num) {
		int result = 0;
		
		try {
			result = mapper.myTripCount(user_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Companion> listIngCompanion(Map<String, Object> map) {
		List<Companion> list = null;
		try {
			list = mapper.listIngCompanion(map);
			for(Companion dto:list) {
				dto.setSaveFilename(mapper.companionThumbnail(dto.getNum()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int ingCompanionCount(Long user_num) {
		int result = 0;
		
		try {
			result = mapper.ingCompanionCount(user_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Companion> listPastCompanion(Map<String, Object> map) {
		List<Companion> list = null;
		try {
			list = mapper.listPastCompanion(map);
			for(Companion dto:list) {
				dto.setSaveFilename(mapper.companionThumbnail(dto.getNum()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int pastCompanionCount(Long user_num) {
		int result = 0;
		
		try {
			result = mapper.pastCompanionCount(user_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Companion> listMyCompanion(Map<String, Object> map) {
		List<Companion> list = null;
		try {
			list = mapper.listMyCompanion(map);
			for(Companion dto:list) {
				dto.setSaveFilename(mapper.companionThumbnail(dto.getNum()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int myCompanionCount(Long user_num) {
		int result = 0;
		
		try {
			result = mapper.myCompanionCount(user_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public Coupon findByCode(String code) {
		Coupon dto=null;
		
		try {
			dto=mapper.findByCode(code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void addCoupon(Map<String, Object> map) {
		try {
			mapper.addCoupon(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean isUsedCoupon(long num) {
		try {
			if(mapper.isUsedCoupon(num)>0) {
				return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	@Override
	public List<Coupon> listCouponAvailable() {
		List<Coupon> list=null;
		
		try {
			list=mapper.listCouponAvailable();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Coupon> listCouponDisabled() {
		List<Coupon> list=null;
		
		try {
			list=mapper.listCouponDisabled();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void updateCouponUse() {
		try {
			mapper.updateCouponUse();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
