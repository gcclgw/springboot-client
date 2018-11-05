package com.jk.controller.user;

import com.jk.model.logo.Logo;
import com.jk.model.users.Users;
import com.jk.service.logo.LogoService;
import jdk.internal.org.objectweb.asm.Handle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {
   @Autowired
   private LogoService logoService;

    @RequestMapping("/toIndex")
    public String toIndex(HttpServletRequest request,Model mm){
        if (request.getSession().getAttribute("dbuser")!=null){
           Users dbuser = (Users) request.getSession().getAttribute("dbuser");
            mm.addAttribute("user",dbuser);
            List<Logo> logos = logoService.queryLogo();
            System.out.println(logos.size());
            mm.addAttribute("logo",logos);
            System.out.println(dbuser);
        }
        return  "index2";
    }
    @RequestMapping("/toAdminIndex")
    public String toAdminIndex(){
         return  "index";
    }

}
