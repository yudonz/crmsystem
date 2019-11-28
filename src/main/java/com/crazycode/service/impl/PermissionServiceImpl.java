package com.crazycode.service.impl;

import com.crazycode.entity.Permission;
import com.crazycode.mapper.PermissionMapper;
import com.crazycode.service.IPermissionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhao yudong
 * @since 2019-11-27
 */
@Service
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements IPermissionService {

    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public Permission selectById(String id) {
        return permissionMapper.selectById(id);
    }

    @Override
    public List<Permission> selectByRid(String id) {
        return permissionMapper.selectByRid(id);
    }
}
