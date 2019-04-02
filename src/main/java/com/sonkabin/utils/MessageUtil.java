package com.sonkabin.utils;

/**
 * 消息工具，定义某种格式的消息
 */
public class MessageUtil {

    /*
    离职消息：
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
}
