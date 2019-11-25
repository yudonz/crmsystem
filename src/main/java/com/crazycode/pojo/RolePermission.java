package com.crazycode.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RolePermission {
  @Column(name="permissionId")
  private String permissionId;
  @Column(name="roleId")
  private String roleId;




}
