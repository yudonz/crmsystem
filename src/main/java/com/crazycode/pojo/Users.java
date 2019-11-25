package com.crazycode.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Table;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "users")
public class Users {

  private String id;
  private String email;
  private String username;
  private String password;
  @Column(name="phoneNum")
  private String phoneNum;
  private long status;



}
