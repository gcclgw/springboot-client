package com.jk.controller.loginUser;


import com.alibaba.fastjson.JSONObject;
import com.jk.model.users.Users;
import com.jk.service.loginUser.LoginUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("loginUser")
public class LoginUserController {
    @Autowired
    private LoginUserService loginUserService;


    @RequestMapping("toLoginUser")
    public  String toLoginUser(){
        return "loginuser";
    }



    @RequestMapping("login")
    @ResponseBody
    public int login(HttpServletRequest request, Users users){
       JSONObject json  = loginUserService.loginUser(users);
        Users dbuser = (Users) json.get("dbuser");
        request.getSession().setAttribute("dbuser",dbuser);
        return (int) json.get("flag");
    }
}
