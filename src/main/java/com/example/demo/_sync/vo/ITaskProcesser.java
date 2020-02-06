package com.example.demo._sync.vo;

/**
 * @author hyosunghan
 * @since 2020-02-06
 */
public interface ITaskProcesser<T, R> {

    /**
     *  实际业务逻辑
     *
     * @param data
     * @return
     */
    TaskResult<R> taskExecute(T data);
}
