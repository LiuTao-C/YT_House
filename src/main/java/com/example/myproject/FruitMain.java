package com.example.myproject;

import javax.inject.Inject;

import io.quarkus.runtime.QuarkusApplication;
import io.quarkus.runtime.annotations.QuarkusMain;
import io.quarkus.runtime.Quarkus;

@QuarkusMain
public class FruitMain implements QuarkusApplication {

    @Inject
    FruitResource resource;

    @Override
    public int run(String... args) {
        System.out.println("======== quarkus is running! ========");
        Quarkus.waitForExit();
        return 0;
    }


    public static void main(String... args) {
        Quarkus.run(FruitMain.class, args);
    }


}