package com.fly.dds.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fly.dds.domain.RoomQnA;
import com.fly.dds.mapper.RoomQnAMapper;

@Service
public class RoomQnAServiceImpl implements RoomQnAService {
	@Autowired
	private RoomQnAMapper mapper;
	
	@Override
	public void insertQnA(RoomQnA dto) throws Exception {
		try {
			mapper.insertQnA(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<RoomQnA> listQnA(Map<String, Object> map) {
		List<RoomQnA> list = null;
		
		try {
			list = mapper.listQnA(map);
			
			String s;
			for(RoomQnA dto : list) {
				s = dto.getUserName().substring(0,1);
				if(dto.getUserName().length() <= 2) {
					s += "*";
				} else {
					s += dto.getUserName().substring(2, dto.getUserName().length()).replaceAll(".", "*");
				}
				s += dto.getUserName().substring(dto.getUserName().length()-1);
				dto.setUserName(s);
				
				dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
				
				if(dto.getAnswer() != null) {
					dto.setAnswer(dto.getAnswer().replaceAll("\n", "<br>"));
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void updateQnA(RoomQnA dto) throws Exception {
		try {
			mapper.updateQnA(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int dataCount2(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount2(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<RoomQnA> listQnA2(Map<String, Object> map) {
		List<RoomQnA> list = null;
		
		try {
			list = mapper.listQnA2(map);
			
			for(RoomQnA dto : list) {
				dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
				
				
				if(dto.getAnswer() != null) {
					dto.setAnswer(dto.getAnswer().replaceAll("\n", "<br>"));
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void deleteQnA(long qna_num) throws Exception {
		try {
			mapper.deleteQnA(qna_num);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
}
