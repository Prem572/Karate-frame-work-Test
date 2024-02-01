package com.org.karate.java;

import  com.intuit.karate.junit5.Karate;


public class KarateRunner {
    @Karate.Test
    public Karate runGetRequests(){
        return Karate.run("classpath:com/org/karate/features/getRequest.feature")
                .tags("@Test1");
    }
}
