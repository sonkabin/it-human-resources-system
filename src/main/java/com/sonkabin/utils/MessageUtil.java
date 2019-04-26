package com.sonkabin.utils;

import com.sonkabin.entity.Message;

import java.time.LocalDateTime;
import java.util.LinkedList;
import java.util.List;

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
     * HumanConfigServiceImpl.java文件中使用
     * @param flag: 0表示缺少前端，1表示缺少后端，2表示两者都缺
     * @param num: 表示缺少的前端人员数量
     * @param num2: 表示缺少的后端人员数量
     * @return
     */
    public static List<Message> employeeNotEnoughMessage(int flag, int num, int num2) {
        List<Message> messages = new LinkedList<>();
        Message message = new Message();
        LocalDateTime now = LocalDateTime.now();
        message.setStatus(0);
        message.setSender("系统");
        message.setGmtCreate(now);
        message.setGmtModified(now);
        message.setReceiverName("HR");
        if (flag == 0) {
            message.setContent("缺少工作经验1-2年的前端工程师" + num + "名");
            messages.add(message);
        } else if (flag == 1) {
            message.setContent("缺少工作经验1-2年的后端工程师" + num2 + "名");
            messages.add(message);
        } else {
            message.setContent("缺少工作经验1-2年的前端工程师" + num + "名");
            Message msg2 = new Message(message);
            msg2.setContent("缺少工作经验1-2年的后端工程师" + num2 + "名");
            messages.add(message);
            messages.add(msg2);
        }
        return messages;
    }
}
