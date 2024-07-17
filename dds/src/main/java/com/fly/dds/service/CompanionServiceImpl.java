package com.fly.dds.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fly.dds.domain.Companion;
import com.fly.dds.mapper.CompanionMapper;

@Service
public class CompanionServiceImpl implements CompanionService {
	@Autowired
	private CompanionMapper mapper;
	
	@Override
	public void insertCompanion(Companion dto) {
		// TODO Auto-generated method stub
		
	}

}
