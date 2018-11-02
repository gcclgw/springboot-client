package com.jk.controller.mongodbLog;

import com.jk.aop.LogBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("mongo")
public class MongoController {
    @Autowired
    private MongoTemplate mongoTemplate;

    //树的跳转路径
    @RequestMapping("toMongodbLog")
    public String toMongodbLog(){
        return "/mongodbLog/mongodbLog";
    }


    @RequestMapping("findLog")
    @ResponseBody
    public List findLog(){
        try {
            Query query = new Query();
            List<LogBean> find = mongoTemplate.find(query.with(new Sort(Sort.Direction.DESC,"methDate")),LogBean.class);
            return find;
        } catch (Exception e) {
            return null;
        }

    }
}
