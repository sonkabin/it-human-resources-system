package com.sonkabin;

import org.junit.Test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PatternTest {

    @Test
    public void test1 () {
        // 按指定模式在字符串查找
        String line = "This order 0was 6placed6 7for Q8T3000! OK?";
        String pattern = "([6-9])";

        // 创建 Pattern 对象
        Pattern r = Pattern.compile(pattern);

        int count = 0;
        // 现在创建 matcher 对象
        Matcher m = r.matcher(line);
        while (m.find()) {
            System.out.println(m.group(1));
        }
    }
}
