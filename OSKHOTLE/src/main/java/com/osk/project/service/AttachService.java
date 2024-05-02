package com.osk.project.service;

import java.util.List;

import com.osk.project.domain.AttachVO;


public interface AttachService {
   
    int createAttach(AttachVO attachDTO);
    AttachVO getAttachById(int attachId);
    List<Integer> getAllId();
    int updateAttach(AttachVO attachDTO);
    int deleteAttach(int attachId);

}