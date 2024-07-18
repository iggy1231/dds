package com.fly.dds.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fly.dds.admin.mapper.RoomManageMapper;
import com.fly.dds.common.FileManager;
import com.fly.dds.domain.Room;

@Service
public class RoomProductServiceImpl implements RoomProductService {
	@Autowired
	private RoomManageMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertProduct(Room dto, String pathname) throws Exception {
	    try {
	        // 썸네일 이미지 업로드
	        String filename = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
	        dto.setThumbnail(filename);

	        // 상세 이미지 업로드
	        filename = fileManager.doFileUpload(dto.getDetailPhotoFile(), pathname);
	        dto.setDetail_photo(filename);

	        mapper.insertRoom(dto);
	        mapper.insertKeyword(dto);
	        mapper.insertRoomFacility(dto);

	        // 추가 이미지 저장
	        if (dto.getAddFiles() != null && !dto.getAddFiles().isEmpty()) {
	            for (MultipartFile mf : dto.getAddFiles()) {
	                filename = fileManager.doFileUpload(mf, pathname);
	                if (filename == null) {
	                    continue;
	                }

	                dto.setPhoto(filename);
	                mapper.insertRoomFile(dto);
	            }
	        }

	        mapper.insertRoomDetail(dto);
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw e;
	    }
	}

	@Override
	public void updateProduct(Room dto, String pathname) throws Exception {
		
	}

	@Override
	public void deleteProduct(long productNum, String pathname) throws Exception {
		
	}

	@Override
	public void deleteProductFile(long fileNum, String pathname) throws Exception {
		
	}

	@Override
	public void deleteOptionDetail(long detailNum) throws Exception {
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		return 0;
	}

	@Override
	public List<Room> listProduct(Map<String, Object> map) {
		return null;
	}

	@Override
	public Room findById(long productNum) {
		return null;
	}

	@Override
	public Room findByPrev(Map<String, Object> map) {
		return null;
	}

	@Override
	public Room findByNext(Map<String, Object> map) {
		return null;
	}

	@Override
	public List<Room> listProductFile(long productNum) {
		return null;
	}

	@Override
	public List<Room> listProductOption(long productNum) {
		return null;
	}

	@Override
	public List<Room> listOptionDetail(long optionNum) {
		return null;
	}

	@Override
	public Room findByCategory(long categoryNum) {
		return null;
	}

	@Override
	public List<Room> listCategory() {
		return null;
	}

	@Override
	public List<Room> listSubCategory(long parentNum) {
		return null;
	}
	
}
