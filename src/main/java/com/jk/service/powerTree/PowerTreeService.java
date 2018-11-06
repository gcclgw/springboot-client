package com.jk.service.powerTree;

import com.jk.model.power.PowerTree;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface PowerTreeService {


    /*List<PowerTree> getParent(Integer pid);*/

   /* List<PowerTree> getUserPowerChildrenList(String userId);*/

    /*List<PowerTree> getTreeNavCommon();*/

    List<PowerTree> getNode(String id,String userId);
}
