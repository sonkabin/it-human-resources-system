package com.sonkabin.utils;

import com.sonkabin.entity.Message;

import java.time.LocalDateTime;

/**
 * 消息工具，定义某种格式的消息
 */
public class MessageUtil {

    /*
    离职消息内容：
    sample：您的项目[IT人力资源管理系统]中成员[赵六]离职，请尽快进行人员配置，保证项目按时交付，谢谢！
     */
    public static String NotInserviceMessage(String empName, String projectName) {
        StringBuffer sb = new StringBuffer("您的项目[");
        sb.append(projectName);
        sb.append("]中成员[");
        sb.append(empName);
        sb.append("]离职，请尽快进行人员配置，保证项目按时交付，谢谢！");
        return sb.toString();
    }

    /**
     *
     * @param flag: 0表示缺少前端，1表示缺少后端，2表示两者都缺
     * @param num: 表示缺少的前端人员数量
     * @param num2: 表示缺少的后端人员数量
     * @return
     */
    public static Message employeeNotEnoughMessage(int flag, int num, int num2) {
        Message message = new Message();
        LocalDateTime now = LocalDateTime.now();
        message.setStatus(0);
        message.setSender("系统");
        message.setGmtCreate(now);
        message.setGmtModified(now);
        if (flag == 0) {
            message.setContent("缺少工作经验1-2年的前端工程师" + num + "名");
        } else if (flag == 1) {
            message.setContent("缺少工作经验1-2年的后端工程师" + num2 + "名");
        } else {
            message.setContent("缺少工作经验1-2年的前端工程师" + num + "名, " + "缺少工作经验1-2年的后端工程师" + num2 + "名");
        }
        // 接下来两行写死了，因为不想再多浪费时间了
        message.setReceiverId(1);
        message.setReceiverName("sonkabin");
        return message;
    }
}
