package com.fly.dds.service;

import com.fly.dds.domain.TravelReviewReply;

import java.util.List;

public interface TravelReviewReplyService {
    void insertReply(TravelReviewReply reply);
    List<TravelReviewReply> listReplies(long num);
    void insertReReply(TravelReviewReply reply);
    // 필요한 추가적인 메서드 선언
}
