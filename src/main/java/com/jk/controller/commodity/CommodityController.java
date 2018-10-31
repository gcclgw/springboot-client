package com.jk.controller.commodity;

import com.jk.model.commodity.Product;
import com.jk.service.commodity.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("comm")
public class CommodityController {

    @Autowired
    private CommodityService commodityService;


    @RequestMapping("toCommodity")
    public String toCommodity(){
        return "commodity/commoditylist";
    }

    public List<Product> queryCommodity(){
        List<Product> list = commodityService.queryCommodity();
        return list;
    }
}
