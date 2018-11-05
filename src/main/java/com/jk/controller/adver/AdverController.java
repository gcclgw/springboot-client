package com.jk.controller.adver;


import com.alibaba.fastjson.JSONArray;
import com.jk.model.adver.Adver;
import com.jk.model.user.User;
import com.jk.service.adver.AdverService;
import com.jk.utils.OSSClientUtil;
import com.jk.utils.ResultPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    /**
     * 根据用户id回显角色
     */
    @RequestMapping("dialogAdverSeat")
    ModelAndView dialogRole(String adverid) {
        List<Adver> list = adverService.findAdveSrById(adverid);
        Map<String,Object> map = new HashMap<>();
        map.put("adverid", adverid);
        map.put("adverSeatList", JSONArray.toJSON(list));
        return new ModelAndView("adver/dialogAdverSeat",map);
    }

    /**
     *
     * @param userId
     * @param roleIds
     */
    /*@RequestMapping("saveUserRole")
    @ResponseBody
    void SaveUserRole(String userId,String roleIds){
        userService.SaveUserRole(userId,roleIds.split(","));
    }*/




    /*添加图片*/
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






}
