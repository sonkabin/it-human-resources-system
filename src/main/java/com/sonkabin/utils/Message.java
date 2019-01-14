package com.sonkabin.utils;

import java.util.HashMap;
import java.util.Map;

public class Message {
    private Map<String,Object> info;
    private int code;
    private String msg;

    public static Message success(){
        return new Message(100,"success");
    }

    public static Message fail(){
        return new Message(200,"fail");
    }

    public Message put(String key,Object val){
        this.info.put(key,val);
        return this;
    }

    public Message(int code, String msg) {
        this.info = new HashMap<>();
        this.code = code;
        this.msg = msg;
    }

    public Map<String, Object> getInfo() {
        return info;
    }

    public void setInfo(Map<String, Object> info) {
        this.info = info;
    }
}
