package com.crazycode.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Traveller {

  private String id;
  private String name;
  private String sex;
  @Column(name = "phoneNum")
  private String phoneNum;
  @Column(name = "credentialsType")
  private long credentialsType;
  @Column(name = "credentialsNum")
  private String credentialsNum;
  @Column(name = "travellerType")
  private long travellerType;


}
