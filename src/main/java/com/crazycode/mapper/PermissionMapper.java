package com.crazycode.mapper;

import com.crazycode.entity.Permission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhao yudong
 * @since 2019-11-27
 */
public interface PermissionMapper extends BaseMapper<Permission> {
    Permission selectById(String id);
    List<Permission> selectByRid(String id);
}
