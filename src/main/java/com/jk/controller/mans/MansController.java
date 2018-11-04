package com.jk.controller.mans;

import com.alibaba.dubbo.common.json.JSONObject;
import com.jk.model.mans.Userx;
import com.jk.model.user.User;
import com.jk.service.mans.MansService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.swing.*;
import java.util.List;

@Controller
@RequestMapping("mans")
public class MansController {
@Autowired
    private MansService mansService;


//跳转
    @RequestMapping("/querymans")
    public String querymans(){
        return  "mansx/MansList";
    }

//查询
    @RequestMapping("queryuser")
    @ResponseBody
    public List<Userx> querytaxs(){
        List<Userx> list=mansService.queryuser();
        return list;
    }
    //删除
@RequestMapping("deleteMans")
@ResponseBody
public void deleteMans(String uid){
    mansService.deleteMans(uid);

}

//修改
@RequestMapping("updateMans")
public String updateMans(String uid,Model mm){
    System.out.println("********************"+uid);
    Userx list=mansService.updateMans(uid);
    System.out.println(list+"***********************");
    mm.addAttribute("user",list);
    return  "mansx/ManShow";

}

@RequestMapping("updateAdd")
public String updateAdd(Userx u){
       mansService.updateAdd(u);
        return "mansx/MansList";

}



}
