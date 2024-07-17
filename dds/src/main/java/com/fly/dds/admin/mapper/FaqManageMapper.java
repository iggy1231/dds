package com.fly.dds.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fly.dds.admin.domain.FaqManage;

@Mapper
public interface FaqManageMapper {
	public void insertFaq(FaqManage dto) throws SQLException;
	public void updateFaq(FaqManage dto) throws SQLException;
	public void deleteFaq(Map<String, Object> map) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<FaqManage> listFaq(Map<String, Object> map);
	
	public FaqManage findById(long num);
	public FaqManage findByPrev(Map<String, Object> map);
	public FaqManage findByNext(Map<String, Object> map);
	
	public void insertCategory(FaqManage dto) throws SQLException;
	public List<FaqManage> listCategory(Map<String, Object> map);
	public void updateCategory(FaqManage dto) throws SQLException;
	public void deleteCategory(long num) throws SQLException;
}
