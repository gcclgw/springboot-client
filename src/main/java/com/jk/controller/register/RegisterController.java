package com.jk.controller.register;

import com.jk.controller.login.LoginController;
import com.jk.model.users.Users;
import com.jk.service.register.RegisterService;
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

@Controller
@RequestMapping("reg")
public class RegisterController {
    private Logger logger = LoggerFactory.getLogger(RegisterController.class);

    @Autowired
    private RegisterService registerService;

    @RequestMapping("toregPage")
    public  String toregPage(){
        return "reg";
    }
    @RequestMapping("regUser")
    @ResponseBody
    public  int regUser(HttpServletRequest request,Users users){
        HttpSession session = request.getSession();
        String sysImgCode = "";
        Object imageCode = session.getAttribute("imageCode");
        if (null != imageCode && imageCode.equals(users.getCode())) {
            return registerService.regUser(users);
        }else{
            return 3;
        }



    }


    @RequestMapping("verificationCode")
    @ResponseBody
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
