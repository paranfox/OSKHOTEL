package com.osk.project.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class ReservationInfoVO {
	private int reservationNo;
	private String reservationLodgingType;
	private int reservationLodgingNo;
	private String reservationLodgingName;
	private int reservationRoomNo;
	private String reservationUserId;
	private String reservationFirstName;
	private String reservationLastName;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date reservationCheckIn;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date reservationCheckOut;
	private int reservationAdult;
	private int reservationChild;
	private int reservationTotalPrice;
	
} // end ReservationInfoVO
