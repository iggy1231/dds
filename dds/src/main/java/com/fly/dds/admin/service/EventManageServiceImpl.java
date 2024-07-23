package com.fly.dds.admin.service;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fly.dds.admin.domain.EventManage;
import com.fly.dds.admin.mapper.EventManageMapper;

@Service
public class EventManageServiceImpl implements EventManageService{
	@Autowired
	private EventManageMapper mapper;

	@Override
	public void insertEvent(EventManage dto) throws Exception {
		try {
			dto.setStartDate(dto.getSday() + " " + dto.getStime() + ":00");
			dto.setEndDate(dto.getEday() + " " + dto.getEtime() + ":00");
			if(dto.getWinnerNumber() !=0 && dto.getWday().length() != 0 && dto.getWtime().length() != 0) {
				dto.setWinningDate(dto.getWday() + " " + dto.getWtime() + ":00");
			}
			mapper.insertEvent(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateEvent(EventManage dto) throws Exception {
		try {
			dto.setStartDate(dto.getSday() + " " + dto.getStime() + ":00");
			dto.setEndDate(dto.getEday() + " " + dto.getEtime() + ":00");
			if(dto.getWinnerNumber() !=0 && dto.getWday().length() != 0 && dto.getWtime().length() != 0) {
				dto.setWinningDate(dto.getWday() + " " + dto.getWtime() + ":00");
			}
			
			mapper.updateEvent(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteEvent(long num) throws Exception {
		try {
			mapper.deleteEvent(num);
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
	public List<EventManage> listEvent(Map<String, Object> map) {
		List<EventManage> list = null;
		
		try {
			list = mapper.listEvent(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public EventManage findByNum(long num) {
		EventManage dto = null;
		
		try {
			dto = mapper.findByNum(num);
			
			if(dto != null) {
				dto.setSday(dto.getStartDate().substring(0, 10));
				dto.setStime(dto.getStartDate().substring(11));
				
				dto.setEday(dto.getEndDate().substring(0, 10));
				dto.setEtime(dto.getEndDate().substring(11));
				
				if(dto.getWinningDate() != null && dto.getWinningDate().length() != 0) {
					dto.setWday(dto.getWinningDate().substring(0, 10));
					dto.setWtime(dto.getWinningDate().substring(11));
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			mapper.updateHitCount(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public EventManage findByPrev(Map<String, Object> map) {
		EventManage dto = null;
		
		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public EventManage findByNext(Map<String, Object> map) {
		EventManage dto = null;
		
		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<EventManage> listEventTakers(long num) {
		List<EventManage> list = null;
		
		try {
			// 이벤트 응모자 목록
			list = mapper.listEventTakers(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void insertEventWinner(EventManage dto) throws Exception {
		try {
			
			if(dto.getWinEvent() == 1) {
				// 순위 없는 당첨자 발표
				mapper.insertEventWinner1(dto);
			} else {
				// 순위별 당첨자 발표
				List<EventManage> list = listEventTakers(dto.getNum());
				Collections.shuffle(list);
				
				int idx = 0;
				jump:
				for(int i = 0; i < dto.getRankCount().size(); i++) {
					for(int j = 0; j < dto.getRankCount().get(i); j++ ) {
						if(idx >= list.size()) {
							break jump;
						}
						
						dto.setUser_num(list.get(idx).getUser_num());
						dto.setRank(dto.getRankNum().get(i));
										
						mapper.insertEventWinner2(dto);
						
						idx++;
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<EventManage> listEventWinner(long num) {
		List<EventManage> list = null;
		
		try {
			// 이벤트 당첨자 리스트
			list = mapper.listEventWinner(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
}
