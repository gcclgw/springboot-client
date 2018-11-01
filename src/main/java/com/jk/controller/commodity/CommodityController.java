package com.jk.controller.commodity;

import com.alibaba.dubbo.common.json.JSONObject;
import com.jk.model.commodity.Categorysecond;
import com.jk.model.commodity.Product;
import com.jk.service.commodity.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("comm")
public class CommodityController {

    @Autowired
    private CommodityService commodityService;


    @RequestMapping("toCommodity")
    public String toCommodity(Model model){
        List<Categorysecond> categorysecondList = commodityService.querycsid();
        model.addAttribute("list", categorysecondList);
        return "commodity/commoditylist";
    }

    @RequestMapping("queryCommodity")
    @ResponseBody
    public List<Product> queryCommodity(){
        List<Product> productList = commodityService.queryCommodity();
        return productList;
    }

    @RequestMapping("deleteCommodity")
    @ResponseBody
    public void deleteCommodity(String pid){
        commodityService.deleteCommodity(pid);
    }


    @RequestMapping("addCommodity")
    @ResponseBody
    public void addCommodity(Product product){
        commodityService.addCommodity(product);
    }


    @RequestMapping("toupdate")
    public String toupdate(Integer pid,Model model){
        Product pro = commodityService.toupdate(pid);
        List<Categorysecond> categorysecondList = commodityService.querycsid();
        model.addAttribute("list", categorysecondList);
        model.addAttribute("pro", pro);
        model.addAttribute("pid", pid);
        return "commodity/updatecommodity";
    }


    @RequestMapping("updateCommodity")
    @ResponseBody
    public void updateCommodity(Product product){
        commodityService.updateCommodity(product);
    }


    @RequestMapping("totjsx")
    public String totjsx(Integer pid,Model model){
        model.addAttribute("pid", pid);
        return "commodity/tjsx";
    }


    @RequestMapping("addtjsx")
    @ResponseBody
    public void addtjsx(Integer pid,String cname,String cvalue){
        commodityService.addtjsx(pid,cname,cvalue);
    }

}
