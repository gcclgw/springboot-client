package com.jk.controller.adver;


import com.jk.model.adver.Adver;
import com.jk.service.adver.AdverService;
import com.jk.utils.ResultPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("adver")
public class AdverController {

    @Autowired
    private AdverService adverService;

    /**
     * 查询广告
     */
    @RequestMapping("selectAdverList")
    @ResponseBody
    ResultPage selectAdverList(Adver adver){
        return adverService.selectAdverList(adver);
    }

    /**
     * 新增广告
     */
    @RequestMapping("addAdver")
    @ResponseBody
    public String addAdver(Adver adver){
        adverService.addAdver(adver);
        return "{}";
    }






}
