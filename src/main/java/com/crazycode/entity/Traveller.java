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
 * @since 2019-12-02
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Traveller implements Serializable {

    @TableId(value = "id",type = IdType.UUID)
    private String id;
    private String name;
    private String sex;
    @TableField("phoneNum")
    private String phoneNum;
    @TableField("credentialsType")
    private Integer credentialsType;
    @TableField("credentialsNum")
    private String credentialsNum;
    @TableField("travellerType")
    private Integer travellerType;


}
