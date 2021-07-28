package com.example.demo._sync;

import com.example.demo._sync.vo.ItemVo;

import java.util.concurrent.DelayQueue;

/**
 * @author hyosunghan
 * @since 2020-02-06
 */
public class CheckJobProcessor {

    // 已完成的任务结果等待过期
    private static DelayQueue<ItemVo<String>> queue = new DelayQueue<ItemVo<String>>();

    static {
        Thread thread = new Thread(new FetchJob());
        thread.setDaemon(true);// 设置为守护线程
        thread.start();
    }

    private CheckJobProcessor() {
    }

    private static class JobProcessorHolder {
        public static CheckJobProcessor processor = new CheckJobProcessor();
    }

    /**
     * 获取单例对象
     *
     * @return
     */
    public static CheckJobProcessor getInstance() {
        return JobProcessorHolder.processor;
    }

    private static class FetchJob implements Runnable {
        @Override
        public void run() {
            while (true) {
                try {
                    ItemVo<String> item = queue.take();
                    String jobName = item.getDate();
                    PendingJobPool.getMap().remove(jobName);
                    System.out.println("system: Job [" + jobName + "] is expire");
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
