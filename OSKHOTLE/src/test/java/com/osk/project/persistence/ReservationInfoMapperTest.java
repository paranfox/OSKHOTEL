package com.osk.project.persistence;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.osk.project.config.RootConfig;
import com.osk.project.domain.ReservationInfoVO;
import com.osk.project.util.PageMaker;
import com.osk.project.util.Pagination;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class})
@Log4j
public class ReservationInfoMapperTest {
	
	@Autowired
	private ReservationInfoMapper reservationInfoMapper;
	
	@Test
	public void test() {
		testReservationInsert();
		testReservationList();
		testReservationListByDate();
		testReservationSelectOne();
		testReservationUpdate();
		testReservationDelete();
		testReservationListPagination();
		
	}

	private void testReservationInsert() {
		
	}

	private void testReservationList() {
//		List<ReservationInfoVO> list = reservationInfoMapper.selectList();
//		log.info(list);
	}

	private void testReservationListByDate() {
//		for(ReservationInfoVO reservationInfoVO : reservationInfoMapper.selectListByDate("2024-06-05", "2024-06-10")) {
//			log.info(reservationInfoVO);
//		}
	}

	private void testReservationSelectOne() {
		
	}

	private void testReservationUpdate() {
		
	}

	private void testReservationDelete() {
		
	}

	private void testReservationListPagination() {
		Pagination pagination = new Pagination(1, 5, "2024-06-05", "2024-06-10");
		List<ReservationInfoVO> list = reservationInfoMapper.selectListByPagination(pagination);
		for(ReservationInfoVO reservationInfoVO : list) {
			log.info(reservationInfoVO);
		}
	}
	
	
}
