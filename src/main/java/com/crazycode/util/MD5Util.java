package com.crazycode.util;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

public class MD5Util {
    public static String md5hash(String password, String username) {
        ByteSource salt = ByteSource.Util.bytes(username);
        return new SimpleHash(Md5Hash.ALGORITHM_NAME, password, salt, 1024).toHex();
    }

    public static void main(String[] args) {
        System.out.println(md5hash("123","frank"));
    }
}
