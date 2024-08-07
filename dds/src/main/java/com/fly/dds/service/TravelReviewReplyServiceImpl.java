package com.fly.dds.service;

import com.fly.dds.domain.TravelReviewReply;
import com.fly.dds.mapper.TravelReviewReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TravelReviewReplyServiceImpl implements TravelReviewReplyService {
    @Autowired
    private TravelReviewReplyMapper mapper;

    @Override
    public void insertReply(TravelReviewReply reply) {
        try {
            mapper.insertReply(reply);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<TravelReviewReply> listReplies(long num) {
        List<TravelReviewReply> list = null;
        try {
            list = mapper.listReplies(num);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

	@Override
	public void deleteReply(long replyNum) {
		try {
			
			mapper.deleteReply(replyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertReReply(TravelReviewReply reply) {
		try {
			mapper.insertReReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public boolean isReplyReported(Map<String, Object> map) {
		try {
			if(mapper.isReplyReported(map)>0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public void reportReply(Map<String, Object> map) {
		try {
			mapper.reportReply(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
