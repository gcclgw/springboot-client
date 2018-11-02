package com.jk.controller.business;


import com.jk.model.business.Business;
import com.jk.service.business.BussinessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("business")
public class BusinessController {
  @Autowired
  private BussinessService bussinessService;

    @RequestMapping("/toBusiness")
    public String toIndex(){
        return  "/business/show";
    }
    @RequestMapping("/toaddbus")
    public String toaddbus(){
        return  "/business/addBus";
    }

    @RequestMapping("/queryBusiness")
    @ResponseBody
    public List<Business> queryBusiness(){
        return  bussinessService.queryBusiness();
    };

    @RequestMapping("deleteBus")
    @ResponseBody
      public void deleteBus(Integer qid){
      bussinessService.deleteBus(qid);
    }

    @RequestMapping("addBus")
    @ResponseBody
    public  void addBus(Business business){
        bussinessService.addBus(business);
    }


}
