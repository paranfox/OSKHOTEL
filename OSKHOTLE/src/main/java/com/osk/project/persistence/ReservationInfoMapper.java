package com.osk.project.persistence;

import java.util.Date;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.osk.project.domain.ReservationInfoVO;

@Mapper
public interface ReservationInfoMapper {
	int insert(ReservationInfoVO reservationInfoVO); // 예약 등록
	List<ReservationInfoVO> selectList(); // 전체 예약 목록
	List<ReservationInfoVO> selectListByDate(Date reservationCheckIn, Date reservationCheckOut); // 일정 기간 내의 예약 정보
	int update(ReservationInfoVO reservationInfoVO); // 예약 정보 수정
	int delete(int reservationNo); // 예약 정보 삭제
	
} // end ReservationInfoMapper
