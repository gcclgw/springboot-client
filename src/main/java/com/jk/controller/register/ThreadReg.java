package com.jk.controller.register;

import com.jk.model.users.Users;
import com.jk.utils.ConstantsConf;
import com.jk.utils.HttpUtils;
import com.jk.utils.Md5Util;
import org.apache.commons.lang.StringUtils;
import org.springframework.amqp.core.AmqpTemplate;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

public class ThreadReg implements Runnable {
    private AmqpTemplate amqpTemplate;

    private Users user;

    private  String random;

   public ThreadReg(AmqpTemplate amqpTemplate,Users user,String random){
       this.amqpTemplate = amqpTemplate;
       this.user = user;

       this.random = random;
   }


    @Override
    public void run() {
        getPhone(user,random);
    }


    public Boolean getPhone(Users user,String random) {

        System.out.println(user.getPhone());


        if(StringUtils.isNotEmpty(user.getPhone())) {
            SimpleDateFormat sim = new SimpleDateFormat("yyyyMMddHHmmss");
            HashMap<String, Object> params = new HashMap<String, Object>();
            params.put("accountSid", ConstantsConf.ACCOUNTSID);
            params.put("templateid", ConstantsConf.TEMPLATEID);
            params.put("param", random);
            params.put("to", user.getPhone());
            String timestamp= sim.format(new Date());
            params.put("timestamp", timestamp);
            String sign= Md5Util.getMd532(ConstantsConf.ACCOUNTSID+ConstantsConf.AUTH_TOKEN+timestamp);
            params.put("sig", sign);
            String post = HttpUtils.post(ConstantsConf.SMS_URL, params);
            amqpTemplate.convertAndSend("regUser",post);

            return true;
        }
        return false;
    }





}
