package com.fly.dds.admin.service;

import java.util.List;
import java.util.Map;

import com.fly.dds.admin.domain.MemberManage;

public interface MemberManageService {
	public List<MemberManage> listMember(Map<String, Object> map);
	public int dataCount(Map<String, Object> map) throws Exception;
}
