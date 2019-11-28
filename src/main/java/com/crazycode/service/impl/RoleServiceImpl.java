package com.crazycode.service.impl;

import com.crazycode.entity.Permission;
import com.crazycode.entity.Role;
import com.crazycode.mapper.PermissionMapper;
import com.crazycode.mapper.RoleMapper;
import com.crazycode.service.IRoleService;
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
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {

    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public Role selectById(String id) {
        return roleMapper.selectById(id);
    }

    @Override
    public List<Role> selectByUid(String id) {
        return roleMapper.selectByUid(id);
    }

    @Override
    public boolean addPermissionsToRole(List<String> pids, String rid) {
        Role role = roleMapper.selectById(rid);
        System.out.println("role:"+role);
        boolean flag = false;
        for (String pid : pids) {
            Permission permission = permissionMapper.selectById(pid);
            if (role.getPermissions().contains(permission)) {

            } else {
                //给角色添加权限
                flag = roleMapper.addPermissionToRole(pid, rid);
            }
        }
        return flag;
    }
}
