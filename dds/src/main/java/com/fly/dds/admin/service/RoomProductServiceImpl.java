package com.fly.dds.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fly.dds.admin.mapper.RoomManageMapper;
import com.fly.dds.common.FileManager;
import com.fly.dds.domain.Room;
import com.fly.dds.domain.RoomPayment;

@Service
public class RoomProductServiceImpl implements RoomProductService {
	@Autowired
	private RoomManageMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertProduct(Room dto, String pathname) throws Exception {
	    try {
	    	// 시퀀스
	    	long roomNum = mapper.roomSeq();
	    	dto.setNum(roomNum);
	    	// 썸내일 이미지
	    	String filename;
	        filename = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
	        dto.setThumbnail(filename);
	    	
	    	// 룸 테이블 추가
	        mapper.insertRoom(dto);
	        
	    	
	    	// 옵션 추가
	    	for(int i=0; i< dto.getNames().size(); i++) {
	    		dto.setName(dto.getNames().get(i));
	    		dto.setPeople(dto.getPeoples().get(i));
	    		dto.setPrice(dto.getPrices().get(i));
	    		dto.setDetail_content(dto.getDetail_contents().get(i));
	    		dto.setDiscount(dto.getDiscounts().get(i));
	    		
	    		
	    		// 파일 처리
	    		filename = fileManager.doFileUpload(dto.getDetailPhotoFiles().get(i), pathname);
	    		dto.setDetail_photo(filename);
	    		
	    		// INSERT
	    		mapper.insertRoomDetail(dto);
	    	}
	    	
	    	
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
	    
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw e;
	    }
	}

	@Override
	public void updateProduct(Room dto, String pathname) throws Exception {
		try {
			
			// 썸내일 이미지
	    	String filename;
	        filename = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
	        dto.setThumbnail(filename);
	    	
	    	// 룸 테이블 추가
	        mapper.updateRoom(dto);
	        
	     // 옵션 업데이트
	        List<String> names = dto.getNames();
	        if (names != null && !names.isEmpty()) {
	            for (int i = 0; i < names.size(); i++) {
	            	dto.setDetail_num(dto.getDetail_nums().get(i));
	                dto.setName(names.get(i));
	                dto.setPeople(dto.getPeoples().get(i));
	                dto.setPrice(dto.getPrices().get(i));
	                dto.setDetail_content(dto.getDetail_contents().get(i));
	                dto.setDiscount(dto.getDiscounts().get(i));

	                // 파일 처리
	                filename = fileManager.doFileUpload(dto.getDetailPhotoFiles().get(i), pathname);
	                if(filename != null) {
	                	dto.setDetail_photo(filename);
	                } else {
						dto.setDetail_photo(dto.getDetail_photos().get(i));
					}
	                
	                // INSERT 또는 UPDATE
	                if (dto.getDetail_num() == 0) {
	                    mapper.insertRoomDetail(dto);
	                } else {
	                    mapper.updateRoomDetail(dto);
	                }

	                // UPDATE
	               //  mapper.updateRoomDetail(dto);
	            }
	        }
	    	
	    	
	        // 추가 이미지 저장
	        if (dto.getAddFiles() != null && !dto.getAddFiles().isEmpty()) {
	            for (MultipartFile mf : dto.getAddFiles()) {
	                filename = fileManager.doFileUpload(mf, pathname);
	                if (filename == null) {
	                    continue;
	                }

	                dto.setPhoto(filename);
	                mapper.updateRoomFile(dto);
	            }
	        }	        
	    
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw e;
	    }
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
	
	// 숙소 개수
	@Override
	public int dataCountRoom(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 관리자 숙소 리스트
	@Override
	public List<Room> listRoomProduct(Map<String, Object> map) {
		List<Room> list = null;
		try {
			list = mapper.listRoom(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Room findById(long num) {
		Room dto = null;
		
		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return dto;
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
	public List<RoomPayment> listSale(Map<String, Object> map) {
		List<RoomPayment> list = null;
		
		try {
			list = mapper.listSale(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int saleCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = mapper.saleCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
}
