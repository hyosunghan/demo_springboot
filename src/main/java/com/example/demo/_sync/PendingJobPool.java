package com.example.demo._sync;

import com.example.demo._sync.vo.ITaskProcessor;
import com.example.demo._sync.vo.JobInfo;
import com.example.demo._sync.vo.TaskResult;
import com.example.demo._sync.vo.TaskResultType;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @author hyosunghan
 * @since 2020-02-06
 */
public class PendingJobPool {

    // 单次提交任务数量限制5000，超过限制缺省抛出异常
    private static BlockingQueue<Runnable> taskQueue = new ArrayBlockingQueue<>(5000);
    // 任务异步执行并行数量限制为CPU核数
    private static final int THREAD_COUNTS = Runtime.getRuntime().availableProcessors();
    // 任务执行器，固定大小为CPU核数，保活时间60秒
    private static final ExecutorService taskExecutor = new ThreadPoolExecutor(THREAD_COUNTS, THREAD_COUNTS,
            60, TimeUnit.SECONDS, taskQueue);
    // 任务存放容器
    private static final ConcurrentHashMap<String, JobInfo<?>> jobInfoMap = new ConcurrentHashMap<>();
    // 检查完成
    private static CheckJobProcessor checkJobProcessor = CheckJobProcessor.getInstance();

    private PendingJobPool() {
    }

    private static class JobPoolHolder {
        public static PendingJobPool pool = new PendingJobPool();
    }

    /**
     * 获取单例对象
     *
     * @return
     */
    public static PendingJobPool getInstance() {
        return JobPoolHolder.pool;
    }

    /**
     * 获取任务列表
     *
     * @return
     */
    public static Map<String, JobInfo<?>> getMap() {
        return jobInfoMap;
    }

    // 对工作中的任务进行包装，提交给线程池进行执行，处理任务结果，放入缓存
    private static class PendingTask<T, R> implements Runnable {

        private JobInfo<R> jobInfo;
        private T processData;

        public PendingTask(JobInfo<R> jobInfo, T processData) {
            this.jobInfo = jobInfo;
            this.processData = processData;
        }

        @Override
        public void run() {
            R r = null;
            ITaskProcessor<T, R> taskProcessor = (ITaskProcessor<T, R>) jobInfo.getTaskProcessor();
            TaskResult<R> result = null;
            try {
                result = taskProcessor.taskExecute(processData);
                if (result == null) {
                    result = new TaskResult<R>(TaskResultType.Exception, r, "Job result is null");
                } else {
                    if (result.getTaskResultType() == null) {
                        result = new TaskResult<R>(TaskResultType.Exception, result.getReturnValue(), result.getReason());
                    }
                }
            } catch (Exception e) {
                result = new TaskResult<R>(TaskResultType.Exception, r, e.getLocalizedMessage());
            } finally {
                jobInfo.addTaskResult(result, checkJobProcessor);
            }
        }
    }

    /**
     * 注册任务
     *
     * @param jobName
     * @param jobLength
     * @param taskProcessor
     * @param expireTime
     * @param <R>
     */
    public <R> void registerJob(String jobName, int jobLength, ITaskProcessor<?, ?> taskProcessor, long expireTime) {
        JobInfo<R> jobInfo = new JobInfo<>(jobName, jobLength, taskProcessor, expireTime);
        if (jobInfoMap.putIfAbsent(jobName, jobInfo) != null) {
            throw new RuntimeException("Job [" + jobName + "] has been registered");
        }
    }

    /**
     * 获取任务
     *
     * @param jobName
     * @param <R>
     * @return
     */
    public <R> JobInfo<R> getJob(String jobName) {
        JobInfo<R> jobInfo = (JobInfo<R>) jobInfoMap.get(jobName);
//        if (jobInfo == null) {
//            throw new RuntimeException("Job [" + jobName + "] is invalid");
//        }
        return jobInfo;
    }

    /**
     * 执行任务
     *
     * @param jobName
     * @param t
     * @param <T>
     * @param <R>
     */
    public <T, R> void putJob(String jobName, T t) {
        JobInfo<R> jobInfo = getJob(jobName);

        PendingTask<T, R> pendingTask = new PendingTask<T, R>(jobInfo, t);
        taskExecutor.execute(pendingTask);
    }

    /**
     * 查询任务结果列表
     *
     * @param jobName
     * @param <R>
     * @return
     */
    public <R> List<TaskResult<R>> getTaskDetail(String jobName) {
        JobInfo<R> jobInfo = getJob(jobName);
        if (jobInfo == null) {
            return null;
        }
        return jobInfo.getTaskDetail();
    }

    /**
     * 查询任务总体进度
     *
     * @param jobName
     * @param <R>
     * @return
     */
    public <R> int[] getTaskPercent(String jobName) {
        JobInfo<R> jobInfo = getJob(jobName);
        if (jobInfo == null) {
            return null;
        }
        return new int[]{jobInfo.getJobLength(), jobInfo.getTaskProcessorCount(), jobInfo.getSuccessCount()};
    }
}
