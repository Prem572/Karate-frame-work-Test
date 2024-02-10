package com.org.karate.java;

import java.util.stream.Collectors;

import com.intuit.karate.*;
import com.intuit.karate.junit5.Karate.Test;

public class KarateParalellRunner {

    @Test
    public void runKarateTests(){
        Results results = Runner.path("classpath:../features"). parallel(3);
        results.getScenarioResults().filter(s -> s.isFailed()).collect(Collectors.toList());
    }
    
}
