package com.sonkabin;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class MyTest {
    @Test
    public void test1 () {
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        int size = list.size();
        int[] a = {1,2};
        Iterator<Integer> iterator = list.iterator();
        while (iterator.hasNext()) {

        }
    }

    // substring Test
    @Test
    public void test2 () {
        String s = "zs;ls";
        StringBuilder builder = new StringBuilder(s.substring(0, 0));
        System.out.println(builder);
    }
}
