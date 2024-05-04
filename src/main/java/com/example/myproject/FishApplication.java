package com.example.myproject;

import io.quarkus.runtime.QuarkusApplication;
import io.quarkus.runtime.annotations.QuarkusMain;
import io.quarkus.runtime.Quarkus;

@QuarkusMain
public class FishApplication implements QuarkusApplication {
    
    
    @Override
    public int run(String... args) {
        System.out.println("======== quarkus 正在运行! ========");
        Quarkus.waitForExit();
        return 0;
    }
    
    
    public static void main(String... args) {
        Quarkus.run(FishApplication.class, args);
    }
    
    
}