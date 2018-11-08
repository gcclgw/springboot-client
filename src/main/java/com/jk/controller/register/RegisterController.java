package com.jk.controller.register;

import com.jk.controller.login.LoginController;
import com.jk.model.blacklist.BlackList;
import com.jk.model.users.Users;
import com.jk.service.blacklist.BlackListService;
import com.jk.service.register.RegisterService;
import com.jk.utils.ConstantsConf;
import com.jk.utils.HttpUtils;
import com.jk.utils.Md5Util;
import com.jk.utils.VerificationCode;
import org.apache.commons.lang.StringUtils;
import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Controller
@RequestMapping("reg")
public class RegisterController {
    private Logger logger = LoggerFactory.getLogger(RegisterController.class);

    @Autowired
    private RegisterService registerService;

    @Autowired
    private BlackListService blackListService;

    @Autowired
    private AmqpTemplate amqpTemplate;

    ExecutorService cachedThreadPool = Executors.newCachedThreadPool();

    @RequestMapping("/toregPage")
    public  String toregPage(){
        return "/stage/reg";
        //return "area";
    }

    @RequestMapping("/toarea")
    public  String toarea(){

        return "/stage/area";
    }



    @RequestMapping("/regUser")
    @ResponseBody
    public  int regUser(HttpServletRequest request,Users users){
       /* HttpSession session = request.getSession();
        String sysImgCode = "";
        Object imageCode = session.getAttribute("imageCode");
        if (null != imageCode && imageCode.equals(users.getCode())) {
            return registerService.regUser(users);
        }else{
            return 3;
        }*/

        System.out.println(users.getCode());
        String random = request.getSession().getAttribute("random").toString();
        System.out.println("短信验证码："+random);
        if (random.equals(users.getCode())) {
            return registerService.regUser(users);

        }else {
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


    @RequestMapping("getPhone")
    @ResponseBody
    public int getPhone(Users user,HttpServletRequest request) {
        List<BlackList> blackLists = blackListService.queryByUid(user.getPhone());

        if (blackLists.size()>0){
            return 1;
        }else {
            String random = "";
            for (int i = 0; i < 6; i++) {
                random = random + (int) (Math.random() * 9);
            }

            request.getSession().setAttribute("random", random);
            cachedThreadPool.execute(new ThreadReg(amqpTemplate, user, random));
            return 2;
        }

    }



    @RequestMapping(value="/getareaName", produces = "application/json; charset=utf-8")
    @ResponseBody
    public String getareaName(String location){
        //创建httpcliet对象
        CloseableHttpClient httpClient = HttpClients.createDefault();
        //创建参数集合
        List<NameValuePair> params =  new ArrayList<NameValuePair>();
        //将参数添加到集合中
        params.add(new BasicNameValuePair("key","9f465f6ada902a8b21dfe618fa821cb9"));
        params.add(new BasicNameValuePair("output","json"));
        params.add(new BasicNameValuePair("radius","1000"));
        params.add(new BasicNameValuePair("extensions","all"));
        params.add(new BasicNameValuePair("location",""+location));
        //定义一个转换编码字符集
        String paramsStr="";
        //接收查询数据
        String userJson="";
        //定义一个响应
        //1、定义一个客户端
        //2、定义一个方法（GET，POST等）
        //3,、客户端执行这个方法并返回内容
        CloseableHttpResponse response = null;

        //转换编码集
        try {
            paramsStr = EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8));
            //定义一个httpGet方法,
            HttpPost httpPost = new HttpPost("https://restapi.amap.com/v3/geocode/regeo?"+paramsStr);
	    	    		 /* httpGet.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1;"
	    							+ " Win64; x64; rv:50.0) Gecko/20100101 Firefox/50.0");
	    				  httpGet.setHeader("Accept", "application/json");

	    				  httpGet.setHeader("Accept-Encoding", "gzip, deflate");
	    				  httpGet.setHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
	    				  RequestConfig config = RequestConfig.custom()
	    							.setConnectTimeout(1000)  		//设置链接超时的时间1秒钟
	    							.setSocketTimeout(1000) 		//设置读取超时1秒钟
	    							.build(); 						//RequestConfig静态方法  setProxy  设置代理
	    					httpGet.setConfig(config);*/

            //响应httpGet请求
            response = httpClient.execute(httpPost);

            HttpEntity entity = response.getEntity();

            userJson = EntityUtils.toString(entity,"UTF-8");
            System.out.println(userJson);
        } catch (org.apache.http.ParseException | IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{

            try {
                response.close();
                httpClient.close();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        return userJson;


    }


}
