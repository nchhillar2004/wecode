package com.github.nchhillar2004.wecode.core.model;

import lombok.Data;

@Data
public class Question{
    private String title;
    private int number;

    public Question(String title, int number){
        this.title = title;
        this.number = number;
    }
}
