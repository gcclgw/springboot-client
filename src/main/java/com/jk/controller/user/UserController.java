package com.jk.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("user")
public class UserController {
    @RequestMapping("/toIndex")
    public String toIndex(Model mm){
       String str = "11111";
        mm.addAttribute("a",str);
        return  "index2";
    }
}
