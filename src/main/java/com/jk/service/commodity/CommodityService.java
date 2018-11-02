package com.jk.service.commodity;

import com.jk.model.commodity.Categorysecond;
import com.jk.model.commodity.Product;

import java.util.List;

public interface CommodityService {

    List<Product> queryCommodity();

    void deleteCommodity(String pid);

    List<Categorysecond> querycsid();

    void addCommodity(Product product);

    Product toupdate(Integer pid);

    void updateCommodity(Product product);

    void addtjsx(Integer pid, String cname, String cvalue);
}
