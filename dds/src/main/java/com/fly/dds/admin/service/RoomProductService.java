package com.fly.dds.admin.service;

import java.util.List;
import java.util.Map;

import com.fly.dds.domain.Room;

public interface RoomProductService {
	public void insertProduct(Room dto, String pathname) throws Exception;
	public void updateProduct(Room  dto, String pathname) throws Exception;
	public void deleteProduct(long productNum, String pathname) throws Exception;
	public void deleteProductFile(long fileNum, String pathname) throws Exception;
	public void deleteOptionDetail(long detailNum) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Room> listProduct(Map<String, Object> map);
	
	public Room findById(long productNum);
	public Room findByPrev(Map<String, Object> map);
	public Room findByNext(Map<String, Object> map);
	
	public List<Room> listProductFile(long productNum);
	public List<Room> listProductOption(long productNum);
	public List<Room> listOptionDetail(long optionNum);
	
	// 상품 상위 카테고리 목록
	public Room findByCategory(long categoryNum);
	public List<Room> listCategory();
	public List<Room> listSubCategory(long parentNum);
	
	// 상품 재고
	// public void updateProductStock(ProductStockManage dto) throws Exception;
	// public List<ProductStockManage> listProductStock(Map<String, Object> map);
}
