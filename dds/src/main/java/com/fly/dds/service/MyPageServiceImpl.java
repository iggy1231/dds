package com.fly.dds.service;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fly.dds.common.FileManager;
import com.fly.dds.domain.Companion;
import com.fly.dds.domain.Info;
import com.fly.dds.domain.Member;
import com.fly.dds.domain.MyPage;
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
	
}
