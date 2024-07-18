package com.fly.dds.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fly.dds.domain.Companion;
import com.fly.dds.mapper.CompanionMapper;

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
			
			List<String> mainRegion=dto.getRegion_main();
			List<String> subRegion=dto.getRegion_sub();
			
			int idx=0;
			while(idx<mainRegion.size()||idx<subRegion.size()) {
				Companion c=new Companion();
				
				c.setMainRegion(mainRegion.get(idx));
				c.setSubRegion(subRegion.get(idx));
				
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

	public Companion findById(long num) {
		Companion dto=null;
		
		try {
			dto=mapper.findByid(num);
			String theme=mapper.findThemeByid(num);
			List<Companion> region=mapper.findRegionByid(num);
			Set<String> age=mapper.findAgeByid(num);
			
			dto.setTheme(theme);
			List<String> mainRegion=new ArrayList<String>();
			List<String> subRegion=new ArrayList<String>();
			for(Companion c:region) {
				mainRegion.add(c.getMainRegion());
				subRegion.add(c.getSubRegion());
			}
			dto.setRegion_main(mainRegion);
			dto.setRegion_sub(subRegion);
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
				String theme=mapper.findThemeByid(dto.getNum());
				List<Companion> region=mapper.findRegionByid(dto.getNum());
				Set<String> age=mapper.findAgeByid(dto.getNum());
				
				dto.setTheme(theme);
				List<String> mainRegion=new ArrayList<String>();
				List<String> subRegion=new ArrayList<String>();
				for(Companion c:region) {
					mainRegion.add(c.getMainRegion());
					subRegion.add(c.getSubRegion());
				}
				dto.setRegion_main(mainRegion);
				dto.setRegion_sub(subRegion);
				dto.setAge(age);
				
				result.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
