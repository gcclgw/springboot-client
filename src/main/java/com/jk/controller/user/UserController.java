package com.jk.controller.user;

import com.alibaba.fastjson.JSONArray;
import com.jk.model.adver.Adver;
import com.jk.model.role.Role;
import com.jk.model.user.User;
import com.jk.service.adver.AdverService;
import com.jk.service.user.UserService;
import com.jk.utils.ResultPage;
import org.springframework.beans.factory.annotation.Autowired;
import com.jk.model.logo.Logo;
import com.jk.model.category.Category;
import com.jk.model.commodity.Product;
import com.jk.model.users.Users;
import com.jk.service.logo.LogoService;
import com.jk.service.category.CategoryService;
import com.jk.service.commodity.CommodityService;
import jdk.internal.org.objectweb.asm.Handle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {


    @Autowired
    private UserService userService;

    @Autowired
    private LogoService logoService;


    @Autowired
    private CommodityService commodityService;
    @Autowired
    private CategoryService categoryService;


    @RequestMapping("/toIndex")
    public String toIndex(HttpServletRequest request,Model mm){
        if (request.getSession().getAttribute("dbuser")!=null){
            Users dbuser = (Users) request.getSession().getAttribute("dbuser");
            mm.addAttribute("user",dbuser);

            System.out.println(dbuser);
        }
        List<Logo> logos = logoService.queryLogo();
        System.out.println(logos.size());
        mm.addAttribute("logo",logos);
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



        /**
         * 查询用户表
         */
        @RequestMapping("selectUserList")
        @ResponseBody
        ResultPage selectUserList(User user) {
            return userService.selectUserList(user);
        }

        /**
         * 根据用户id回显角色
         */
        @RequestMapping("dialogRole")
        ModelAndView dialogRole(String userId) {
            List<User> list = userService.findUserRoleById(userId);
            Map<String,Object> map = new HashMap<>();
            map.put("userId", userId);
            map.put("roleList", JSONArray.toJSON(list));
            return new ModelAndView("role/dialogRole",map);
        }

        /**
         * 角色表
         */
        @RequestMapping("findRole")
        @ResponseBody
        ResultPage findRole(Role role) {
            return userService.findRole(role);
        }


        /**
         * 给用户绑角色
         *
         */
        @RequestMapping("saveUserRole")
        @ResponseBody
        void SaveUserRole(String userId,String roleIds){
            userService.SaveUserRole(userId,roleIds.split(","));
        }


        /*跳转到转盘页面*/
    @RequestMapping("toZp")
        public String toZp(HttpServletRequest request,Model mm){
        if (request.getSession().getAttribute("dbuser")!=null){
            Users dbuser = (Users) request.getSession().getAttribute("dbuser");
            mm.addAttribute("user",dbuser);

            System.out.println(dbuser);
        }
            return "zhuanpan/zp";
        }



    /*红包获得积分*/
    @RequestMapping("addJf")
    public String addJf(Integer awards, Model model, HttpServletRequest request, HttpServletResponse response){
        //登录判断
        if (request.getSession().getAttribute("dbuser")!=null){
            Users dbuser = (Users) request.getSession().getAttribute("dbuser");
            model.addAttribute("user",dbuser);
            System.out.println(dbuser);
        }

        //添加积分
        Users dbuser = (Users) request.getSession().getAttribute("dbuser");
        Integer uid = dbuser.getUid();
        System.out.println("awards==================="+awards);
        commodityService.addJf(awards,uid);
        return "redirect:/user/toIndex";
    }



}
