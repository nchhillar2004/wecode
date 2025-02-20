package com.github.nchhillar2004.wecode.core.controller;

import java.util.List;

import com.github.nchhillar2004.wecode.core.service.Questions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.nchhillar2004.wecode.core.model.Question;

@RestController
@CrossOrigin(origins = "http://localhost:5173")
public class ChallengesController{
    @Autowired
    public Questions questions;

    @GetMapping("getAllQuestions")
    public List<Question> getAllQuestions(){
        List<Question> ques = questions.getQuestions();
        return ques;
    } 
}
