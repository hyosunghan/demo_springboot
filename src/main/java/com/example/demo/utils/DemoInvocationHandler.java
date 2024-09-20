package com.example.demo.utils;

import com.example.demo.service.TestService;
import com.example.demo.service.TestServiceImpl;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class DemoInvocationHandler implements InvocationHandler {

    private Object target;

    public DemoInvocationHandler(Object target) {
        this.target = target;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        Object result = method.invoke(target, args);
        return result;
    }

    public static void main(String[] args) {
        TestService testService = new TestServiceImpl();

        TestService proxyInstance = (TestService) Proxy.newProxyInstance(
                testService.getClass().getClassLoader(),
                testService.getClass().getInterfaces(),
                new DemoInvocationHandler(testService)
        );

        proxyInstance.testProxy();
    }
}
