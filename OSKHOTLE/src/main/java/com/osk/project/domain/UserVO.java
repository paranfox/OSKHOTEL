package com.osk.project.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class UserVO {
   private String userId; // USER_ID
   private String userPassword; // USER_PASSWORD
   private String userName; // USER_NAME
   private String userEmail; // USER_EMAIL
   private String userPhone; // USER_PHONE
   private String userMembership; // USER_MEMBERSHIP
}
