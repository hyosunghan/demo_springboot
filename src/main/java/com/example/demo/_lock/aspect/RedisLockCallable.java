package com.example.demo._lock.aspect;

import com.example.demo._lock.model.LockInfo;
import com.example.demo.utils.RedisHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.concurrent.Callable;

@Slf4j
public class RedisLockCallable implements Callable<Boolean> {

    private RedisTemplate redisTemplate;

    private LockInfo lockInfo;

    private Boolean run = true;

    public void shutdown() {
        this.run = false;
    }

    public RedisLockCallable(RedisTemplate redisTemplate, LockInfo lockInfo) {
        this.redisTemplate = redisTemplate;
        this.lockInfo = lockInfo;
    }

    @Override
    public Boolean call() throws Exception {
        int i = 0;
        int sleep = 1000/lockInfo.getFrequency();
        do {
            try {
                i++;
                log.debug("第{}次尝试获取{}事务锁！！", i, lockInfo.getLockName());
                Boolean result = RedisHelper.setNX(redisTemplate, lockInfo.getLockName(),
                        lockInfo.getLockValue(), lockInfo.getLeaseTime());
                // 拿到锁了
                if (result) {
                    return true;
                }
                Thread.sleep(sleep);
            } catch (Exception e) {
                log.error("获取锁出现异常：", e);
            }
                // 在主线程意外死亡没有终止子线程时，子线程延迟一秒结束。
        } while ((i < (lockInfo.getWaitTime() + 1) * lockInfo.getFrequency()) && run);
        return false;
    }

}