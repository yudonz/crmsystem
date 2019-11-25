package com.crazycode.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Syslog {

  private String id;
  @Column(name="visitTime")
  private java.sql.Timestamp visitTime;
  private String username;
  private String ip;
  private String url;
  @Column(name="executionTime")
  private long executionTime;
  private String method;



}
