package com.fly.dds.common;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

public class AESUtil {
    private static final String KEY = "SixteenByteKey!!"; // 16 바이트 키 (문자열 길이를 16자로 맞춤)
    private static final String INIT_VECTOR = "RandomInitVector"; // 16 바이트 IV

    public static String encrypt(String value) throws Exception {
        IvParameterSpec iv = new IvParameterSpec(INIT_VECTOR.getBytes(StandardCharsets.UTF_8));
        SecretKeySpec skeySpec = new SecretKeySpec(KEY.getBytes(StandardCharsets.UTF_8), "AES");

        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec, iv);

        byte[] encrypted = cipher.doFinal(value.getBytes(StandardCharsets.UTF_8));
        return Base64.getUrlEncoder().encodeToString(encrypted);
    }

    public static String decrypt(String encrypted) throws Exception {
        IvParameterSpec iv = new IvParameterSpec(INIT_VECTOR.getBytes(StandardCharsets.UTF_8));
        SecretKeySpec skeySpec = new SecretKeySpec(KEY.getBytes(StandardCharsets.UTF_8), "AES");

        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
        cipher.init(Cipher.DECRYPT_MODE, skeySpec, iv);

        byte[] original = cipher.doFinal(Base64.getUrlDecoder().decode(encrypted));
        return new String(original, StandardCharsets.UTF_8);
    }
}
