package com.crazycode.service;

import com.crazycode.entity.Users;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.catalina.User;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author zhao yudong
 * @since 2019-11-26
 */
public interface IUsersService extends IService<Users> {

    Users selectById(String id);

//    boolean addRoleToUser(String uid, String rid);
//
//    boolean deleteRoleFromUser(String uid, String rid);

    boolean addRolesToUser(List<String> rids, String userId);

}
