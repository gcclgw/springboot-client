package com.jk.service.orders;

import com.alibaba.dubbo.common.json.JSONObject;
import com.jk.model.orders.Orders;
import com.jk.model.orders.Product;

import java.util.List;
import java.util.Map;

public interface OrdersService {

    List<Orders> queryOrders();

    void fahuo(Orders orders);

    List<Product> queryXiangQing(Orders orders);

    void deleteOrders(Orders orders);

    void deleteOrderItem(Orders orders);

    Orders queryDetailsById(Orders orders);

    void updateOrder(Orders orders);

    //修改订单状态
    void updateOrderById(Integer oid);
}
