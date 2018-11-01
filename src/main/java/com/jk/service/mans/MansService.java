package com.jk.service.mans;


import com.jk.model.mans.Userx;
import com.jk.model.user.User;

import java.util.List;

public interface MansService {
    List<Userx> queryuser();

    void deleteMans(String uid);

    Userx updateMans(String uid);


    void updateAdd(Userx u);
}
