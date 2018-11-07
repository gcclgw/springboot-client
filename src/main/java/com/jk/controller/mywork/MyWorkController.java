package com.jk.controller.mywork;

import com.jk.model.mywork.Contxract;
import com.jk.model.mywork.Work;
import com.jk.service.mywork.MyWorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("mywork")
public class MyWorkController {

    @Autowired
    private MyWorkService myWorkService;

    //跳转  任务展示
    @RequestMapping("toShowMyWork")
    private String toShowMyWork(){
        return "mywork/showMyWork";
    }

    @RequestMapping("queryMyWorkByTime")
    @ResponseBody
    private List<Contxract> queryMyWorkByTime(){

        return myWorkService.queryMyWorkByTime();
    }

    @RequestMapping("toDealMode")
    private String toDealMode(Model model, Contxract contxract){
        model.addAttribute("contxract",contxract);
        return "mywork/showDealMode";
    }

    @RequestMapping("upDhwjt")
    @ResponseBody
    public void upDhwjt(Contxract contxract){
        myWorkService.upDhwjt(contxract);
    }
    @RequestMapping("upJy")
    @ResponseBody
    public void upJy(Contxract contxract,Work work){
        myWorkService.upJy(contxract);
        myWorkService.addText(work,contxract);
    }
    @RequestMapping("upXy")
    @ResponseBody
    public void upXy(Contxract contxract,Work work){
        myWorkService.upXy(contxract);
    }

    @RequestMapping("upZkl")
    @ResponseBody
    public void upZkl(Contxract contxract,Work work){
        myWorkService.upZkl(contxract);
        myWorkService.addText(work,contxract);
    }

}
