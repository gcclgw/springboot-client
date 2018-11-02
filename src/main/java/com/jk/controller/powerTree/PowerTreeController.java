package com.jk.controller.powerTree;


import com.jk.model.power.PowerTree;
import com.jk.service.powerTree.PowerTreeService;
import com.jk.utils.ConstantsConf;
import com.jk.utils.SessionUserUtil;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("powertree")
public class PowerTreeController {

    @Autowired
    private PowerTreeService powerTreeService;

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    @RequestMapping("getTreeNavCommon")
    @ResponseBody
    public  List<PowerTree> getTreeNavCommon(){
        return  powerTreeService.getTreeNavCommon();
    }


    /*@RequestMapping("getTreeNavCommon")
    @ResponseBody
    public List<PowerTree> selectPowerTree(HttpServletRequest request) {
        //获取用户id
        String userId = SessionUserUtil.getUserId(request);
        String cachekey = ConstantsConf.NAV_CACHE + userId;
        String navcaChe = redisTemplate.opsForValue().get(cachekey);
        if (null == navcaChe) {
            //查询出用户的权限的最子级的节点
            List<PowerTree> childrenList = powerTreeService.getUserPowerChildrenList(userId);
            //构建总返回集合
            ArrayList<PowerTree> result = new ArrayList<>();
            //所有节点放入到总返回集合中
            childrenList.forEach((s) -> {

                result.add(s);
            });
            //反递归查询出父级节点
            getParent(childrenList, result);
            //存放30分钟
            //redisTemplate.opsForValue().set(cachekey,JsonStringEncoder,30, TimeUnit.MINUTES);
            //返回结果集
            return result;
        } else {
            //将json数据转换为list集合数据
            List<PowerTree> parseArray = JSONArray.parseArray(navcaChe, PowerTree.class);
            return parseArray;
        }


    }

    private void getParent(List<PowerTree> childrenList, ArrayList<PowerTree> result) {
        for (PowerTree powerTree : childrenList) {
            result.add(powerTree);
            List<PowerTree> parent =powerTreeService.getParent(powerTree.getPid());
            if (parent != null) {
                powerTree.setLeaf(false);
                powerTree.setSelectable(false);
                powerTree.setChildren(parent);
                //result.add(parent);
                ArrayList<PowerTree> parents = new ArrayList<>();
                //parents.add(parent);
                getParent(parents, result);
            } else {
                powerTree.setSelectable(true);
                powerTree.setLeaf(true);
            }
        }

    }*/

}
