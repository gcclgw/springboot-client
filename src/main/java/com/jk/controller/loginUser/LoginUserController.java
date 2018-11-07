package com.jk.controller.loginUser;


import com.alibaba.fastjson.JSONObject;
import com.jk.model.orders.Orders;
import com.jk.model.users.Users;
import com.jk.service.loginUser.LoginUserService;
import com.jk.service.orders.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("loginUser")
public class LoginUserController {
    @Autowired
    private LoginUserService loginUserService;
    @Autowired
    private OrdersService ordersService;


    @RequestMapping("toLoginUser")
    public  String toLoginUser(){
        return "/stage/loginuser";
    }



    @RequestMapping("login")
    @ResponseBody
    public int login(HttpServletRequest request, Users users){
       JSONObject json  = loginUserService.loginUser(users);
        Users dbuser = (Users) json.get("dbuser");
        request.getSession().setAttribute("dbuser",dbuser);
        return (int) json.get("flag");
    }


    @RequestMapping("/exitUser")
    @ResponseBody
    public ModelAndView exitUser(HttpServletRequest request){
    request.getSession().removeAttribute("dbuser");
        ModelAndView mv = new ModelAndView("forward:/user/toIndex");//默认为forward模式
    return mv;
}

    @RequestMapping("madd")

    public String madd(HttpServletRequest request, Model mm){
        Users users = (Users) request.getSession().getAttribute("dbuser");
        List<Orders> orders = loginUserService.queryOrder(users.getUid());
        System.out.println(orders);
        mm.addAttribute("orders",orders);
        mm.addAttribute("user",users);
        return "/stage/order";
}



    @RequestMapping("updateOrderById")
    @ResponseBody
    public  void   updateOrderById(Integer oid,HttpServletRequest request, Model mm){
        System.out.println(oid);
        ordersService.updateOrderById(oid);


    }


}
