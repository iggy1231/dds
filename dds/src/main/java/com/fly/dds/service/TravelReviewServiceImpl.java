package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fly.dds.common.FileManager;
import com.fly.dds.domain.TravelReview;
import com.fly.dds.domain.TravelReviewReply;
import com.fly.dds.mapper.TravelReviewMapper;

@Service
public class TravelReviewServiceImpl implements TravelReviewService {
	@Autowired
	private TravelReviewMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void reviewInsert(TravelReview dto, String pathname) {
		try {
			String saveFilename = 
					fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if(saveFilename != null) {
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getSelectFile().getOriginalFilename());
			}
			
			
			mapper.insertReview(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	public void updateHitCount(long num) {
		try {
			mapper.updateHitCount(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public TravelReview findByNum(long num) {
		TravelReview dto = null;
		
		try {
			dto = mapper.findByNum(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateReview(TravelReview dto) {
		try {
			mapper.updateReview(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteReview(long num) {
		try {
			mapper.deleteReview(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void TravelReview_Like(Map<String, Object> map) {
		try {
			mapper.TravelReview_Like(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int likeCount(long num) {
		int result=0;
		
		try {
			result=mapper.likeCount(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public boolean isBoardLike(Map<String, Object> map) {
		try {
			if(mapper.isBoardLike(map)>0) {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

}
