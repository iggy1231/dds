package com.fly.dds.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fly.dds.domain.Info;
import com.fly.dds.domain.InfoReply;
import com.fly.dds.mapper.InfoMapper;

@Service
public class InfoServiceImpl implements InfoService {
	
	@Autowired
	private InfoMapper mapper;
	
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
	public List<Info> listInfo(Map<String, Object> map) {
		List<Info> list=null;
		
		try {
			list=mapper.listInfo(map);
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
	public Info findByNum(long num) {
		Info dto=null;
		
		try {
			dto=mapper.findByNum(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public boolean isInfoLiked(Map<String, Object> map) {
		
		try {
			if(mapper.isInfoLiked(map)>0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public void insertInfoLike(Map<String, Object> map) {
		try {
			mapper.insertInfoLike(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertInfoReply(Map<String, Object> map) {
		try {
			mapper.insertInfoReply(map);
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
	public List<InfoReply> listInfoReply(Map<String, Object> map) {
		List<InfoReply> list=null;
		
		try {
			list=mapper.listInfoReply(map);
			for(InfoReply dto:list) {
				if(map.get("login_user_num")==null) {
					dto.setLiked("false");
					continue;
				}
				Map<String, Object> likeMap=new HashMap<String, Object>();
				likeMap.put("reply_num", dto.getReply_num());
				likeMap.put("user_num", map.get("login_user_num"));

				if(mapper.isInfoReplyLiked(likeMap)>0) {
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
	public void insertInfoReplyLike(Map<String, Object> map) {
		try {
			mapper.insertinfoReplyLike(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean isInfoReplyLiked(Map<String, Object> map) {
		try {
			if(mapper.isInfoReplyLiked(map)>0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public List<Info> popularListInfo(Map<String, Object> map) {
		List<Info> list=null;
		
		try {
			list=mapper.popularListInfo(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void deleteInfoReply(long reply_num) {
		try {
			mapper.deleteInfoReply(reply_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void reportInfoReply(Map<String, Object> map) {
		try {
			mapper.reportInfoReply(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean isInfoReplyReported(Map<String, Object> map) {
		try {
			if(mapper.isInfoReplyReported(map)>0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}



}
