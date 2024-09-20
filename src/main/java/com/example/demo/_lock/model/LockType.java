package com.example.demo._lock.model;

public enum LockType {

    /**
     * 尝试等待锁，在规定时间内，尝试获取锁，
     * 如果获取到了，可以执行后续业务；未获取到锁，抛出异常信息
     */
    WAIT,

    /**
     * 执行锁，得到锁的线程可以直接执行，未得到锁的线程抛出异常信息
     */
    EXEC,

}
