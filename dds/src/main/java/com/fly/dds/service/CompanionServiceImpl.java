package com.fly.dds.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.fly.dds.common.FileManager;
import com.fly.dds.domain.Companion;
import com.fly.dds.domain.CompanionApply;
import com.fly.dds.domain.CompanionReply;
import com.fly.dds.mapper.CompanionMapper;

@Transactional(readOnly = true)
@Service
public class CompanionServiceImpl implements CompanionService {
	@Autowired
	private CompanionMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Transactional
	@Override
	public void insertCompanion(Companion dto, String pathname) {
		try {
			long seq=mapper.getSeq_num();
			dto.setNum(seq);
			mapper.insertCompanion(dto);
			
			if(!dto.getImgFiles().isEmpty()) {
				for(MultipartFile mf:dto.getImgFiles()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if (saveFilename == null) {
						continue;
					}
					dto.setSaveFilename(saveFilename);
					mapper.insertCompanion_File(dto);
				}
			}
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("num", dto.getNum());
			map.put("user_num", dto.getUser_num());
			map.put("nickname", dto.getNickname());
			map.put("status", "참여");
			mapper.apply(map);
			
			dto.setCurrent_people(mapper.applyCount(dto.getNum()));
			
			mapper.insertCompanionInfo(dto);
			
			List<String> mainRegionList=dto.getRegion_main();
			List<String> subRegionList=dto.getRegion_sub();
			
			int idx=0;
			while(idx<mainRegionList.size()||idx<subRegionList.size()) {
				Companion c=new Companion();
				c.setNum(seq);
				c.setMainRegion(mainRegionList.get(idx));
				c.setSubRegion(subRegionList.get(idx));
				
				mapper.insertCompanionRegion(c);
				idx++;
			}
			
			mapper.insertCompanionTheme(dto);
			mapper.insertCompanionAge(dto);

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
			dto.setAge(mapper.findAgeByNum(num));
			
			dto.setTheme(theme);
			List<String> mainRegionList=new ArrayList<String>();
			List<String> subRegionList=new ArrayList<String>();
			for(Companion c:region) {
				mainRegionList.add(c.getMainRegion());
				subRegionList.add(c.getSubRegion());
			}
			dto.setRegion_main(mainRegionList);
			dto.setRegion_sub(subRegionList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int dataCountall() {
		int result=0;
		
		try {
			result=mapper.dataCountall();
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
				String age=mapper.findAgeByNum(dto.getNum());
				
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
				
				dto.setSaveFilename(mapper.findFileByNum(dto.getNum()));
				
				result.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public List<Companion> listCompanionGenderAge(Map<String, Object> map) {
		List<Companion> list=null;
		List<Companion> result=new ArrayList<Companion>();
		try {
			list=mapper.listCompanionGenderAge(map);
			for(Companion dto:list) {
				String theme=mapper.findThemeByNum(dto.getNum());
				List<Companion> region=mapper.findRegionByNum(dto.getNum());
				String age=mapper.findAgeByNum(dto.getNum());
				
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
				
				dto.setSaveFilename(mapper.findFileByNum(dto.getNum()));
				
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
				String age=mapper.findAgeByNum(dto.getNum());
				
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
				
				dto.setSaveFilename(mapper.findFileByNum(dto.getNum()));
				
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
				String age=mapper.findAgeByNum(dto.getNum());
				
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
				
				dto.setSaveFilename(mapper.findFileByNum(dto.getNum()));
				
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
	public List<CompanionReply> listCompanionReply(Map<String, Object> map) {
		List<CompanionReply> list=null;
		
		try {
			list=mapper.listCompanionReply(map);
			for(CompanionReply dto:list) {
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

	@Override
	public void insertCompanionAnswer(Map<String, Object> map) {
		try {
			mapper.insertCompanionAnswer(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Companion> listFile(long num) {
		List<Companion> list=null;
		
		try {
			list=mapper.listImgFile(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Companion> PopularList(Map<String, Object> map) {
		List<Companion> list=null;
		List<Companion> result=new ArrayList<Companion>();
		try {
			list=mapper.PopularList(map);
			for(Companion dto:list) {
				String theme=mapper.findThemeByNum(dto.getNum());
				List<Companion> region=mapper.findRegionByNum(dto.getNum());
				String age=mapper.findAgeByNum(dto.getNum());
				
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
				
				dto.setSaveFilename(mapper.findFileByNum(dto.getNum()));
				
				result.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Companion> areaPopularList(Map<String, Object> map) {
		List<Companion> list=null;
		List<Companion> result=new ArrayList<Companion>();
		try {
			list=mapper.areaPopularList(map);
			for(Companion dto:list) {
				String theme=mapper.findThemeByNum(dto.getNum());
				List<Companion> region=mapper.findRegionByNum(dto.getNum());
				String age=mapper.findAgeByNum(dto.getNum());
				
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
				
				dto.setSaveFilename(mapper.findFileByNum(dto.getNum()));
				
				result.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		result=mapper.dataCount(map);
		return result;
	}

	@Override
	public int areaDataCount(Map<String, Object> map) {
		int result=0;
		result=mapper.areaDataCount(map);
		return result;
	}

	@Override
	public void apply(Map<String, Object> map) {
		try {
			mapper.apply(map);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public int applyCount(long num) {
		int result=0;
		
		try {
			result=mapper.applyCount(num);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}

	@Override
	public void updateHitCount(long num) {
		mapper.updateHitCount(num);
	}

	@Override
	public List<CompanionApply> waitingList(long num) {
		List<CompanionApply> list=null;
		
		try {
			list=mapper.waitingList(num);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}

	@Override
	public List<CompanionApply> partyList(long num) {
		List<CompanionApply> list=null;
	
		try {
			list=mapper.partyList(num);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}

	@Override
	public void accept(Map<String, Object> map) {
		try {
			long num=Long.parseLong(map.get("num").toString());
			Companion c=mapper.findByNum(num);
			if(c.getCurrent_people()==c.getTotal_people()) {
				return;
			}
			mapper.accept(map);
			mapper.updateCurrentPeople(map);
		} catch (Exception e) {
			// TODO: handle exception
		}	
	}

	@Override
	public void reject(Map<String, Object> map) {
		mapper.reject(map);
	}

	@Override
	public void vanish(Map<String, Object> map) {
		mapper.vanish(map);
		mapper.updateCurrentPeople(map);
	}

	@Override
	public boolean isApplied(Map<String, Object> map) {
		try {
			if(mapper.isApplied(map)>0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public List<Companion> popularListCompanion(Map<String, Object> map) {
		List<Companion> list=null;
		List<Companion> result=new ArrayList<Companion>();
		try {
			list=mapper.popularListCompanion(map);
			for(Companion dto:list) {
				String theme=mapper.findThemeByNum(dto.getNum());
				List<Companion> region=mapper.findRegionByNum(dto.getNum());
				String age=mapper.findAgeByNum(dto.getNum());
				
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
				
				dto.setSaveFilename(mapper.findFileByNum(dto.getNum()));
				
				result.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Companion> popularListBymainRegion(Map<String, Object> map) {
		List<Companion> list=null;
		List<Companion> result=new ArrayList<Companion>();
		try {
			list=mapper.popularListBymainRegion(map);
			for(Companion dto:list) {
				String theme=mapper.findThemeByNum(dto.getNum());
				List<Companion> region=mapper.findRegionByNum(dto.getNum());
				String age=mapper.findAgeByNum(dto.getNum());
				
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
				
				dto.setSaveFilename(mapper.findFileByNum(dto.getNum()));
				
				result.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void deleteCompanion(long num) {
		mapper.deleteCompanion(num);
	}

	@Override
	public void endCompanion(long num) {
		mapper.endCompanion(num);
		mapper.endCompanionInfo(num);
		mapper.deleteCompanionInfo(num);
	}
	
	@Override
	public void reportCompanionReply(Map<String, Object> map) {
		try {
			mapper.reportCompanionReply(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean isCompanionReplyReported(Map<String, Object> map) {
		try {
			if(mapper.isCompanionReplyReported(map)>0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public void updateCompanion(Companion dto, String pathname) {
		try {
			mapper.updateCompanion(dto);
			
			mapper.deleteFile(dto.getNum());
			
			if(!dto.getImgFiles().isEmpty()) {
				for(MultipartFile mf:dto.getImgFiles()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if (saveFilename == null) {
						continue;
					}
					dto.setSaveFilename(saveFilename);
					mapper.insertCompanion_File(dto);
				}
			}
			mapper.updateCompanionInfo(dto);
			
			mapper.deleteRegion(dto.getNum());
			
			List<String> mainRegionList=dto.getRegion_main();
			List<String> subRegionList=dto.getRegion_sub();

			int idx=0;
			while(idx<mainRegionList.size()||idx<subRegionList.size()) {
				Companion c=new Companion();
				c.setNum(dto.getNum());
				c.setMainRegion(mainRegionList.get(idx));
				c.setSubRegion(subRegionList.get(idx));
				
				mapper.insertCompanionRegion(c);
				idx++;
			}
			
			mapper.updateCompanionTheme(dto);
			mapper.updateCompanionAge(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void reportCompanion(Map<String, Object> map) {
		try {
			mapper.reportCompanion(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean isCompanionReported(Map<String, Object> map) {
		try {
			if(mapper.isCompanionReported(map)>0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
}
