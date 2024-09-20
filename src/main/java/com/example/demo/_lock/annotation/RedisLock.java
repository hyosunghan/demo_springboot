package com.example.demo._lock.annotation;

import com.example.demo._lock.model.LockType;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.METHOD})
public @interface RedisLock {

    /**
     * 锁的前缀名称，完整锁的唯一key值需要跟 keys 拼接。
     * @return
     */
    String name() default "lock";

    /**
     * 锁的值
     * @return
     */
    String value() default "0";

    /**
     * 尝试加锁，最多等待时间
     * @return
     */
    int waitTime() default 3;

    /**
     * 上锁以后，默认20秒后自动解锁
     * @return
     */
    int leaseTime() default 20;

    /**
     * 每秒尝试次数
     * @return
     */
    int frequency() default 4;

    /**
     * 锁类型
     * @return
     */
    LockType type() default LockType.WAIT;

    /**
     * 自定义业务key，spring EL 表达式形式，获取方法参数对应的值
     * 例子：
     * @RedisLock(name = "test:lock", keys = {"#id", "#name"})
     * public void test(Long id, String name) {}
     *
     * 锁的key为 test:lock:{id}:{name}
     * 锁的value为 0, 默认的。
     * @return
     */
    String[] keys();

}
