package com.github.nchhillar2004.wecode.core.service;

import java.util.*;

import org.springframework.stereotype.Repository;

import com.github.nchhillar2004.wecode.core.model.Question;

@Repository
public class Questions{
    List<Question> questions = new ArrayList<>(Arrays.asList(
        new Question("Test Question 1", 1),
        new Question("Test Question 2", 2),
        new Question("Test Question 3", 3),
        new Question("Test Question 4", 4),
        new Question("Test Question 5", 5)
    ));

    public List<Question> getQuestions(){
        return questions;
    }
}
