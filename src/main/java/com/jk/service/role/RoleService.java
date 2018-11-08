package com.jk.service.role;

import com.jk.model.power.PowerTree;
import com.jk.model.role.Role;
import com.jk.utils.ResultPage;

import java.util.LinkedHashMap;
import java.util.List;

public interface RoleService {
    ResultPage selectRoleList(Role role);

    List<Role> findRolePowerById(String rid);

    List<LinkedHashMap<String, String>> findPower(PowerTree power);

    void saveRolePower(String rid, String[] split);
}
