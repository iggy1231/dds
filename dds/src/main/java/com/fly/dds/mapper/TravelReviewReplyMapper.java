package com.fly.dds.mapper;

import com.fly.dds.domain.TravelReviewReply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TravelReviewReplyMapper {
    void insertReply(TravelReviewReply reply);
    List<TravelReviewReply> listReplies(long num);
    void insertReReply(TravelReviewReply reply);
    // 필요한 추가적인 메서드 선언
}
