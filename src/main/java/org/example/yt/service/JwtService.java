package org.example.yt.service;


import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import jakarta.inject.Singleton;
import org.jboss.logmanager.handlers.ConsoleHandler;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.logging.Logger;

@Singleton
public class JwtService {
    private static final Logger logger = Logger.getLogger(JwtService.class.getName());
  
    
    public String generateToken(String id){
      //设置token过期时间
        LocalDateTime localDateTime = LocalDateTime.now().plusHours(1);
        
        logger.info("localtime + one hour = "+localDateTime);
        String date = localDateTime.toString();
        
        String token = id + "@" +date;
        System.out.println("token,"+token);
        return token;
    }

}
