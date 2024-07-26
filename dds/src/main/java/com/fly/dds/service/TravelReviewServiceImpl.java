package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fly.dds.common.FileManager;
import com.fly.dds.domain.TravelReview;
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
			long seq=mapper.travelreviewSeq();
			dto.setNum(seq);
			
			mapper.insertReview(dto);
			mapper.insertReviewArea(dto);
			
			if (!dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					String imageFilename = fileManager.doFileUpload(mf, pathname);
					if (imageFilename == null) {
						continue;
					}

					dto.setImageFilename(imageFilename);

					mapper.insertFile(dto);
				}
			}		
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
			for(TravelReview dto:list) {
				dto.setRegion_main(mapper.findAreaByNum(dto.getNum()).getRegion_main());
				dto.setRegion_sub(mapper.findAreaByNum(dto.getNum()).getRegion_sub());
			}
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
			TravelReview t=mapper.findAreaByNum(num);
			dto.setRegion_main(t.getRegion_main());
			dto.setRegion_sub(t.getRegion_sub());
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

	@Override
	public List<TravelReview> listFile(long num) {
		List<TravelReview> list=null;
		
		try {
			list=mapper.listFile(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
}
