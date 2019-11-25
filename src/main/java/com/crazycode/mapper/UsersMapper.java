package com.crazycode.mapper;

import com.crazycode.pojo.Users;
import org.springframework.stereotype.Component;
import tk.mybatis.mapper.common.Mapper;

@Component
public interface UsersMapper extends Mapper<Users> {
}
