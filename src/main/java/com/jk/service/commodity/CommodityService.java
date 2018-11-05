package com.jk.service.commodity;


import com.jk.model.commodity.Categorysecond;
import com.jk.model.commodity.Product;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface CommodityService {

    List<Product> queryCommodity();

    void deleteCommodity(String pid);

    List<Categorysecond> querycsid();

    void addCommodity(Product product);

    Product toupdate(Integer pid);

    void updateCommodity(Product product);

    void addtjsx(Integer pid, String cname, String cvalue);

    List<Product> queryByStatus();

    void updateStatus(Integer pid);

    String updateHead(MultipartFile image, long userId);

    List<Product> querySell();

    List<Product> queryDate();

    List<Product> thePrimaryQuery(String cid,String csid);
}
