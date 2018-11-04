package com.jk.controller.bers;

import com.alibaba.dubbo.common.json.JSONObject;
import com.jk.model.mans.Userx;
import com.jk.model.user.User;
import com.jk.service.bers.BersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.swing.*;
import java.util.List;

@Controller
@RequestMapping("bers")
public class BersController {
    @Autowired
    private BersService bersService;
    //跳转
    @RequestMapping("/queryBers")
    public String querymans(){
        return  "bersx/BersList";
    }


    //查询
    @RequestMapping("bersSelect")
    @ResponseBody
    public List<Userx> bersSelect(){
        List<Userx> list=bersService.bersSelect();
        return list;
    }

    //删除
    @RequestMapping("delDers")
    @ResponseBody
    public void delDers(String uid){
        bersService.delDers(uid);

    }

    //修改
    @RequestMapping("updateBers")
    public String updateBers(String uid, Model mm){
        System.out.println("********************"+uid);
        Userx list=bersService.updateBers(uid);
        System.out.println(list+"***********************");
        mm.addAttribute("user",list);
        return  "bersx/berShow";

    }


    @RequestMapping("updateAdds")
    public String updateAdds(Userx u){
        bersService.updateAdds(u);
        return "bersx/BersList";

    }

    //会员升级跳转
    @RequestMapping("/queryMen")
    public String queryMen(){

        return  "bersx/MemList";
    }
    //查询非会员
    @RequestMapping("memSelect")
    @ResponseBody
    public List<Userx> memSelect(){
        List<Userx> list=bersService.memSelect();
        return list;
    }
    //升级为会员
    @RequestMapping("updateMen")
    public String updateMen(String uid){
        bersService.updateMen(uid);
        return "bersx/BersList";
    }



}
