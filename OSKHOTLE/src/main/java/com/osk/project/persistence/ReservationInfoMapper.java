package com.osk.project.persistence;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.osk.project.domain.ReservationInfoVO;
import com.osk.project.util.Pagination;

@Mapper
public interface ReservationInfoMapper {
	int insert(ReservationInfoVO reservationInfoVO); // 예약 등록
	List<ReservationInfoVO> selectList(); // 전체 예약 목록
	List<ReservationInfoVO> selectListByDate(Date reservationCheckIn, Date reservationCheckOut); // 일정 기간 내의 예약 정보
	ReservationInfoVO selectOne(int reservationNo); // 특정 예약 정보 조회
	int update(ReservationInfoVO reservationInfoVO); // 예약 정보 수정
	int delete(int reservationNo); // 예약 정보 삭제
	// 예약 정보 페이징 처리
	List<ReservationInfoVO> selectListByPagination(Pagination pagination);
	int selectTotalCount();
	
	
} // end ReservationInfoMapper
