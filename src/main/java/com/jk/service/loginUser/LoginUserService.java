package com.jk.service.loginUser;


import com.alibaba.fastjson.JSONObject;
import com.jk.model.orders.Orders;
import com.jk.model.users.Users;

import java.util.List;

public interface LoginUserService {
    JSONObject loginUser(Users users);
    List<Orders> queryOrder(Integer uid);

}
