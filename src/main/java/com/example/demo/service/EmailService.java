package com.example.demo.service;

import com.example.demo.config.EmailServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.logging.Logger;

/**
 * @author hyosunghan
 * @since 2019-10-25
 */
@Service
public class EmailService {

    private Logger log = Logger.getLogger("EmailService");
    @Autowired
    private static EmailServer emailServer;

    public static ArrayList<HashMap> staticMail = new ArrayList<>();

    @Async("taskExecutor")
    public void pullMail() throws Exception{
        log.info("开始拉取邮件");
        ArrayList<HashMap> mail = emailServer.pullMail("all");
        Collections.reverse(mail);
        staticMail = mail;
        log.info("完成邮件拉取");
    }
}
