package org.example.yt.service;


import org.example.yt.UserTable;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.Random;
import java.util.logging.Logger;
import java.security.SecureRandom;
/**
 * <h1>AES 加密和解密示例代码</h1>
 * Created by woniu
 * */
public class TokenService {
    private static final Logger logger = Logger.getLogger(JwtService.class.getName());
    
    /** 加密模式之 ECB，算法/模式/补码方式 */
    private static final String AES_ECB = "AES/ECB/PKCS5Padding";
    
    /** 加密模式之 CBC，算法/模式/补码方式 */
    private static final String AES_CBC = "AES/CBC/PKCS5Padding";
    
    /** 加密模式之 CFB，算法/模式/补码方式 */
    private static final String AES_CFB = "AES/CFB/PKCS5Padding";
    
    /** AES 中的 IV 必须是 16 字节（128位）长 */
    private static final Integer IV_LENGTH = 16;
    
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
    public static byte[] getBytes(String str){
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
     * <h2>初始化向量（IV），它是一个随机生成的字节数组，用于增加加密和解密的安全性</h2>
     */
    public static String getIV(){
        String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for(int i = 0 ; i < IV_LENGTH ; i++){
            int number = random.nextInt(str.length());
            sb.append(str.charAt(number));
        }
        return sb.toString();
    }
    
    /***
     * <h2>获取一个 AES 密钥规范</h2>
     */
    public static SecretKeySpec getSecretKeySpec(String key){
        SecretKeySpec secretKeySpec = new SecretKeySpec(getBytes(key), "AES");
        return secretKeySpec;
    }
    

 
    
    /**
     * <h2>加密 - 自定义加密模式</h2>
     * @param text 需要加密的文本内容
     * @param key 加密的密钥 key
     * @param iv 初始化向量
     * @param mode 加密模式
     * */
    public static String encrypt(String text, String key, String iv, String mode){
        if (isEmpty(text) || isEmpty(key) || isEmpty(iv)) {
            return null;
        }
        
        try {
            // 创建AES加密器
            Cipher cipher = Cipher.getInstance(mode);
            
            SecretKeySpec secretKeySpec = getSecretKeySpec(key);
            
            cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec, new IvParameterSpec(getBytes(iv)));
            
            // 加密字节数组
            byte[] encryptedBytes = cipher.doFinal(getBytes(text));
            
            // 将密文转换为 Base64 编码字符串
            return Base64.getEncoder().encodeToString(encryptedBytes);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
    /**
     * <h2>解密 - 自定义加密模式</h2>
     * @param text 需要解密的文本内容
     * @param key 解密的密钥 key
     * @param iv 初始化向量
     * @param mode 加密模式
     * */
    public static String decrypt(String text, String key, String iv, String mode){
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
    public static String generateSalt(int length) {
        // 使用SecureRandom生成安全的随机数
        SecureRandom random = new SecureRandom();
        byte[] saltBytes = new byte[length];
        random.nextBytes(saltBytes);
        // 将随机字节数组转换为Base64编码的字符串
        return Base64.getEncoder().encodeToString(saltBytes);
    }
    static String key  = "woniucsdnvip8888"; // 16字节的密钥
    static String iv  = getIV();
    
    /**
     * token加密
     * @param user
     * @return
     * 加密方式 id+当前时间+盐
     */
    public static String generateToken(UserTable.IUser user){
        String salt = generateSalt(16);
        
        String id = user.getId().toString();            //id
        LocalDateTime localDateTime = LocalDateTime.now().plusHours(1);     //当前时间+1
        String formattime = localDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        logger.info("localtime + one hour = "+formattime);
        
        String token = id + "@" +formattime+"@"+salt;
        String encryptTextCBC = encrypt(token, key, iv, AES_CBC);
        System.out.println("token,"+token);
        System.out.println("CBC 加密IV：" + iv);
        System.out.println("CBC 加密后内容：" + encryptTextCBC);
        return encryptTextCBC;

    }
    
    /**
     * token 解密
     * @param encryptToken
     * @return
     */
    public static String decryptToken(String encryptToken){
        String decryptToken = decrypt(encryptToken,key,iv,AES_CBC);
        System.out.println("解密后内容"+decryptToken);
        return decryptToken;
    }
    
    /**
     * 用户加密
     * @param user
     * @return
     */
    public static UserTable.IUser encryptUser(UserTable.IUser user){
        String salt = generateSalt(16);
        String userName = user.getUsername();
        String userPassword = user.getPassword();
        userName = userName+"@"+salt;
        userPassword = userPassword + "@" +salt;
        String encryptName = encrypt(userName,key,iv,AES_CBC);
        String encryptPassword = encrypt(userPassword,key,iv,AES_CBC);
        user.setPassword(encryptPassword);
        user.setUsername(encryptName);
        return user;
    }
    
    /**
     * 用户解密
     * @param user
     * @return
     */
    public  static UserTable.IUser decryptUser(UserTable.IUser user){
        String userName = user.getUsername();
        String userPassword = user.getPassword();
        String decryptName = decrypt(userName,key,iv,AES_CBC);
        String decryptPassword = decrypt(userPassword,key,iv,AES_CBC);
        user.setUsername(decryptName);
        user.setPassword(decryptPassword);
        return user;
        
    }
    
    /**
    
    public static void main(String[] args) {
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
