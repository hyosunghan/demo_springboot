package com.example.demo.dto;

import lombok.Data;

@Data
public class Result<T> {
    private int code;
    private String message;
    private T data;

    public Result() {
    }

    public Result(int code, String message, T data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public static <T> Result<T> success(T data) {
        return new Result<>(200, "success.message", data);
    }

    public static <T> Result<T> failure(int code, String message) {
        return new Result<>(code, message, null);
    }

}