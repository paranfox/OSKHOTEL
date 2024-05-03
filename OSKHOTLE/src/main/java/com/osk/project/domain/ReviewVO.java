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
public class ReviewVO {
	private int reviewNo;
	private String reviewConfirm;
	private String reviewName;
	private int reviewScore;
	private String reviewContent;
	private String reviewReservationNo;
	private Date reviewDate;
	
	
}
