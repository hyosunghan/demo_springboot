package com.example.demo.task;

import com.example.demo.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * =========================================================
 *  * cron表达式包括6部分：
 *  * 秒（0~59） 分钟（0~59） 小时（0~23） 月中的天（1~31） 月（1~12） 周中的天
 *  * （填写MON，TUE，WED，THU，FRI，SAT,SUN，或数字1~7 1表示MON，依次类推）
 *  * 特殊字符介绍：
 *  * “/”字符表示指定数值的增量
 *  * “*”字符表示所有可能的值
 *  * “-”字符表示区间范围
 *  * "," 字符表示列举
 *  * “？”字符仅被用于月中的天和周中的天两个子表达式，表示不指定值
 *  *
 *  * =================================================例子：
 *  * 0/3 * * * * * 每隔3秒执行
 *  * 0 0/5 * * * * 每隔5分钟执行
 *  * 0 0 0 * * * 表示每天0点执行
 *  * 0 0 12 ? * WEN 每周三12点执行
 *  * 0 15 10 ? * MON-FRI 每月的周一到周五10点 15分执行
 *  * 0 15 10 ? * MON,FRI 每月的周一和周五10点 15分执行
 *
 * @author hyosunghan
 * @since 2019-10-18
 */
@Component
public class SchedulingTask {
    @Autowired
    EmailService emailService;

    /**
     * 每一小时拉取一次邮件
     */
    @Scheduled(cron = "0 0 0/1 * * *")
    public void pullMail() throws Exception{
        emailService.pullMail();
    }
}
