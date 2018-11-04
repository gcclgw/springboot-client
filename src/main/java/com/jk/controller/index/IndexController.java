package com.jk.controller.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {


    /**
     * 跳转登录页面
     * @return
     */
    @RequestMapping("login")
    public String toLogin() {
        return "login/login";
    }

    @RequestMapping("nopower")
    public String toNopower() {
        return "login/nopower";
    }

    @RequestMapping("index")
    public String toIndex() {
        return "index/index";
    }

    /**
     * 跳转权限设置页面
     */
    @RequestMapping("selectUser")
    public String selectUser(){
        return "power/list";
    }
    /**
     * 跳转角色页面
     */
    @RequestMapping("selectRole")
    public String selectRole(){
        return "role/dialogRole";
    }

    /**
     * 跳转角色页面
     * @return
     */
    @RequestMapping("dialogRole")
    public String dialogRole(){
        return  "role/dialogRole";
    }

    /**
     * 跳转广告页面
     */
    @RequestMapping("selectAdver")
    public String  selectAdver(){
        return "adver/adverList";
    }
    /**
     * 跳转广告位页面
     */
    @RequestMapping("selectAdverSeat")
    public String  selectAdverSeat(){
        return "adverSeat/adverSeatList";
    }

    /**
     * 进入广告新增页面
     */
    @RequestMapping("toAddAdver")
    public String toAddAdver(){
        return "adver/adverSeatAdd";
    }







}
