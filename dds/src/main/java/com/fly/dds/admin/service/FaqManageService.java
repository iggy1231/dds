package com.fly.dds.admin.service;

import java.util.List;
import java.util.Map;

import com.fly.dds.admin.domain.FaqManage;

public interface FaqManageService {
	public void insertFaq(FaqManage dto) throws Exception;
	public void updateFaq(FaqManage dto) throws Exception;
	public void deleteFaq(Map<String, Object> map) throws Exception;
	
	public List<FaqManage> listFaq(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public FaqManage findById(long num);
	
	public void insertCategory(FaqManage dto) throws Exception;
	public List<FaqManage> listCategory(Map<String, Object> map);
	public void updateCategory(FaqManage dto) throws Exception;
	public void deleteCategory(long categoryNum) throws Exception;
}