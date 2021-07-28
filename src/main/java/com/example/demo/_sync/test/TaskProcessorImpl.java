package com.example.demo._sync.test;

import com.example.demo._sync.vo.ITaskProcessor;
import com.example.demo._sync.vo.TaskResult;
import com.example.demo._sync.vo.TaskResultType;

import java.util.Random;

/**
 * @author hyosunghan
 * @since 2020-02-07
 */
public class TaskProcessorImpl implements ITaskProcessor<Integer, Integer> {

    @Override
    public TaskResult<Integer> taskExecute(Integer data) {
        Random random = new Random();
        int i = random.nextInt(100);

        try {
            Thread.sleep(i);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        if (i <= 80) {
            return new TaskResult<Integer>(TaskResultType.Success, data + i);
        } else if (80 < i && i <= 90) {
            return new TaskResult<Integer>(TaskResultType.Failure, -1, "failure");
        } else {
            try {
                throw new RuntimeException("exception");
            } catch (RuntimeException e) {
                return new TaskResult<Integer>(TaskResultType.Exception, -1, e.getLocalizedMessage());
            }
        }
    }
}
