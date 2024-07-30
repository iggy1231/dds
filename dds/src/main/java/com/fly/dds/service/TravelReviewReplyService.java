package com.fly.dds.service;

import com.fly.dds.domain.TravelReviewReply;

import java.util.List;
import java.util.Map;

public interface TravelReviewReplyService {
    public void insertReply(TravelReviewReply reply);
    public List<TravelReviewReply> listReplies(long num);
    public void deleteReply(long replyNum);
    public void insertReReply(TravelReviewReply reply);
	public boolean isReplyReported(Map<String, Object> map);
	public void reportReply(Map<String, Object> map);
}
