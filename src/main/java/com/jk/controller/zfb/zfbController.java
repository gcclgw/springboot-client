package com.jk.controller.zfb;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("csy")
public class zfbController {

    @RequestMapping("zfb1")
    public  String toZf1(){
        return "alipay/zfb1";
    }
    @RequestMapping("zfb2")
    public  String toZf2(){
        return "alipay/zfb2";
    }
}
