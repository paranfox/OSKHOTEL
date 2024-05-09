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
public class HotelInfoVO {
	private int hotelNo; // HOTEL_NO
	private String hotelName; // HOTEL_NAME
	private Date hotelYear; // HOTEL_YEAR
	private int hotelRoomNo; // HOTEL_ROOM_NO
	private String hotelDetail; // HOTEL_DETAIL
	private String hotelAddress; // HOTEL_ADDRESS
	private int hotelLatitude; // HOTEL_LATITUDE
	private int hotelLongitude; // HOTEL_LONGITUDE
	private int hotelScoreAvg; // HOTEL_SCOREAVG
	private String lodging; // LODGING
	
} // end HotelInfoVO