package com.github.nchhillar2004.wecode.core.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = {"http://localhost:8000"})
public class HomeController{

    @GetMapping("/")
    public HttpStatus home(){
        return HttpStatus.OK;
    }
}
