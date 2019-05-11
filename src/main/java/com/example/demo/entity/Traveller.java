package com.example.demo.entity;

import org.springframework.stereotype.Component;

@Component
public class Traveller {

    private int id;
    private String name;
    private String sex;
    private String phoneNum;
    private String credentialsType;
    private String credentialsNum;
    private String travellerType;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getCredentialsType() {
        return credentialsType;
    }

    public void setCredentialsType(String credentialsType) {
        this.credentialsType = credentialsType;
    }

    public String getCredentialsNum() {
        return credentialsNum;
    }

    public void setCredentialsNum(String credentialsNum) {
        this.credentialsNum = credentialsNum;
    }

    public String getTravellerType() {
        return travellerType;
    }

    public void setTravellerType(String travellerType) {
        this.travellerType = travellerType;
    }
}
