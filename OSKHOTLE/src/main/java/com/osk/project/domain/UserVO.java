package com.osk.project.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class UserVO {
	private String userId;
	private String userPassword;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String userMembership;
}
