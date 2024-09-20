package com.example.demo._lock.service.impl;

import com.example.demo._lock.service.Lock;
import com.example.demo._lock.model.LockInfo;
import com.example.demo.utils.RedisHelper;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class ExecLock implements Lock {

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Override
    @SuppressWarnings("all")
    public Object proceed(ProceedingJoinPoint point, LockInfo lockInfo) throws Throwable  {
        Boolean flag = RedisHelper.setNX(stringRedisTemplate, lockInfo.getLockName(), lockInfo.getLockValue(),
                lockInfo.getLeaseTime());
        log.debug("尝试获取 {} 事务锁的结果为：{}", lockInfo.getLockName(), flag);
        if (!flag) {
            // 没有获取到事物锁的情况，给值自增
            Long l = RedisHelper.increment(stringRedisTemplate, lockInfo.getLockName());
            log.debug("未获取 {} 事务锁，自增结果为：{}", lockInfo.getLockName(), l);
            throw new RuntimeException("获取锁失败");
        }
        try {
            // 处理业务
            return point.proceed();
        } finally {
            // 业务处理完成，删除业务key
            String v = RedisHelper.get(stringRedisTemplate, lockInfo.getLockName());
            log.debug("{} 事务锁处理完成，处理过程中被拦截 {} 次！", lockInfo.getLockName(), v);
            RedisHelper.expire(stringRedisTemplate, lockInfo.getLockName());
        }
    }

}
