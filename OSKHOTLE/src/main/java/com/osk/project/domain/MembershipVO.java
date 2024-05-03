package com.osk.project.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class MembershipVO {
	private int membershipId; // MEMBERSHIP_ID
	private int membershipName; // MEMBERSHIP_NAME
	private int membershipDiscount; // MEMBERSHIP_DISCOUNT
	
} // MembershipVO
