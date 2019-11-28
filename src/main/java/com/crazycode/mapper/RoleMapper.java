package com.crazycode.mapper;

import com.crazycode.entity.Role;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author zhao yudong
 * @since 2019-11-26
 */
public interface RoleMapper extends BaseMapper<Role> {
    List<Role> selectByUid(String id);

    Role selectById(String id);

    boolean addPermissionToRole(String pid, String rid);
}
