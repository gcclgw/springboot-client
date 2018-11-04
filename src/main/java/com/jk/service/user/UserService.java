package com.jk.service.user;

import com.jk.model.role.Role;
import com.jk.model.user.User;
import com.jk.utils.ResultPage;

import java.util.LinkedHashMap;
import java.util.List;

public interface UserService {
    ResultPage selectUserList(User user);

    List<User> findUserRoleById(String userId);

    ResultPage findRole(Role role);

    void SaveUserRole(String userId, String[] split);
}
