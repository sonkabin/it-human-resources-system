package com.sonkabin.utils;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

public class MD5Util {
    // MD5加密算法
    public static String calculatePwd(String password, String id) {
        String hashAlgorithmName = "MD5";
        int hashIterations = 1024;
        ByteSource salt = ByteSource.Util.bytes(id);
        SimpleHash simpleHash  = new SimpleHash(hashAlgorithmName, password, salt, hashIterations);
        return simpleHash.toString();
    }
}
