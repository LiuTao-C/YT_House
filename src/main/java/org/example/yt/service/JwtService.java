package org.example.yt.service;


import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import jakarta.inject.Singleton;

import java.util.Date;

@Singleton
public class JwtService {
    
    public String generateToken(String username){
      //设置token过期时间
        long currentTimeMillis = System.currentTimeMillis();
        Date expiresAt = new Date(currentTimeMillis + 3600*1000);   //1 hour later
        
        //hash 256 和秘钥生成token
        String token  = JWT.create()
                .withIssuer("my_issuer")    //签发者
                .withSubject(username)      //主题是 用户名
                .withExpiresAt(expiresAt)   //过期时间
                .sign(Algorithm.HMAC256("fishbull")); //HMAC为签名加密的方法，秘钥是 fishbull
        return "Bearer" + token; //添加bearer 前缀 ，符合jwt规范
    }

}
