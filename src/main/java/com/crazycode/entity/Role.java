package com.crazycode.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import java.util.List;

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
public class Role implements Serializable {

    @TableId(value = "id",type = IdType.UUID)
    private String id;
    @TableField("roleName")
    private String roleName;
    @TableField("roleDesc")
    private String roleDesc;
    @TableField(exist = false)
    private List<Permission> permissions;
}
