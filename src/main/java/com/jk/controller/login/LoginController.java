package com.jk.controller.login;


import com.jk.model.user.User;
import com.jk.service.login.LoginService;
import com.jk.utils.VerificationCode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("login")
public class LoginController {

    private Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private LoginService loginService;

    @RequestMapping("/login")
    @ResponseBody
    public Map<String,Object> login(HttpServletRequest request, User user){
        HttpSession session = request.getSession();
        String sysImgCode = "";
        Object imageCode = session.getAttribute("imageCode");
        if (null != imageCode) {
            sysImgCode = imageCode.toString();
        }
        user.setSysImgCode(sysImgCode);
        Map<String, Object> map = loginService.login(user);
        if (map.get("flag").equals("4")) {
            session.setAttribute("userInfo", map.get("userInfo"));
        }
        return map;
    }

    @RequestMapping("verificationCode")
    public void getVerify(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("image/jpeg"); //设置相应类型,告诉浏览器输出的内容为图片
            response.setHeader("Pragma", "No-cache"); //设置响应头信息，告诉浏览器不要缓存此内容
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expire", 0);
            VerificationCode verificationCode = new VerificationCode();
            verificationCode.doPost(request, response); //输出验证码图片方法
        } catch (Exception e) {
            logger.error("获取验证码失败！！", e);
        }
    }



}
