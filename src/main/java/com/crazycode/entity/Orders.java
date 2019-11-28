package com.crazycode.entity;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import java.util.List;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import lombok.experimental.FieldDefaults;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhao yudong
 * @since 2019-11-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Orders implements Serializable {

    @TableId(value = "id",type = IdType.AUTO)
    private Integer id;
    @TableField("orderNum")
    private String orderNum;
    @TableField("orderTime")
    private Timestamp orderTime;
    @TableField("peopleCount")
    private Integer peopleCount;
    @TableField("orderDesc")
    private String orderDesc;
    @TableField("payType")
    private Integer payType;
    @TableField("orderStatus")
    private Integer orderStatus;
    @TableField("productId")
    private String productId;
    @TableField("memberId")
    private String memberId;
    @TableField(exist = false)
    private Product product;
    @TableField(exist = false)
    private Member member;

    public String getOrderTime() {
        SimpleDateFormat sdt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdt.format(orderTime);
    }

//    public void setOrderTime(Timestamp orderTime) {
//        this.orderTime = orderTime;
//    }
}
