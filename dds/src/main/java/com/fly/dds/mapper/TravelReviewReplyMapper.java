package com.fly.dds.mapper;

import com.fly.dds.domain.TravelReviewReply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TravelReviewReplyMapper {
    public void insertReply(TravelReviewReply reply);
    public List<TravelReviewReply> listReplies(long num);
    public void insertReReply(TravelReviewReply reply);
    public void deleteReply(long replyNum);
}
