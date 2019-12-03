package com.crazycode.config;

import com.crazycode.realm.UserRealm;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.mgt.SessionsSecurityManager;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.spring.web.config.DefaultShiroFilterChainDefinition;
import org.apache.shiro.spring.web.config.ShiroFilterChainDefinition;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.Map;

@Configuration
public class ShiroConfig {


    /*在容器中创建一个UserRealm对象*/
    @Bean
    public Realm userRealm(CredentialsMatcher hashedCredentialsMatcher ) throws Exception{
        UserRealm userRealm = new UserRealm();
        userRealm.setCredentialsMatcher(hashedCredentialsMatcher);
        return userRealm;
    }

    @Bean
    public SessionsSecurityManager securityManager(Realm userRealm){
        SessionsSecurityManager securityManager=new DefaultWebSecurityManager();
        securityManager.setRealm(userRealm);
        return securityManager;
    }

    /*配置一个Shiro过滤器,用来拦截所有的URL进行验证*/
    @Bean
    public ShiroFilterChainDefinition shiroFilterChainDefinition() throws Exception{
        DefaultShiroFilterChainDefinition shiroFilterChainDefinition = new DefaultShiroFilterChainDefinition();
        Map<String, String> filterChainDefinitionMap = new LinkedHashMap<>();
        filterChainDefinitionMap.put("/login.do","anon");//匿名访问
        filterChainDefinitionMap.put("/logout.do","logout");
        filterChainDefinitionMap.put("/user/**","authc");//否则返回到LoginUrl所指定的页面中
        filterChainDefinitionMap.put("/role/**","authc");
        filterChainDefinitionMap.put("/permission/**","authc");
        filterChainDefinitionMap.put("/product/**","authc");
        filterChainDefinitionMap.put("/orders/**","authc");
        shiroFilterChainDefinition.addPathDefinitions(filterChainDefinitionMap);
        return shiroFilterChainDefinition;
    }

    /**
     * 配置一个CredentialsMatcher类型的加密对象
     * 当调用自定义realm验证方法的时候,会把表单传过来的密码交给HashedCredentialsMatcher来进行加密,加密后
     * 会和数据库中的密码进行比对
     */
    @Bean
    public CredentialsMatcher hashedCredentialsMatcher() throws Exception{
        System.out.println("执行了密码匹配...");
        HashedCredentialsMatcher credentialsMatcher = new HashedCredentialsMatcher();
        credentialsMatcher.setHashAlgorithmName(Md5Hash.ALGORITHM_NAME);// 设置加密算法类型
        credentialsMatcher.setHashIterations(1024);//设置加密次数
        return credentialsMatcher;
    }

}
