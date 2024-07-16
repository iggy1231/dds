package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import com.fly.dds.domain.Faq;

public interface FaqService {
	public int dataCount(Map<String, Object> map);
	public List<Faq> listFaq(Map<String, Object> map);
	
	public List<Faq> listCategory(Map<String, Object> map);
}
