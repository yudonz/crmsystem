package com.crazycode.mapper;

import com.crazycode.entity.Traveller;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhao yudong
 * @since 2019-12-02
 */
public interface TravellerMapper extends BaseMapper<Traveller> {
    List<Traveller> selectByOid(String oid);
}
