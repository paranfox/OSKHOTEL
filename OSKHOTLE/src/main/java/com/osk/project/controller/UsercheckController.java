package com.osk.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.osk.project.service.UserService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/usercheck")
@Log4j
public class UsercheckController {

    @Autowired
    private UserService userService;

    @GetMapping("/useridCheck/{userId}") // POST 요청을 처리하는 메서드로 설정
    public ResponseEntity<Integer> useridCheck(@PathVariable("userId") String userId) {
    	System.out.println(userId);
        int result = userService.userIdCheck(userId);
        System.out.println(result);
        return new ResponseEntity<Integer>(result, HttpStatus.OK);
    }

}
