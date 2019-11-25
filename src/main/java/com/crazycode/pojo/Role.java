package com.crazycode.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Role {

  private String id;
  @Column(name="roleName")
  private String roleName;
  @Column(name="roleDesc")
  private String roleDesc;

}
