package com.crazycode.service;

import com.crazycode.entity.Role;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhao yudong
 * @since 2019-11-26
 */
public interface IRoleService extends IService<Role> {
    Role selectById(String id);
    List<Role> selectByUid(String id);
    boolean addPermissionsToRole(List<String> pids, String rid);

}
