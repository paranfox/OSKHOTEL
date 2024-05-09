package com.osk.project.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class RoomInfoVO {
	private int roomNo;
	private int roomHotelNo;
	private MultipartFile roomImg;
	private String roomName;
	private int roomCapacity;
	private String[] roomServiceList;
	private String roomDiscount;
	private int roomPrice;
	
	
	public String getroomServiceListJoin() {
		   String result = (roomServiceList == null) ? "없음" : String.join(",", roomServiceList);
		   return result;
	}

	
}

