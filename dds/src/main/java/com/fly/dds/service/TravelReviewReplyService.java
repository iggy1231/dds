package com.fly.dds.service;

import com.fly.dds.domain.TravelReviewReply;

import java.util.List;

public interface TravelReviewReplyService {
    public void insertReply(TravelReviewReply reply);
    public List<TravelReviewReply> listReplies(long num);
    public void insertReReply(TravelReviewReply reply);
    public void deleteReply(long replyNum);
}
