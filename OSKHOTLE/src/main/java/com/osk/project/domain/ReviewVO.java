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
	private String reviewLodgingType;
	private int reviewLodgingNo;
	private String reviewUserId;
	private String reviewReservationNo;
	private String reviewTitle;
	private int reviewScore;
	private String reviewContent;
	private Date reviewDate;

}
