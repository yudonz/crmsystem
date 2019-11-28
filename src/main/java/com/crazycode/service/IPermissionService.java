package com.crazycode.service;

import com.crazycode.entity.Permission;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhao yudong
 * @since 2019-11-27
 */
public interface IPermissionService extends IService<Permission> {
    Permission selectById(String id);
    List<Permission> selectByRid(String id);
}
