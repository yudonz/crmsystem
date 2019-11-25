package com.crazycode.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderTraveller {
  @Column(name = "orderId")
  private String orderId;
  @Column(name = "travellerId")
  private String travellerId;


}
