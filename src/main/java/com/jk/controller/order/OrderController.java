package com.jk.controller.order;

import com.alibaba.dubbo.common.json.JSONObject;
import com.jk.model.orders.Orders;
import com.jk.model.orders.Product;
import com.jk.model.orders.Trees;
import com.jk.model.power.PowerTree;
import com.jk.service.orders.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import java.util.List;
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
        return "/orders/showOrders";
    }


    @RequestMapping("queryOrders")
    @ResponseBody
    public List<Orders> queryOrders() {
        List<Orders>  list= ordersService.queryOrders();
        return list;
    }

    //发货
    @RequestMapping("fahuo")
    @ResponseBody
    public void fahuo(Orders orders){
        ordersService.fahuo(orders);
    }
    //根据订单id查询 订单的商品详情
    @RequestMapping("xiangqing")
    @ResponseBody
    public List<Product> queryXiangQing(Orders orders) {
        List<Product>  list= ordersService.queryXiangQing(orders);
        return list;
    }


    //跳转到订单页面
    @RequestMapping("toGoodsDetails")
    public String toGoods(Orders orders,Model model){
        List<Product>  list= ordersService.queryXiangQing(orders);
        model.addAttribute("goodsDetailsList",list);
        return "/orders/showGoodsDetails";
    }
    //删除
    @RequestMapping("deleteOrders")
    @ResponseBody
    public void deleteOrders(Orders orders){
        //删除订单表  orders
        ordersService.deleteOrders(orders);
        //删除  中间表数据 orderitem
        ordersService.deleteOrderItem(orders);

    }

    //跳转修改页面  同时查询 对应信息然后回显 toUpdateDetails
    @RequestMapping("toUpdateDetails")
    public String toUpdateDetails(Orders orders, Model model){
        Orders obj=ordersService.queryDetailsById(orders);
        model.addAttribute("orders",obj);
        return "/orders/showUpdateDetails";
    }
    //修改订单 updateOrder
    @RequestMapping("updateOrder")
    @ResponseBody
    public void updateOrder(Orders orders){
        ordersService.updateOrder(orders);
    }


/*    //跳转到首页
    @RequestMapping("csy")
    public String csy(){
        return "/orders/layout";
    }

    *//**
     * 获取tree的数据
     * @return
     *//*
    @RequestMapping(value="queryTree",produces="application/json;charset=UTF-8")
    @ResponseBody
    public String getSysOrganizeIdJSON(){
        String StrJSON = getSysOrganizeByParentIdJSON(0);
        StrJSON=StrJSON.substring(0, StrJSON.length()-1);
        return StrJSON;
    }

    *//**
     * 机构的JSON拼接
     * @param id
     * @return
     *//*
    private String getSysOrganizeByParentIdJSON(Integer id){
        String sonNodes="";
        List<Trees> list = ordersService.getSysOrganizeByParentId(id);
        for(Trees tree : list){
            sonNodes+="{ text: '"+tree.getText()+"', id: '"+tree.getId()+"', url: '"+tree.getUrl()+"'";
            if(!getSysOrganizeByParentIdJSON(tree.getId()).isEmpty()){

                sonNodes+= ", nodes: ["+getSysOrganizeByParentIdJSON(tree.getId())+"] ";

            }
            sonNodes+= "},";
        }
        return sonNodes;
    }*/

}
