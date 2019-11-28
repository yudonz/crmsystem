package com.crazycode.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhao yudong
 * @since 2019-11-26
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Member implements Serializable {
    @TableId(value = "id",type = IdType.UUID)
    private String id;

    /**
     * ????
     */
    private String name;

    /**
     * ?ǳ
     */
    @TableField("nickName")
    private String nickName;

    /**
     * ?绰???
     */
    @TableField("phoneNum")
    private String phoneNum;

    /**
     * ???
     */
    private String email;


}
