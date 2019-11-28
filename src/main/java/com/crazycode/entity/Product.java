package com.crazycode.entity;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

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
 * @since 2019-11-27
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Product implements Serializable {
    @TableId(value = "id",type = IdType.UUID)
    private String id;
    @TableField("productNum")
    private String productNum;
    @TableField("productName")
    private String productName;
    @TableField("cityName")
    private String cityName;
    @TableField("DepartureTime")
    private Timestamp departureTime;
    @TableField("productPrice")
    private Double productPrice;
    @TableField("productDesc")
    private String productDesc;
    @TableField("productStatus")
    private Integer productStatus;

    public String getDepartureTime() {
        SimpleDateFormat sdt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdt.format(departureTime);
    }

    public void setDepartureTime(String departureTime) {
        if (departureTime.length() == 19) {
            this.departureTime = Timestamp.valueOf(departureTime);
        } else if (departureTime.length() == 16) {
            this.departureTime = Timestamp.valueOf(departureTime + ":00");
        }
    }
}
