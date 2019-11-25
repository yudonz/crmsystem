package com.crazycode.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {

    private String id;
    private String name;
    @Column(name = "nickName")
    private String nickName;
    @Column(name = "phoneNum")
    private String phoneNum;
    private String email;


}
