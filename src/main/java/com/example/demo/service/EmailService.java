package com.example.demo.service;

import com.example.demo.config.EmailServer;
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

    public static ArrayList<HashMap> staticMail = new ArrayList<>();
//    public static ArrayList<HashMap> staticUnreadMail = new ArrayList<>();

    @Async("taskExecutor")
    public void pullMail() throws Exception{
        log.info("开始拉取邮件");
        ArrayList<HashMap> mail = EmailServer.pullMail("all");
        Collections.reverse(mail);
        staticMail = mail;
//        staticUnreadMail = (ArrayList<HashMap>)mail.parallelStream().filter(i -> i.get("status").equals("unread")).collect(Collectors.toList());
        log.info("完成邮件拉取");
    }

    public HashMap getMail(Integer id) throws Exception{
        return EmailServer.getMail(id);
    }
}
