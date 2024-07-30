package com.fly.dds.mapper;

import com.fly.dds.domain.TravelReviewReply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface TravelReviewReplyMapper {
    public void insertReply(TravelReviewReply reply);
    public List<TravelReviewReply> listReplies(long num);
    public void deleteReply(long replyNum);
    public void insertReReply(TravelReviewReply reply);
	public int isReplyReported(Map<String, Object> map);
	public void reportReply(Map<String, Object> map);
}
