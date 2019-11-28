package com.crazycode.mapper;

import com.crazycode.entity.Users;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author zhao yudong
 * @since 2019-11-26
 */
public interface UsersMapper extends BaseMapper<Users> {
    Users selectById(String id);

    boolean addRoleToUser(String uid, String rid);

    boolean deleteRoleFromUser(String uid, String rid);
}
