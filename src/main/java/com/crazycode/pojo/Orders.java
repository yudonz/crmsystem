package com.crazycode.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Orders {

  private String id;
  @Column(name = "orderNum")
  private String orderNum;
  @Column(name = "orderTime")
  private java.sql.Timestamp orderTime;
  @Column(name = "peopleCount")
  private long peopleCount;
  @Column(name = "orderDesc")
  private String orderDesc;
  @Column(name = "payType")
  private long payType;
  @Column(name = "orderStatus")
  private long orderStatus;
  @Column(name = "productId")
  private String productId;
  @Column(name = "memberId")
  private String memberId;



}
