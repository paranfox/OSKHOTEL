package com.osk.project.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.osk.project.domain.AttachVO;

@Mapper
public interface AttachMapper {
    int insert(AttachVO attach);
    AttachVO selectByAttachId(int attachId);
    List<Integer> selectIdList();
    int update(AttachVO attach);
    int delete(int attachId);
}