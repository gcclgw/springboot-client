package com.jk.controller.commodity;

import com.jk.service.commodity.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("comm")
public class CommodityController {

    @Autowired
    private CommodityService CommodityService;

}
