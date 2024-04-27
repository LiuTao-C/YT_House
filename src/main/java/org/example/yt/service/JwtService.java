package org.example.yt.service;



import jakarta.inject.Singleton;
import org.jboss.logmanager.handlers.ConsoleHandler;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.logging.Logger;

@Singleton
public class JwtService {
    private static final Logger logger = Logger.getLogger(JwtService.class.getName());
  
    
    public String generateToken(String id){
      //设置token过期时间
        LocalDateTime localDateTime = LocalDateTime.now().plusHours(1);
        String formattime = localDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        logger.info("localtime + one hour = "+formattime);
//        String date = localDateTime.toString();
        
        String token = id + "@" +formattime;
        System.out.println("token,"+token);
        return token;
    }

}
