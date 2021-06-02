package com.koreait.spring.user;

import com.koreait.spring.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserMapper mapper;

    public int join(UserEntity param) {
        return mapper.insUser(param);
    }
}
