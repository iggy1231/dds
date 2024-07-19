package com.fly.dds.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fly.dds.domain.Companion;
import com.fly.dds.domain.InfoReply;
import com.fly.dds.mapper.CompanionMapper;

@Transactional(readOnly = true)
@Service
public class CompanionServiceImpl implements CompanionService {
	@Autowired
	private CompanionMapper mapper;
	
	@Transactional
	@Override
	public void insertCompanion(Companion dto) {
		try {
			mapper.insertCompanion(dto);
			mapper.insertCompanionInfo(dto);
			
			List<String> mainRegionList=dto.getRegion_main();
			List<String> subRegionList=dto.getRegion_sub();
			
			int idx=0;
			while(idx<mainRegionList.size()||idx<subRegionList.size()) {
				Companion c=new Companion();
				
				c.setMainRegion(mainRegionList.get(idx));
				c.setSubRegion(subRegionList.get(idx));
				
				mapper.insertCompanionRegion(c);
				idx++;
			}
			
			mapper.insertCompanionTheme(dto);
			for(String age:dto.getAge()) {
				mapper.insertCompanionAge(age);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Companion findByNum(long num) {
		Companion dto=null;
		
		try {
			dto=mapper.findByNum(num);
			String theme=mapper.findThemeByNum(num);
			List<Companion> region=mapper.findRegionByNum(num);
			Set<String> age=mapper.findAgeByNum(num);
			
			dto.setTheme(theme);
			List<String> mainRegionList=new ArrayList<String>();
			List<String> subRegionList=new ArrayList<String>();
			for(Companion c:region) {
				mainRegionList.add(c.getMainRegion());
				subRegionList.add(c.getSubRegion());
			}
			dto.setRegion_main(mainRegionList);
			dto.setRegion_sub(subRegionList);
			dto.setAge(age);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int dataCount() {
		int result=0;
		
		try {
			result=mapper.dataCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Companion> listCompanion(Map<String, Object> map) {
		List<Companion> list=null;
		List<Companion> result=new ArrayList<Companion>();
		try {
			list=mapper.listCompanion(map);
			for(Companion dto:list) {
				String theme=mapper.findThemeByNum(dto.getNum());
				List<Companion> region=mapper.findRegionByNum(dto.getNum());
				Set<String> age=mapper.findAgeByNum(dto.getNum());
				
				dto.setTheme(theme);
				List<String> mainRegionList=new ArrayList<String>();
				List<String> subRegionList=new ArrayList<String>();
				for(Companion c:region) {
					mainRegionList.add(c.getMainRegion());
					subRegionList.add(c.getSubRegion());
				}
				dto.setRegion_main(mainRegionList);
				dto.setRegion_sub(subRegionList);
				dto.setAge(age);
				
				result.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Companion> listBymainRegion(Map<String, Object> map) {
		List<Companion> list=null;
		List<Companion> result=new ArrayList<Companion>();
		try {
			list=mapper.listBymainRegion(map);
			for(Companion dto:list) {
				String theme=mapper.findThemeByNum(dto.getNum());
				List<Companion> region=mapper.findRegionByNum(dto.getNum());
				Set<String> age=mapper.findAgeByNum(dto.getNum());
				
				dto.setTheme(theme);
				List<String> mainRegionList=new ArrayList<String>();
				List<String> subRegionList=new ArrayList<String>();
				for(Companion c:region) {
					mainRegionList.add(c.getMainRegion());
					subRegionList.add(c.getSubRegion());
				}
				dto.setRegion_main(mainRegionList);
				dto.setRegion_sub(subRegionList);
				dto.setAge(age);
				
				result.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Companion> similiarList(Map<String, Object> map) {
		List<Companion> list=null;
		List<Companion> result=new ArrayList<Companion>();
		try {
			list=mapper.similiarList(map);
			for(Companion dto:list) {
				String theme=mapper.findThemeByNum(dto.getNum());
				List<Companion> region=mapper.findRegionByNum(dto.getNum());
				Set<String> age=mapper.findAgeByNum(dto.getNum());
				
				dto.setTheme(theme);
				List<String> mainRegionList=new ArrayList<String>();
				List<String> subRegionList=new ArrayList<String>();
				for(Companion c:region) {
					mainRegionList.add(c.getMainRegion());
					subRegionList.add(c.getSubRegion());
				}
				dto.setRegion_main(mainRegionList);
				dto.setRegion_sub(subRegionList);
				dto.setAge(age);
				
				result.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int likeCount(long num) {
		int result=0;
		
		try {
			result=mapper.likeCount(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public boolean isCompanionLiked(Map<String, Object> map) {
		try {
			if(mapper.isCompanionLiked(map)>0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public void insertCompanionLike(Map<String, Object> map) {
		try {
			mapper.insertCompanionLike(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertCompanionReply(Map<String, Object> map) {
		try {
			mapper.insertCompanionReply(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int replyCount(long num) {
		int result=0;
		
		try {
			result=mapper.replyCount(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int replyLikeCount(long reply_num) {
		int result=0;
		
		try {
			result=mapper.replyLikeCount(reply_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<InfoReply> listCompanionReply(Map<String, Object> map) {
		List<InfoReply> list=null;
		
		try {
			list=mapper.listCompanionReply(map);
			for(InfoReply dto:list) {
				if(map.get("login_user_num")==null) {
					dto.setLiked("false");
					continue;
				}
				Map<String, Object> likeMap=new HashMap<String, Object>();
				likeMap.put("reply_num", dto.getReply_num());
				likeMap.put("user_num", map.get("login_user_num"));

				if(mapper.isCompnaionReplyLiked(likeMap)>0) {
					dto.setLiked("true");
				} else {
					dto.setLiked("false");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void deleteCompanionReply(long reply_num) {
		try {
			mapper.deleteCompanionReply(reply_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertCompanionReplyLike(Map<String, Object> map) {
		try {
			mapper.insertCompanionReplyLike(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean isCompanionReplyLiked(Map<String, Object> map) {
		try {
			if(mapper.isCompanionReplyLiked(map)>0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
}
