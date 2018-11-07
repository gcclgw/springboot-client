package com.jk.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Modifier;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Aspect
@Component
public class WebLogAspect {
    @Autowired
    private MongoTemplate mongoTemplate;


    private Logger logger = LoggerFactory.getLogger(getClass());

    @Pointcut("execution(public * com.jk.service..*.*.*(..))")
    public void webLog(){

    }

    @Before("webLog()")
    public void doBefore(JoinPoint joinPoint){
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        // 记录下请求内容
        logger.info("URL : " + request.getRequestURL().toString());
        logger.info("HTTP_METHOD : " + request.getMethod());
        logger.info("IP : " + request.getRemoteAddr());
        Enumeration<String> enu = request.getParameterNames();
        while (enu.hasMoreElements()) {
            String name = (String) enu.nextElement();
            logger.info("name:{},value:{}", name, request.getParameter(name));
        }
    }


    @AfterReturning(returning = "ret", pointcut = "webLog()")
    public void doAfterReturning(Object ret) throws Throwable {
        // 处理完请求，返回内容
        logger.info("RESPONSE : " + ret);
    }


    //后置最终通知,final增强，不管是抛出异常或者正常退出都会执行
    @After("webLog()")
    public void after(JoinPoint joinPoint) throws ParseException {

        LogBean logBean = new LogBean();
        Object[] args = joinPoint.getArgs();
        String cs="";
        for (int i = 0; i < args.length; i++) {
            cs+=("参数:" + args[i]);
        }
        logBean.setUserId(UUID.randomUUID().toString());//uuid                                          setUserId
        logBean.setClassName(joinPoint.getSignature().getDeclaringTypeName());//目标简单类名  setClassName
        logBean.setMethodName(joinPoint.getSignature().getName());//方法名                               setMethodName
        //System.out.println("类名："+joinPoint.getSignature().getDeclaringTypeName()+"方法名"+logBean.getMethodName());
        //解决时间
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = sim.format(new Date());
        logBean.setCreateTime(format);//                                                            setCreateTime
        logBean.setParam(cs);//参数属性
        logBean.setType(Modifier.toString(joinPoint.getSignature().getModifiers()));//声明的类型           type

        mongoTemplate.save(logBean);
    }


}
