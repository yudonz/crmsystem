package com.crazycode.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsersRole {
    @Column(name = "userId")
    private String userId;
    @Column(name = "roleId")
    private String roleId;

}
