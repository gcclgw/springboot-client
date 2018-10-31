package com.jk.service.orders;

import com.alibaba.dubbo.common.json.JSONObject;

import java.util.Map;

public interface OrdersService {

    JSONObject queryOrders(Integer page, Integer rows);
}
