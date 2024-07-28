package com.fly.dds.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fly.dds.admin.domain.ReportManage;

@Mapper
public interface ReportManageMapper {
	public List<ReportManage> listReportMember(ReportManage dto);
} 
