package com.fly.dds.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fly.dds.admin.domain.MemberManage;
import com.fly.dds.admin.domain.ReportManage;

@Mapper
public interface MemberManageMapper {
	public List<MemberManage> listMember(Map<String, Object> map);
	public int dataCount(Map<String, Object> map) throws SQLException;
	public int reportCount() throws SQLException;
	public List<ReportManage> listReportMember(ReportManage dto);
	
	public int banCount() throws SQLException;
	public List<ReportManage> listBan();
	
	public void insertBan(MemberManage dto);
	public void updateBan(Long user_num);
	public MemberManage checkBan(Long user_num) throws SQLException;
}
