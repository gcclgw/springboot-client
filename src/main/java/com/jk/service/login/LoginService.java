package com.jk.service.login;

import com.jk.model.user.User;

import java.util.Map;

public interface LoginService {
    Map<String, Object> login(User user);

    //public User loginUserName(String userName);

}
