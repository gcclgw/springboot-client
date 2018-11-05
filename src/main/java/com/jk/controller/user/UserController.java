package com.jk.controller.user;

import com.jk.model.category.Category;
import com.jk.model.commodity.Product;
import com.jk.model.users.Users;
import com.jk.service.category.CategoryService;
import com.jk.service.commodity.CommodityService;
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
    private CommodityService commodityService;
    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/toIndex")
    public String toIndex(HttpServletRequest request,Model mm){
        if (request.getSession().getAttribute("dbuser")!=null){
           Users dbuser = (Users) request.getSession().getAttribute("dbuser");
            mm.addAttribute("uid",dbuser.getUid());
        }

        List<Product> pro= commodityService.querySell();
        mm.addAttribute("pro", pro);
        List<Category> category = categoryService.querycategory();
        mm.addAttribute("category", category);
        List<Product> qDate = commodityService.queryDate();
        mm.addAttribute("dd", qDate);
        return  "index2";
    }




    @RequestMapping("/toAdminIndex")
    public String toAdminIndex(){
         return  "index";
    }
}
