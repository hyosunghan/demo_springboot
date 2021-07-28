package com.example.demo._sync.test;

import com.alibaba.fastjson.JSON;
import com.example.demo._sync.PendingJobPool;
import com.example.demo._sync.vo.TaskResult;

import java.util.List;

/**
 * @author hyosunghan
 * @since 2020-02-07
 */
public class TaskTest {

    private static final String JOB_NAME = "RANDOM";

    private static final int JOB_LENGTH = 100;

    private static class QueryTest implements Runnable {
        private PendingJobPool pendingJobPool;

        public QueryTest(PendingJobPool pendingJobPool) {
            this.pendingJobPool = pendingJobPool;
        }

        @Override
        public void run() {
            for (int i = 0; i < 15; i++) {
                int[] taskPercent = pendingJobPool.getTaskPercent(JOB_NAME);
                List<TaskResult<String>> taskDetail = pendingJobPool.getTaskDetail(JOB_NAME);
                if (taskPercent == null || taskDetail == null) {
                    System.out.println("第" + (i + 1) + "次查询：任务[" + JOB_NAME + "]已过期");
                } else if (!taskDetail.isEmpty()) {
                    System.out.println("第" + (i + 1) + "次查询：任务[" + JOB_NAME + "]进度[总数" + taskPercent[0] + "完成" + taskPercent[1] + "成功" + taskPercent[2] + "]详情: " + JSON.toJSONString(taskDetail));
                } else {
                    System.out.println("第" + (i + 1) + "次查询：任务[" + JOB_NAME + "]暂无数据");
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
        TaskProcessorImpl taskProcessor = new TaskProcessorImpl();
        // 执行器
        PendingJobPool instance = PendingJobPool.getInstance();
        // 注册任务，完成后结果保留200毫秒
        instance.registerJob(JOB_NAME, JOB_LENGTH, taskProcessor, 200);
        for (int i = 0; i < JOB_LENGTH; i++) {
            instance.putJob(JOB_NAME, 100);
        }

        // 查询结果
        new Thread(new QueryTest(instance)).start();

    }
}
