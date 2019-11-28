package com.crazycode.service.impl;

import com.crazycode.entity.Member;
import com.crazycode.mapper.MemberMapper;
import com.crazycode.service.IMemberService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhao yudong
 * @since 2019-11-26
 */
@Service
public class MemberServiceImpl extends ServiceImpl<MemberMapper, Member> implements IMemberService {

}
