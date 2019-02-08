package com.sonkabin;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ItHumanResourcesApplicationTests {

    @Autowired
    SqlSessionFactory sqlSessionFactory;

    @Test
    public void contextLoads() {
        SqlSession bacthSqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH);
        System.out.println(bacthSqlSession);
    }

}

