package com.jk.service.loginUser;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.users.Users;

public interface LoginUserService {
    JSONObject loginUser(Users users);
}
