package com.jk.service.business;


import com.jk.model.business.Business;

import java.util.List;


public interface BussinessService {
    List<Business> queryBusiness();
    void deleteBus(Integer qid);
    void addBus(Business business);

}
