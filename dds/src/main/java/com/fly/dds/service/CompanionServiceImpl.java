package com.fly.dds.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fly.dds.domain.Companion;
import com.fly.dds.mapper.CompanionMapper;

@Transactional(readOnly = true)
@Service
public class CompanionServiceImpl implements CompanionService {
	@Autowired
	private CompanionMapper mapper;
	
	@Transactional
	@Override
	public void insertCompanion(Companion dto) {
		try {
			mapper.insertCompanion(dto);
			mapper.insertCompanionInfo(dto);
			
			List<String> mainRegionList=dto.getRegion_main();
			List<String> subRegionList=dto.getRegion_sub();
			
			int idx=0;
			while(idx<mainRegionList.size()||idx<subRegionList.size()) {
				Companion c=new Companion();
				
				c.setMainRegion(mainRegionList.get(idx));
				c.setSubRegion(subRegionList.get(idx));
				
				mapper.insertCompanionRegion(c);
				idx++;
			}
			
			mapper.insertCompanionTheme(dto);
			for(String age:dto.getAge()) {
				mapper.insertCompanionAge(age);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Companion findByNum(long num) {
		Companion dto=null;
		
		try {
			dto=mapper.findByNum(num);
			String theme=mapper.findThemeByNum(num);
			List<Companion> region=mapper.findRegionByNum(num);
			Set<String> age=mapper.findAgeByNum(num);
			
			dto.setTheme(theme);
			List<String> mainRegionList=new ArrayList<String>();
			List<String> subRegionList=new ArrayList<String>();
			for(Companion c:region) {
				mainRegionList.add(c.getMainRegion());
				subRegionList.add(c.getSubRegion());
			}
			dto.setRegion_main(mainRegionList);
			dto.setRegion_sub(subRegionList);
			dto.setAge(age);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int dataCount() {
		int result=0;
		
		try {
			result=mapper.dataCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Companion> listCompanion(Map<String, Object> map) {
		List<Companion> list=null;
		List<Companion> result=new ArrayList<Companion>();
		try {
			list=mapper.listCompanion(map);
			for(Companion dto:list) {
				String theme=mapper.findThemeByNum(dto.getNum());
				List<Companion> region=mapper.findRegionByNum(dto.getNum());
				Set<String> age=mapper.findAgeByNum(dto.getNum());
				
				dto.setTheme(theme);
				List<String> mainRegionList=new ArrayList<String>();
				List<String> subRegionList=new ArrayList<String>();
				for(Companion c:region) {
					mainRegionList.add(c.getMainRegion());
					subRegionList.add(c.getSubRegion());
				}
				dto.setRegion_main(mainRegionList);
				dto.setRegion_sub(subRegionList);
				dto.setAge(age);
				
				result.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Companion> listBymainRegion(Map<String, Object> map) {
		List<Companion> list=null;
		List<Companion> result=new ArrayList<Companion>();
		try {
			list=mapper.listBymainRegion(map);
			for(Companion dto:list) {
				String theme=mapper.findThemeByNum(dto.getNum());
				List<Companion> region=mapper.findRegionByNum(dto.getNum());
				Set<String> age=mapper.findAgeByNum(dto.getNum());
				
				dto.setTheme(theme);
				List<String> mainRegionList=new ArrayList<String>();
				List<String> subRegionList=new ArrayList<String>();
				for(Companion c:region) {
					mainRegionList.add(c.getMainRegion());
					subRegionList.add(c.getSubRegion());
				}
				dto.setRegion_main(mainRegionList);
				dto.setRegion_sub(subRegionList);
				dto.setAge(age);
				
				result.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCountByArea(String mainRegion) {
		int result=0;
		
		try {
			result=mapper.dataCountByArea(mainRegion);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}
