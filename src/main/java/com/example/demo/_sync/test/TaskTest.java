package com.example.demo._sync.test;

import com.example.demo._sync.PendingJobPool;
import com.example.demo._sync.vo.TaskResult;

import java.util.List;

/**
 * @author hyosunghan
 * @since 2020-02-07
 */
public class TaskTest {

    private static final String JOB_NAME = "random";

    private static final int JOB_LENGTH = 100;

    private static class QueryTest implements Runnable {
        private PendingJobPool pendingJobPool;

        public QueryTest(PendingJobPool pendingJobPool) {
            this.pendingJobPool = pendingJobPool;
        }

        @Override
        public void run() {
            for (int i = 0; i < 15; i++) {
                System.out.print((i + 1) + "-st：");
                List<TaskResult<String>> taskDetail = pendingJobPool.getTaskDetail(JOB_NAME);
                if (taskDetail == null) {
                    System.out.println("Job [" + JOB_NAME + "] is invalid");
                } else if (!taskDetail.isEmpty()) {
                    System.out.println(pendingJobPool.getTaskPercent(JOB_NAME) + ": " + taskDetail.toString());
                } else {
                    System.out.println();
                }
                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static void main(String[] args) {
        // 业务逻辑
        TaskProcesserImpl taskProcesser = new TaskProcesserImpl();
        // 执行器
        PendingJobPool instance = PendingJobPool.getInstance();
        // 注册任务，完成后结果保留200毫秒
        instance.registerJob(JOB_NAME, JOB_LENGTH, taskProcesser, 200);
        for (int i = 0; i < JOB_LENGTH; i++) {
            instance.putJob(JOB_NAME, 100);
        }

        // 查询结果
        new Thread(new QueryTest(instance)).start();

    }
}
