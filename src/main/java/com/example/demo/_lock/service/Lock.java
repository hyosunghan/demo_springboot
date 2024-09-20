package com.example.demo._lock.service;

import com.example.demo._lock.model.LockInfo;
import org.aspectj.lang.ProceedingJoinPoint;

public interface Lock {

    Object proceed(ProceedingJoinPoint point, LockInfo lockInfo) throws Throwable ;

}
