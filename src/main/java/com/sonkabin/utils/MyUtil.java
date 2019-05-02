package com.sonkabin.utils;

import com.sonkabin.entity.Employee;
import org.apache.shiro.SecurityUtils;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MyUtil {
    public static Employee getSessionEmployee (String attributeName) {
        return (Employee) SecurityUtils.getSubject().getSession().getAttribute(attributeName);
    }

    /*
    获取技能等级所对应的能力
     */
    public static Integer getAbility (String index) {
        return map.get(index);
    }

    static Map<String, Integer> map = new HashMap<>(16);

    /*
    1-1         2-2       3-3
    4-4         5-6       6-9
    7-14        8-19      9-24
    */
    static {
        map.put("1" , 1);
        map.put("2" , 2);
        map.put("3" , 3);
        map.put("4" , 4);
        map.put("5" , 6);
        map.put("6" , 9);
        map.put("7" , 14);
        map.put("8" , 19);
        map.put("9" , 24);
    }

    static final String pattern = "([6-9])";

    public static int score (String skill, int portion) {
        Pattern r = Pattern.compile(pattern);
        int score = 0;
        Matcher m = r.matcher(skill);
        while (m.find()) {
            // 能力等级对应的效能*工作时间比例
            score += getAbility(m.group(1)) * portion;
        }
        return score;
    }
}
