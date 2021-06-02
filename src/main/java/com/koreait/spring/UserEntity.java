package com.koreait.spring;

import lombok.*;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
public class UserEntity {
    private int iuser;
    private String uid;
    private String upw;
    private String unm;
    private int gender;
    private String regdt;
    private String profileImg;
}
