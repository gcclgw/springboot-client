package com.jk.controller.logo;

import com.jk.model.logo.Logo;
import com.jk.service.logo.LogoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("logo")

public class LogoController {
    @Autowired
    private LogoService logoService;

    @RequestMapping("toLogoPage")
    public  String toLogoPage(Model mm){
        List<Logo> logos = logoService.queryLogo();
        mm.addAttribute("logo",logos);
        return "/logo/logoPage";
    }

}
