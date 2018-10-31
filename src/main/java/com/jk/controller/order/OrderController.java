package com.jk.controller.order;

import com.alibaba.dubbo.common.json.JSONObject;
import com.jk.service.orders.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping("orders")
public class OrderController {
    @RequestMapping("/toIndex")
    public String toIndex(){
        return  "index";
    }

    @Autowired
    private OrdersService ordersService;

    //跳转到订单页面
    @RequestMapping("toOrders")
    public String toNoSql(){
        return "/order/showOrders";
    }
    @RequestMapping("queryOrders")
    @ResponseBody
    public JSONObject queryOrders(Integer pageSize, Integer start) {
        pageSize =3;
        start=1;
        JSONObject jsonObject = ordersService.queryOrders(pageSize, start);
        System.out.println(jsonObject);
        return jsonObject;

    }
}
