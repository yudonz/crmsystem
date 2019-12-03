package com.crazycode.realm;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.crazycode.entity.Role;
import com.crazycode.entity.Users;
import com.crazycode.service.IUsersService;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

public class UserRealm extends AuthorizingRealm {

    @Autowired
    private IUsersService usersService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        System.out.println("执行了授权方法");
        //封装授权的相关信息
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        //获取当前用户
        Users user = (Users) SecurityUtils.getSubject().getPrincipal();
        System.out.println("111111"+user);
        try {
            user = usersService.selectById(user.getId());
            for (Role role: user.getRoles()){
                authorizationInfo.addRole(role.getRoleName());
            }

        }catch (Exception e){
            e.printStackTrace();
        }
//        authorizationInfo.addRole("");
        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        System.out.println("执行了认证方法.....");
        //从token获取用户名,从主体传过来的认证信息中获取
        String username = (String) authenticationToken.getPrincipal();
        //从数据库查找用户
        Users user = null;
        try {
            user = usersService.getOne(new QueryWrapper<Users>().eq("username", username));
            System.out.println(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(user==null){
            throw  new UnknownAccountException();
        }
        ByteSource salt = ByteSource.Util.bytes(user.getUsername());// 得到佐料
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user,user.getPassword(),salt,getName());
        return authenticationInfo;
    }
}
