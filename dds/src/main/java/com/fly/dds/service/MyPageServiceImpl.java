package com.fly.dds.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fly.dds.common.FileManager;
import com.fly.dds.domain.Member;
import com.fly.dds.mapper.MyPageMapper;

@Service
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private MyPageMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void updateMbti(Member dto) throws Exception {
		try {
			mapper.updateMbti(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateProfile(Member dto , String pathname) throws Exception {
		try {
		
			String filename = fileManager.doFileUpload(dto.getPhotoFile(), pathname);
			dto.setPhoto(filename);
			mapper.updateProfile(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateInfo(Member dto) throws Exception {
		try {
			mapper.updateInfo(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateMember(Member dto) throws Exception {
		try {
			mapper.updateMember(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteMember(Long user_num) throws Exception {
		try {
			mapper.deleteMember(user_num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteInfo(Long user_num) throws Exception {
		try {
			mapper.deleteInfo(user_num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteProfile(Long user_num) throws Exception {
		try {
			mapper.deleteProfile(user_num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Member findById(Long user_num) {
		Member dto = null;
		
		try {
			
			dto = mapper.findById(user_num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
}
