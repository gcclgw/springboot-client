package com.jk.controller.user;

import com.alibaba.fastjson.JSONArray;
import com.jk.model.role.Role;
import com.jk.model.user.User;
import com.jk.service.user.UserService;
import com.jk.utils.ResultPage;
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

@Controller
@RequestMapping("user")
public class UserController {


    @Autowired
    private UserService userService;

    @RequestMapping("/toIndex")
    public String toIndex(){
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







}
