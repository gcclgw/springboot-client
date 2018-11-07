package com.jk.controller.adverSeat;


import com.jk.model.adverseat.Adverseat;
import com.jk.service.adverSeat.AdverSeatService;
import com.jk.utils.ResultPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("adverseat")
public class AdverSeatController {

    @Autowired
    private AdverSeatService adverSeatService;

    /**
     * 查询广告
     */
    @RequestMapping("selectAdverSeatList")
    @ResponseBody
    ResultPage selectAdverSeatList(Adverseat adverseat){
        return adverSeatService.selectAdverSeatList(adverseat);
    }


}
