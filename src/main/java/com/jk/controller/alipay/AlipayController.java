package com.jk.controller.alipay;

import com.alipay.api.AlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.jk.model.orders.Orders;
import com.jk.service.orders.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.alipay.api.DefaultAlipayClient;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("alipay")
public class AlipayController {

    @Autowired
    private OrdersService ordersService;
    /**
     * 跳转到付款页面
     * */
    @RequestMapping("toPayment")
    public String toPayment(Integer  oid, Model model){
        List<Orders> ordersList=ordersService.queryOrdersByOid(oid);
        model.addAttribute("ordersList",ordersList);

        Orders orders=ordersService.queryTotalByOid(oid);
        model.addAttribute("orders",orders);
        return "alipay/payment";
    }



    //跳转地图
    @RequestMapping("toArea")
    public  String  toArea(){
        return "stage/csy";
    }


    @RequestMapping(value = "/goAlipay")
    @ResponseBody
    public String goAlipay(Orders orders, HttpServletRequest request, HttpServletRequest response) throws Exception {
        request.getSession().setAttribute("orders",orders);

        Integer total = orders.getTotal();
        //生成唯一订单号
        IdWorker idWorker = new IdWorker(1, 0);
        long idWork = idWorker.nextId();
        String dingDanHao = String.valueOf(idWork);
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();

        alipayRequest.setReturnUrl(AlipayConfig.return_url);

        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = dingDanHao;
        //付款金额，必填
        Integer total_amount =total;
        //订单名称，必填
        String subject = "【传智博客】";
       //商品描述，可空
        String body = "用户订单支付"+3;

        // 该笔订单允许的最晚付款时间，逾期将关闭交易。取值范围：1m～15d。m-分钟，h-小时，d-天，1c-当天（1c-当天的情况下，无论交易何时创建，都在0点关闭）。 该参数数值不接受小数点， 如 1.5h，可转换为 90m。
        String timeout_express = "1c";



        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ total_amount +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"body\":\""+ body +"\","
                + "\"timeout_express\":\""+ timeout_express +"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        //请求
        String result = alipayClient.pageExecute(alipayRequest).getBody();
        return result;

    }

    @RequestMapping("selectsuccess")
    public String selectsucess(HttpServletRequest request,Model model){
        Orders orders = (Orders)request.getSession().getAttribute("orders");
        System.out.println(orders.getOid());
        model.addAttribute("orders",orders);
        return "alipay/success";
    }

    @RequestMapping("selecterror")
    public String selecterror(){
        return "alipay/error";
    }

    @RequestMapping("updateOrderState")
    public void updateOrderState(Integer oid){
        ordersService.updateOrderState(oid);
    }




}
