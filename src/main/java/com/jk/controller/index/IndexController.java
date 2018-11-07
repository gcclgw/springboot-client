package com.jk.controller.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

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
        return "index";
    }



}
