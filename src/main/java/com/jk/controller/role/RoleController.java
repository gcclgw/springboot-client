package com.jk.controller.role;

import com.alibaba.fastjson.JSONArray;
import com.jk.model.power.PowerTree;
import com.jk.model.role.Role;
import com.jk.service.role.RoleService;
import com.jk.utils.ResultPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping("selectRoleList")
    @ResponseBody
    ResultPage selectRoleList(Role role) {
        return roleService.selectRoleList(role);
    }

    @RequestMapping("dialogPower")
    ModelAndView dialogRole(String rid) {
        List<Role> list = roleService.findRolePowerById(rid);
        Map<String,Object> map = new HashMap<>();
        map.put("rid", rid);
        map.put("powerList", JSONArray.toJSON(list));
        return new ModelAndView("power/dialogPower",map);
    }

    @RequestMapping("findPower")
    @ResponseBody
    List<LinkedHashMap<String, String>> findPower(PowerTree power) {
        return roleService.findPower(power);
    }

    @RequestMapping("saveRolePower")
    @ResponseBody
    void saveRolePower(String rid,String pids){
        roleService.saveRolePower(rid,pids.split(","));
    }



}
