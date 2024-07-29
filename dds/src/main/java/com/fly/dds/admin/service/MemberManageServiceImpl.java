package com.fly.dds.admin.service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fly.dds.admin.domain.MemberManage;
import com.fly.dds.admin.domain.ReportManage;
import com.fly.dds.admin.mapper.MemberManageMapper;

@Service
public class MemberManageServiceImpl implements MemberManageService {
	@Autowired
	private MemberManageMapper mapper;
	
	@Override
	public List<MemberManage> listMember(Map<String, Object> map) {
		List<MemberManage> list = null;
		
		try {
			list = mapper.listMember(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return result;
	}

	@Override
	public List<ReportManage> listReportMember(ReportManage dto) {
		List<ReportManage> list = null;
		
		try {
			list = mapper.listReportMember(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int reportCount() throws Exception {
		int result = 0;
		try {
			result = mapper.reportCount();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return result;
	}

	@Override
	public int banCount() throws Exception {
		int result = 0;
		
		try {
			result=mapper.banCount();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return result;
	}

	@Override
	public List<ReportManage> listBan() {
	List<ReportManage> list = null;
		
		try {
			list = mapper.listBan();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void insertBan(MemberManage dto) {
		try {
			mapper.insertBan(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateBan(Long user_num) {
		try {
			mapper.updateBan(user_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public MemberManage checkBan(Long user_num) throws Exception {
		MemberManage dto = null;
		try {
			dto = mapper.checkBan(user_num);
			
			int banState = dto.getBan_state();
			 LocalDateTime bandate = convertStringToLocalDateTime(dto.getBan_edate());
			if(banState == 1 && bandate.isBefore(LocalDateTime.now())) {
				System.out.println("밴시간확인" +bandate);
				mapper.updateBan(user_num);
				dto.setBan_state(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return dto;
	}

    private LocalDateTime convertStringToLocalDateTime(String banEdate) throws DateTimeParseException {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");


        return LocalDateTime.parse(banEdate, formatter);
    }

}
