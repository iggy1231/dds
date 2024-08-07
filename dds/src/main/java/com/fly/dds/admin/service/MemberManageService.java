package com.fly.dds.admin.service;

import java.util.List;
import java.util.Map;

import com.fly.dds.admin.domain.MemberManage;
import com.fly.dds.admin.domain.ReportManage;

public interface MemberManageService {
	public List<MemberManage> listMember(Map<String, Object> map);
	public int dataCount(Map<String, Object> map) throws Exception;
	public int reportCount() throws Exception;
	public List<ReportManage> listReportMember(ReportManage dto);
	
	public int banCount() throws Exception;
	public List<ReportManage> listBan();
	
	public void insertBan(MemberManage dto);
	public void updateBan(Long user_num);
	public MemberManage checkBan(Long user_num) throws Exception;
}
