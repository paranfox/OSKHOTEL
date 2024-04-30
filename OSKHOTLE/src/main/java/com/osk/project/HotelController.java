package com.osk.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class HotelController {

   // JSP 페이지 전송
   @GetMapping("/index")
   public String returnJSP() {
      log.info("returnJSP()");
      return "../hotel/index"; // jsp 호출
   }
}
