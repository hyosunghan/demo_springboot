package com.example.demo._sync.vo;

import java.util.concurrent.Delayed;
import java.util.concurrent.TimeUnit;

/**
 * @author hyosunghan
 * @since 2020-02-07
 */
public class ItemVo<T> implements Delayed {

    private long activeTime;// 到期时间，毫秒

    private T date;

    public ItemVo(long activeTime, T date) {
        this.activeTime = TimeUnit.NANOSECONDS.convert(activeTime, TimeUnit.MILLISECONDS) + System.nanoTime();
        this.date = date;
    }

    public long getActiveTime() {
        return activeTime;
    }

    public T getDate() {
        return date;
    }

    /**
     * 获取剩余时间
     *
     * @param unit
     * @return
     */
    @Override
    public long getDelay(TimeUnit unit) {
        return unit.convert(this.activeTime - System.nanoTime(), TimeUnit.NANOSECONDS);
    }

    /**
     * 按照剩余时间排序
     * @param o
     * @return
     */
    @Override
    public int compareTo(Delayed o) {
        long d = getDelay(TimeUnit.NANOSECONDS) - o.getDelay(TimeUnit.NANOSECONDS);
        return d == 0 ? 0 : (d > 0 ? 1 : -1);
    }
}
