package com.jk.controller.check;

import com.jk.model.commodity.Product;
import com.jk.service.check.CheckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("check")
public class CheckController {

    @Autowired
    private CheckService checkService;

    @RequestMapping("tocheck")
    public  String tocheck(){
        return  "/check/checkList";
    }

    @RequestMapping("/queryVipCheck")
    @ResponseBody
    public List<Product> queryVipCheck(){
        return checkService.queryVipProduct();
    }
    @RequestMapping("/updatePro")
    @ResponseBody
    public void updatePro(Integer pid){
         checkService.updatePro(pid);
    }
}
