package com.example.myproject.resource.util;

public class FileHelper {
    public  static  String getFileExtension(String fileName){
        int lastDotIndex  = fileName.lastIndexOf(".");
        if (lastDotIndex != -1 ){
            return fileName.substring(lastDotIndex+1).toLowerCase();
        }
        return null;
    }
}
