package com.crazycode.mapper;

import com.crazycode.entity.Member;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhao yudong
 * @since 2019-11-26
 */
public interface MemberMapper extends BaseMapper<Member> {
    Member selectOne(Member member);
}
