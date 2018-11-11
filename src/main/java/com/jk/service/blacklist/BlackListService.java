package com.jk.service.blacklist;

import com.jk.model.blacklist.BlackList;

import java.util.List;

public interface BlackListService {
    List<BlackList> queryByUid(String uphone);
}
