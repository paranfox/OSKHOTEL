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
public class HotelInfoVO {
	private int hotelNo; // HOTEL_NO
	private String lodgingType; // LODGING_TYPE
	private String hotelName; // HOTEL_NAME
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date hotelYear; // HOTEL_YEAR
	private String hotelAddress; // HOTEL_ADDRESS
	private String hotelAddressDetail; // HOTEL_ADDRESS_DETAIL
	private int hotelLatitude; // HOTEL_LATITUDE
	private int hotelLongitude; // HOTEL_LONGITUDE
	
} // end HotelInfoVO