package com.crazycode.entity;



import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

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
public class Syslog implements Serializable {

    @TableId(value = "id",type = IdType.UUID)
    private String id;
    @TableField("visitTime")
    private Timestamp visitTime;
    private String username;
    private String ip;
    private String url;
    @TableField("executionTime")
    private Integer executionTime;
    private String method;

    public String getVisitTime() {
        SimpleDateFormat sdt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdt.format(visitTime);
    }
}
