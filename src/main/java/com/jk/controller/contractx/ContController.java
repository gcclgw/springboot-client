package com.jk.controller.contractx;

import com.jk.model.cont.Contx;
import com.jk.model.mans.Userx;
import com.jk.service.contractx.ContService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("cont")
public class ContController {
    @Autowired
    private ContService contService;

@RequestMapping("/queryContx")
 public String queryContx(){

     return "contx/ContxList";
 }
    //查询
    @RequestMapping("queryCont")
    @ResponseBody
    public List<Contx> queryCont(){
        List<Contx> list=contService.queryCont();
        return list;
    }
//新增跳转
@RequestMapping("/queryPoi")
public String queryPoi(){

    return "contx/ContxAdd";
}
//新增
@RequestMapping("poixAdd")
public String poixAdd(Contx contx){
    contService.poixAdd(contx);
  return "contx/ContxList";
}


}
