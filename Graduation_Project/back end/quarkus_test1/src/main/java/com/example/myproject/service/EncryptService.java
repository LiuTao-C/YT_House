package com.example.myproject.service;

import com.example.myproject.config.Constant;
import jakarta.enterprise.context.ApplicationScoped;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.Random;

@ApplicationScoped
public class EncryptService {
    /**
     * 加密模式之 ECB，算法/模式/补码方式
     */
    private static final String AES_ECB = "AES/ECB/PKCS5Padding";
    
    /**
     * 加密模式之 CBC，算法/模式/补码方式
     */
    private static final String AES_CBC = "AES/CBC/PKCS5Padding";
    

    
    /**
     * AES 中的 IV 必须是 16 字节（128位）长
     */

    
    /***
     * <h2>空校验</h2>
     * @param str 需要判断的值
     */
    public static boolean isEmpty(Object str) {
        return null == str || "".equals(str);
    }
    
    /***
     * <h2>String 转 byte</h2>
     * @param str 需要转换的字符串
     */
    public static byte[] getBytes(String str) {
        if (isEmpty(str)) {
            return null;
        }
        
        try {
            return str.getBytes(StandardCharsets.UTF_8);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    

    
    /***
     * <h2>获取一个 AES 密钥规范</h2>
     */
    public static SecretKeySpec getSecretKeySpec(String key) {
        SecretKeySpec secretKeySpec = new SecretKeySpec(getBytes(key), "AES");
        return secretKeySpec;
    }
    
    
    /**
     * <h2>加密 - 模式 ECB</h2>
     *
     * @param text 需要加密的文本内容
     * @param key  加密的密钥 key
     */
    
    
    public static String encrypt(String text, String key) {
        if (isEmpty(text) || isEmpty(key)) {
            return null;
        }
        
        try {
            // 创建AES加密器
            Cipher cipher = Cipher.getInstance(AES_ECB);
            
            SecretKeySpec secretKeySpec = getSecretKeySpec(key);
            
            cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec);
            
            // 加密字节数组
            byte[] encryptedBytes = cipher.doFinal(getBytes(text));
            
            // 将密文转换为 Base64 编码字符串
            return Base64.getEncoder().encodeToString(encryptedBytes);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
    /**
     * <h2>解密 - 模式 ECB</h2>
     *
     * @param text 需要解密的文本内容
     * @param key  解密的密钥 key
     */
    public static String decrypt(String text, String key) {
        if (isEmpty(text) || isEmpty(key)) {
            return null;
        }
        
        // 将密文转换为16字节的字节数组
        byte[] textBytes = Base64.getDecoder().decode(text);
        
        try {
            // 创建AES加密器
            Cipher cipher = Cipher.getInstance(AES_ECB);
            
            SecretKeySpec secretKeySpec = getSecretKeySpec(key);
            
            cipher.init(Cipher.DECRYPT_MODE, secretKeySpec);
            
            // 解密字节数组
            byte[] decryptedBytes = cipher.doFinal(textBytes);
            
            // 将明文转换为字符串
            return new String(decryptedBytes, StandardCharsets.UTF_8);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    

    
    
    /**
     * token加密
     *
     * @return 加密方式 id
     */
    public static String generateToken(String token) {
        Base64.Encoder encoder = Base64.getEncoder();
        String encodetoken = encoder.encodeToString(token.getBytes(StandardCharsets.UTF_8));
        return encodetoken;
    }
    
    /**
     * token 解密
     *
     * @param encryptToken
     * @return
     */
    public static String decryptToken(String encryptToken) {
        Base64.Decoder decoder = Base64.getDecoder();
        String decryptToken = new String(decoder.decode(encryptToken), StandardCharsets.UTF_8);
//        System.out.println("解密后内容"+decryptToken);
        return decryptToken;
    }
    
    /**
     * 用户加密
     *
     * @param
     * @return
     */
    public static String encryptPawd(String pawd) {
        
        return encrypt(pawd, Constant.key);
    }
    
    /**
     * 用户解密
     *
     * @param
     * @return
     */
    public static String decryptPawd(String enpawd) {
        
        return decrypt(enpawd, Constant.key);
        
    }
    
    
    public static void main(String[] args) {
        String pawd = "admin";
        String a = "7dODUYd7MZw2YkqNoioMvw==";
        System.out.println("密码是" + encryptPawd(pawd));//tdwjSTRYI+6LIvtbHKOilw==
       
        String pawd1 = "123456";
        String b = encryptPawd( pawd1);
        System.out.println("密码是" + encryptPawd(pawd1));//tdwjSTRYI+6LIvtbHKOilw==;
        System.out.println("解密後" + decryptPawd(a));
        System.out.println("解密後" + decryptPawd(b));
        
        
    }
//        String token = UUID.randomUUID().toString();
//        String entoken = generateToken(token);
//        System.out.println("token is" + entoken);
//        String detoken = decryptToken(entoken);
//        System.out.println("detoken is " + detoken);

//    }
    /**
     UserTable.IUser user = new UserTable.IUser(3,"admin","admin","admin");
     String entoken = generateToken(user);
     System.out.println("加密后"+entoken);
     String detoken = decryptToken(entoken);
     System.out.println("解密后"+detoken);
     
     String text = "嗨，您好！";
     String key  = "woniucsdnvip8888"; // 16字节的密钥
     String iv  = getIV();
     
     String encryptTextCBC = encrypt(text, key, iv, AES_CBC);
     System.out.println("CBC 加密IV：" + iv);
     System.out.println("CBC 加密后内容：" + encryptTextCBC);
     System.out.println("CBC 解密后内容：" + decrypt(encryptTextCBC, key, iv, AES_CBC));
     System.out.println();
     
     String encryptTextCFB = encrypt(text, key, iv, AES_CFB);
     System.out.println("CFB 加密IV：" + iv);
     System.out.println("CFB 加密后内容：" + encryptTextCFB);
     System.out.println("CFB 解密后内容：" + decrypt(encryptTextCFB, key, iv, AES_CFB));
     
     }
     */
}

    

