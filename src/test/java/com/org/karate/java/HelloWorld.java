package com.org.karate.java;
import org.apache.commons.lang3.RandomStringUtils;

import com.google.gson.JsonObject;

public class HelloWorld {

    public static String helloWorldMethod(){
        return "Hello Karate";
    }
    
    public static JsonObject generateJson(){
        JsonObject object = new JsonObject();
        object.addProperty("Name", "Prem");
        System.out.println("Object Printed is "+object.get("Name"));
        return object;
    }

    public static int randomNumberGenerator(){
        return Integer.parseInt(RandomStringUtils.randomNumeric(3));
    }
}
