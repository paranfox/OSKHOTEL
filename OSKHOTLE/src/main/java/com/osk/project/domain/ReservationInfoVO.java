package com.osk.project.domain;

import java.util.Date;

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
	private Date reservationCheckIn;
	private Date reservationCheckOut;
	private int reservationTotalPrice;
	
} // end ReservationInfoVO
