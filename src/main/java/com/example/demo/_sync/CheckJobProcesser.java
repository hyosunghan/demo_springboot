package com.example.demo._sync;

import com.example.demo._sync.vo.ItemVo;

import java.util.concurrent.DelayQueue;

/**
 * @author hyosunghan
 * @since 2020-02-06
 */
public class CheckJobProcesser {

    // 已完成的任务结果等待过期
    private static DelayQueue<ItemVo<String>> queue = new DelayQueue<ItemVo<String>>();

    static {
        Thread thread = new Thread(new FetchJob());
        thread.setDaemon(true);// 设置为守护线程
        thread.start();
    }

    private CheckJobProcesser() {
    }

    private static class JobProcesserHolder {
        public static CheckJobProcesser processer = new CheckJobProcesser();
    }

    /**
     * 获取单例对象
     *
     * @return
     */
    public static CheckJobProcesser getInstance() {
        return JobProcesserHolder.processer;
    }

    private static class FetchJob implements Runnable {
        @Override
        public void run() {
            while (true) {
                try {
                    ItemVo<String> item = queue.take();
                    String jobName = item.getDate();
                    PendingJobPool.getMap().remove(jobName);
                    System.out.println("Job [" + jobName + "] is out of date, remove from map");
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * 加入延时过期队列
     *
     * @param jobName
     * @param expireTime
     */
    public void putJob(String jobName, long expireTime) {
        ItemVo<String> itemVo = new ItemVo<>(expireTime, jobName);
        queue.offer(itemVo);
    }
}
