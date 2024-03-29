package com.example.demo._sync.vo;

import com.example.demo._sync.CheckJobProcessor;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author hyosunghan
 * @since 2020-02-06
 */
public class JobInfo<R> {

    private final String jobName;
    private final int jobLength;
    private final ITaskProcessor<?, ?> taskProcessor;
    private final AtomicInteger successCount;
    private final AtomicInteger taskProcessorCount;
    private final LinkedBlockingDeque<TaskResult<R>> taskDetailDeque;
    private final long expireTime;

    public JobInfo(String jobName, int jobLength, ITaskProcessor<?, ?> taskProcessor, long expireTime) {
        this.jobName = jobName;
        this.jobLength = jobLength;
        this.taskProcessor = taskProcessor;
        this.successCount = new AtomicInteger(0);
        this.taskProcessorCount = new AtomicInteger(0);
        this.taskDetailDeque = new LinkedBlockingDeque<TaskResult<R>>(jobLength);
        this.expireTime = expireTime;
    }

    public int getJobLength() {
        return jobLength;
    }

    public int getSuccessCount() {
        return successCount.get();
    }

    public int getTaskProcessorCount() {
        return taskProcessorCount.get();
    }

    public ITaskProcessor<?, ?> getTaskProcessor() {
        return taskProcessor;
    }

    /**
     * 查询任务结果
     *
     * @return
     */
    public List<TaskResult<R>> getTaskDetail() {
        LinkedList<TaskResult<R>> taskList = new LinkedList<>();

//        // 结果只可查询一次
//        taskDetailDeque.drainTo(taskList);
//        // 结果只可查询一次
//        TaskResult<R> taskResult;
//        while ((taskResult = taskDetailDeque.pollFirst()) != null) {
//            taskList.add(taskResult);
//        }
        // 结果一直保留至过期
        Iterator<TaskResult<R>> iterator = taskDetailDeque.iterator();
        while (iterator.hasNext()) {
            taskList.add(iterator.next());
        }

        return taskList;
    }

    /**
     * 添加任务结果
     * 保证最终一致性即可，不用方法加锁
     *
     * @param taskResult
     */
    public void addTaskResult(TaskResult<R> taskResult, CheckJobProcessor checkJobProcessor) {
        taskDetailDeque.addLast(taskResult);
        taskProcessorCount.incrementAndGet();

        if (TaskResultType.Success.equals(taskResult.getTaskResultType())) {
            successCount.incrementAndGet();
        }

        // 当前任务执行完毕，置入延时过期
        if (taskProcessorCount.get() == jobLength) {
            System.out.println("system: Job [" + jobName + "] is done");
            checkJobProcessor.putJob(jobName, expireTime);
        }
    }
}
