package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fly.dds.common.FileManager;
import com.fly.dds.domain.RoomReview;
import com.fly.dds.domain.Summary;
import com.fly.dds.mapper.RoomReviewMapper;

@Service
public class RoomReviewServiceImpl implements RoomReviewService {
	
	@Autowired
	private RoomReviewMapper mapper;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertRoomReview(RoomReview dto, String pathname) throws Exception {
		try {
			
			mapper.insertRoomReview(dto);
			
			String filename;
	        filename = fileManager.doFileUpload(dto.getPhotoFile(), pathname);
	        dto.setPhoto(filename);
			
	        
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Summary findByRoomReviewSummary(Map<String, Object> map) {
		Summary dto = null;
		
		try {
			dto = mapper.findByRoomReviewSummary(map);
			
			dto.setScoreRate1((int)((double)dto.getScore1()/dto.getCount() * 100 + 0.5));
			dto.setScoreRate2((int)((double)dto.getScore2()/dto.getCount() * 100 + 0.5));
			dto.setScoreRate3((int)((double)dto.getScore3()/dto.getCount() * 100 + 0.5));
			dto.setScoreRate4((int)((double)dto.getScore4()/dto.getCount() * 100 + 0.5));
			dto.setScoreRate5((int)((double)dto.getScore5()/dto.getCount() * 100 + 0.5));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<RoomReview> listRoomReview(Map<String, Object> map) {
		
		List<RoomReview> list = null;
		
		try {
			list = mapper.listRoomReview(map);
			
			for(RoomReview dto : list) {
				
				if(dto.getPhoto() != null) {
					dto.setPhoto(dto.getPhoto());
				}
				
				dto.getNickName();
				dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
				
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
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
	public void updateRoomReview(RoomReview dto) throws Exception {
		try {
			mapper.updateRoomReview(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteRoomReview(long num) throws Exception {
		try {
			
			mapper.deleteRoomReview(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
