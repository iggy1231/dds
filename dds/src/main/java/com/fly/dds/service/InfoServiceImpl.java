package com.fly.dds.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fly.dds.common.MyUtil;
import com.fly.dds.domain.Info;
import com.fly.dds.mapper.InfoMapper;

@Service
public class InfoServiceImpl implements InfoService {
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private InfoMapper mapper;
	
	@Override
	public int dataCount() {
		int result = 0;

		try {
			result = mapper.dataCount();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<Info> listInfo(Map<String, Object> map) {
		List<Info> list=null;
		
		try {
			list=mapper.listInfo(map);
			for(Info dto:list) {
				Map<String, Object> areaMap=null;
				Map<String, Object> categoryMap=null;
				areaMap=myUtil.areaCode(Integer.parseInt(dto.getRegion_Main()), Integer.parseInt(dto.getRegion_Sub()));
				categoryMap=myUtil.categoryCode(dto.getMain_Category(), dto.getMiddle_Category(), dto.getSub_Category());
				
				dto.setRegion_Main(areaMap.get("areaCode").toString());
				dto.setRegion_Sub(areaMap.get("sigunguCode").toString());
				dto.setMain_Category(categoryMap.get("category1").toString());
				dto.setMiddle_Category(categoryMap.get("category2").toString());
				dto.setSub_Category(categoryMap.get("category3").toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
