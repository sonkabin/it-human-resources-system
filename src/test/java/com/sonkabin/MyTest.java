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
}
