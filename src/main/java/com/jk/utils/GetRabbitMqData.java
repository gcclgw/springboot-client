package com.jk.utils;

import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

@Component
@RabbitListener(queues = "regUser")
public class GetRabbitMqData {

    @RabbitHandler
    public void getMsg(String msg){
        //System.out.println(msg);

      /*  JSONObject jb = JSONArray.parseObject(msg);
        Integer id = jb.getInteger("id");*/

        System.out.println("----4564556456456----"+msg);

    }


}
