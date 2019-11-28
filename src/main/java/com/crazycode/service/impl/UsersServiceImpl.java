package com.crazycode.service.impl;

import com.crazycode.entity.Role;
import com.crazycode.entity.Users;
import com.crazycode.mapper.RoleMapper;
import com.crazycode.mapper.UsersMapper;
import com.crazycode.service.IUsersService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author zhao yudong
 * @since 2019-11-26
 */
@Service
public class UsersServiceImpl extends ServiceImpl<UsersMapper, Users> implements IUsersService {
    @Autowired
    private UsersMapper usersMapper;
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public Users selectById(String id) {
        return usersMapper.selectById(id);
    }

//    @Override
//    public boolean addRoleToUser(String uid, String rid) {
//        return usersMapper.addRoleToUser(uid,rid);
//    }
//
//    @Override
//    public boolean deleteRoleFromUser(String uid, String rid) {
//        return usersMapper.deleteRoleFromUser(uid,rid);
//    }

    @Override
    public boolean addRolesToUser(List<String> rids, String userId) {
        Users user = usersMapper.selectById(userId);
        boolean flag = false;
        for (String rid : rids) {
            //删除用户的所有角色
            //usersMapper.deleteRoleFromUser(userId, rid);
            Role role = roleMapper.selectById(rid);
            if (user.getRoles().contains(role)) {
            } else {
                //给用户添加角色
                flag = usersMapper.addRoleToUser(userId, rid);
            }
        }
        return flag;
    }
}
