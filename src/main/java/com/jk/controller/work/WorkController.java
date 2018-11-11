package com.jk.controller.work;

import com.jk.model.work.Work;
import com.jk.service.work.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("work")
public class WorkController {
    @Autowired
    private WorkService workService;

    @RequestMapping("toWork")
    public  String toWork(){
        return "/work/showMyWork";
    }


    @RequestMapping("toDealMode")
    public  String toDealMode(Integer htid, Model mm){
       mm.addAttribute("htid",htid);
        return "/work/showDealMode";
    }


    @RequestMapping("queryWork")
    @ResponseBody
    public List<Work> queryWork(){
        return workService.queryWork();
    }
    @RequestMapping("updateJy")
    @ResponseBody
    public void updateJy(Work work){

        workService.updateWork(work);
        workService.updateContJy(work.getHtid());
    }
    @RequestMapping("updateXy")
    @ResponseBody
    public void updateXy(Work work){

        workService.updateWork(work);
        workService.updateContXy(work.getHtid());
    }
    @RequestMapping("updateWork")
    @ResponseBody
    public void updateWork(Work work){

        workService.updateWork(work);

    }

}
