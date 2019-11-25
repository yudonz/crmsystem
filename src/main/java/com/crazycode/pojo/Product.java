package com.crazycode.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {

  private String id;
  @Column(name="productNum")
  private String productNum;
  @Column(name="productName")
  private String productName;
  @Column(name="cityName")
  private String cityName;
  @Column(name="departureTime")
  private java.sql.Timestamp departureTime;
  @Column(name="productPrice")
  private double productPrice;
  @Column(name="productDesc")
  private String productDesc;
  @Column(name="productStatus")
  private long productStatus;


}
