package com.example.demo.service;

import com.example.demo._lock.annotation.RedisLock;
import com.example.demo._lock.model.LockType;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class TestServiceImpl implements TestService {

    @Override
    public void testProxy() {
        log.info("代理测试");
    }

    @Override
    @RedisLock(name = "wait", keys = {"#id"}, type = LockType.WAIT)
    public void testWaitLock(Long id) {
        try {
            log.info("等待逻辑开始");
            Thread.sleep(1000);
            log.info("等待逻辑完成");
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    @RedisLock(name = "exec", keys = {"#id"}, type = LockType.EXEC)
    public void testExecLock(Long id) {
        try {
            log.info("执行逻辑开始");
            Thread.sleep(1000);
            log.info("执行逻辑完成");
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }
}
