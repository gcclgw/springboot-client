package com.jk.controller.user;

import com.jk.model.users.Users;
import jdk.internal.org.objectweb.asm.Handle;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("user")
public class UserController {
    @RequestMapping("/toIndex")
    public String toIndex(HttpServletRequest request,Model mm){
        if (request.getSession().getAttribute("dbuser")!=null){
           Users dbuser = (Users) request.getSession().getAttribute("dbuser");
            mm.addAttribute("user",dbuser);
            System.out.println(dbuser);
        }
        return  "index2";
    }
    @RequestMapping("/toAdminIndex")
    public String toAdminIndex(){
         return  "index";
    }
}
