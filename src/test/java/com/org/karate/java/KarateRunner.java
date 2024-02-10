package com.org.karate.java;

import  com.intuit.karate.junit5.Karate;


public class KarateRunner {
    @Karate.Test
    public Karate runGetRequests(){
        return Karate.run("classpath:com/org/karate/features/getRequestAdvance.feature")
        .tags("@CallFeature");
    }


    @Karate.Test
    public Karate executeDelete(){
        return Karate.run("classpath:com/org/karate/features/deleteRequest.feature")
        .tags("@DeleteData");
    }

@Karate.Test
public Karate executeDeleteloop(){
    return Karate.run("classpath:com/org/karate/features/deleteRequestsInloop.feature")
    .tags("@DeleteAll");
}
}