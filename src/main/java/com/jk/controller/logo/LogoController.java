package com.jk.controller.logo;

import com.jk.model.logo.Logo;
import com.jk.service.logo.LogoService;
import com.jk.utils.OSSClientUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("logo")

public class LogoController {
    @Autowired
    private LogoService logoService;

    @RequestMapping("/toLogoPage")
    public  String toLogoPage(Model mm){
        List<Logo> logos = logoService.queryLogo();
        System.out.println(logos.size());
        mm.addAttribute("logo",logos);
        return "/logo/logoPage";
    }

    @RequestMapping("queryLogo")
    @ResponseBody
    public  void queryLogo(Model mm){
        List<Logo> logos = logoService.queryLogo();
        System.out.println(logos.size());
        mm.addAttribute("logo",logos);
    }


    //修改logo
    @RequestMapping(value="/headImgUpload", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> headImgUpload(HttpServletRequest request, @RequestParam("image") MultipartFile image) throws Exception {
        Map<String, Object> value = new HashMap<String, Object>();
        value.put("success", true);
        value.put("errorCode", 0);
        value.put("errorMsg", "");
        OSSClientUtil oss = new OSSClientUtil();
        String fileName = oss.uploadImg2Oss(image);
        String imgUrl = oss.getImgUrl(fileName);
        System.out.println("newUrl"+fileName);
        System.out.println("imgUrl"+imgUrl);
        value.put("fileName", fileName);
        value.put("imgUrl",imgUrl);
        return value;
    }


    @RequestMapping("updateLogo")
    @ResponseBody
    public  void  updateLogo(String logimg){
        logoService.updateLogo(logimg);
    }


}
