package com.example.myproject.service;

import com.example.myproject.config.Constant;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Random;

public class EncryptService {
    private static final String AES_CBC = "AEC/CBC/PKCS5Padding";
    
    /**
     * <h1>空校验</h1>
     */
    public static boolean isEmpty(Object str) {
        return str == null || "".equals(str);
    }
    
    /**
     * <h1>string 转 byte</h1>
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
    
    /**
     * <h1>初始化向量iv，是一个随机生成的字节数组，用于增加加密和解密的安全性</h1>
     */
    private static final Integer IV_LENGTH = 16;
    
    public static String getIV() {
        String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        Random random = new Random();
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0; i < IV_LENGTH; i++) {
            int number = random.nextInt(str.length());
            stringBuffer.append(str.charAt(number));
        }
        return stringBuffer.toString();
    }
    
    /**
     * <h1>获取一个秘钥加密规范</h1>
     */
    
    public static SecretKeySpec getSecretKeySpec(String key) {
        SecretKeySpec secretKeySpec = new SecretKeySpec(getBytes(key), "AES");
        return secretKeySpec;
    }
    
    /**
     * <h2>自定义加密模式</h2>
     *
     * @param content
     * @param key
     * @param iv
     * @param mode
     * @return
     */
    
    public static String encrypt(String content, String key, String iv, String mode) {
        if (isEmpty(content) || isEmpty(key) || isEmpty(iv)) {
            return null;
        }
        try {
            //创建加密容器
            Cipher cipher = Cipher.getInstance(mode);
            SecretKeySpec secretKeySpec = getSecretKeySpec(key);
            cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec, new IvParameterSpec(getBytes(iv)));
            byte[] encryptedBytes = cipher.doFinal(getBytes(content));
            
            return Base64.getEncoder().encodeToString(encryptedBytes);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
    /**
     * <h1>解密</h1>
     *
     * @param text
     * @param key
     * @param iv
     * @param mode
     * @return
     */
    public static String decrypt(String text, String key, String iv, String mode) {
        if (isEmpty(text) || isEmpty(key) || isEmpty(iv)) {
            return null;
        }
        // 将密文转换为16字节的字节数组
        byte[] textBytes = Base64.getDecoder().decode(text);
        
        try {
            // 创建AES加密器
            Cipher cipher = Cipher.getInstance(mode);
            
            SecretKeySpec secretKeySpec = getSecretKeySpec(key);
            
            cipher.init(Cipher.DECRYPT_MODE, secretKeySpec, new IvParameterSpec(getBytes(iv)));
            
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
     * @return 加密方式 id+当前时间+盐
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
        return decryptToken;
    }
    
    /**
     * 用户加密
     *
     * @param
     * @return
     */
    public static String encryptPawd(String pawd) {
        
        return encrypt(pawd, Constant.key, Constant.iv, AES_CBC);
    }
    
    /**
     * 用户解密
     *
     * @param
     * @return
     */
    public static String decryptPawd(String enpawd) {
        
        return decrypt(enpawd, Constant.key, Constant.iv, AES_CBC);
        
    }
    
}
