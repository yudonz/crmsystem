package com.crazycode.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import java.util.List;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
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
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Users implements Serializable {
    @TableId(value = "id",type = IdType.UUID)
    private String id;
    private String email;
    private String username;
    @TableField("PASSWORD")
    private String password;
    @TableField("phoneNum")
    private String phoneNum;
    @TableField("STATUS")
    private Integer status;
    @TableField(exist = false)
    private List<Role> roles;

}
