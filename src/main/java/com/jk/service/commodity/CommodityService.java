package com.jk.service.commodity;


import com.jk.model.ResultPage;
import com.jk.model.commodity.Categorysecond;
import com.jk.model.commodity.CommodityProperty;
import com.jk.model.commodity.Product;
import com.jk.model.orders.Orders;
import com.jk.model.users.Users;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
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

    /**
     * 前端分页
     * @param cid
     * @param csid
     * @return
     */
    ResultPage limitProduct(Product product,String cid, String csid);

    List<Product> queryDetails(String pid);


    List<CommodityProperty> queryCommodityProperty(String pid);

    void updateIs_Hot(String pid);

    List<Product> queryShopIntegral();

    void addOrders(Product product, Integer count, Integer uid, Orders orders);

    void addOrdersitem(Product product, Integer count, Orders orders);

    Product selectProduct(Orders orders);

    Users selectUsers(Integer uid);

    void updateOrder(Orders orders);

    void updateUsers(Integer ssss,Integer userid);

    void addJf(Integer awards,Integer uid);
}
