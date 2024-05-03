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
public class ReservedRoomVO {
	private int reservedRoomNo;
	private Date reservedCheckIn;
	private Date reservedCheckOut;
	
} // end ReservedRoomVO
