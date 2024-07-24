package com.fly.dds.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fly.dds.admin.domain.MemberManage;

@Mapper
public interface MemberManageMapper {
	public List<MemberManage> listMember(Map<String, Object> map);
	public int dataCount(Map<String, Object> map) throws SQLException;
}
