package com.fly.dds.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fly.dds.admin.domain.FaqManage;
import com.fly.dds.admin.mapper.FaqManageMapper;

@Service
public class FaqManageServiceImpl implements FaqManageService {
	@Autowired
	private FaqManageMapper mapper;

	@Override
	public void insertFaq(FaqManage dto) throws Exception {
		try {
			mapper.insertFaq(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateFaq(FaqManage dto) throws Exception {
		try {
			mapper.updateFaq(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteFaq(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteFaq(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
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
	public List<FaqManage> listFaq(Map<String, Object> map) {
		List<FaqManage> list = null;

		try {
			list = mapper.listFaq(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}


	@Override
	public FaqManage findById(long num) {
		FaqManage dto = null;
		
		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void insertCategory(FaqManage dto) throws Exception {
		try {
			mapper.insertCategory(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateCategory(FaqManage dto) throws Exception {
		try {
			mapper.updateCategory(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<FaqManage> listCategory(Map<String, Object> map) {
		List<FaqManage> listCategory = null;
		
		try {
			listCategory = mapper.listCategory(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listCategory;
	}

	@Override
	public void deleteCategory(long categoryNum) throws Exception {
		try {
			mapper.deleteCategory(categoryNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
