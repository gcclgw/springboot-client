package com.jk.controller.commodity;

import com.jk.model.ResultPage;
import com.jk.model.category.Category;
import com.jk.model.commodity.Categorysecond;
import com.jk.model.commodity.CommodityProperty;
import com.jk.model.commodity.Product;
import com.jk.model.logo.Logo;
import com.jk.model.users.Users;
import com.jk.service.categorysecond.CategorysecondService;
import com.jk.service.commodity.CommodityService;
import com.jk.service.logo.LogoService;
import com.jk.utils.OSSClientUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("comm")
public class CommodityController {

    @Autowired
    private CommodityService commodityService;

    @Autowired
    private CategorysecondService categorysecondService;

    @Autowired
    private LogoService logoService;
/*跳转商品展示页面*/
    @RequestMapping("toCommodity")
    public String toCommodity(Model model){
        List<Categorysecond> categorysecondList = commodityService.querycsid();
        model.addAttribute("list", categorysecondList);
        return "commodity/commoditylist";
    }
/*查询商品*/
    @RequestMapping("queryCommodity")
    @ResponseBody
    public List<Product> queryCommodity(){
        List<Product> productList = commodityService.queryCommodity();
        return productList;
    }
/*删除商品*/
    @RequestMapping("deleteCommodity")
    @ResponseBody
    public void deleteCommodity(String pid){
        commodityService.deleteCommodity(pid);
    }

/*新增商品*/
    @RequestMapping("addCommodity")
    @ResponseBody
    public void addCommodity(Product product){
        commodityService.addCommodity(product);
    }

/*跳转修改页面*/
    @RequestMapping("toupdate")
    public String toupdate(Integer pid,Model model){
        Product pro = commodityService.toupdate(pid);
        List<Categorysecond> categorysecondList = commodityService.querycsid();
        model.addAttribute("list", categorysecondList);
        model.addAttribute("pro", pro);
        model.addAttribute("pid", pid);
        return "commodity/updatecommodity";
    }

/*修改商品*/
    @RequestMapping("updateCommodity")
    @ResponseBody
    public void updateCommodity(Product product){
        commodityService.updateCommodity(product);
    }

/*跳转添加属性页面*/
    @RequestMapping("totjsx")
    public String totjsx(Integer pid,Model model){
        model.addAttribute("pid", pid);
        return "commodity/tjsx";
    }

/*保存属性*/
    @RequestMapping("addtjsx")
    @ResponseBody
    public void addtjsx(Integer pid,String cname,String cvalue){
        commodityService.addtjsx(pid,cname,cvalue);
    }

    /*跳转商品审核页面*/
    @RequestMapping("toAudit")
    public String toAudit(){
        return "commodity/commoditybystatus";

    }

    /*商品审核列表*/
    @RequestMapping("queryByStatus")
    @ResponseBody
    public List<Product> queryByStatus(){
        List<Product> pList = commodityService.queryByStatus();
        return pList;
    }


    /*商品审核*/
    @RequestMapping("updateStatus")
    @ResponseBody
    public void updateStatus(Integer pid){
        commodityService.updateStatus(pid);
    }



    /*添加图片*/
    @RequestMapping(value="/headImgUpload", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> headImgUpload(HttpServletRequest request, @RequestParam("image") MultipartFile image) throws Exception {
        Map<String, Object> value = new HashMap<String, Object>();
        value.put("success", true);
        value.put("errorCode", 0);
        value.put("errorMsg", "");
        OSSClientUtil oss = new OSSClientUtil();
        String fileName = oss.uploadImg2Oss(image);
        String imgUrl = oss.getImgUrl(fileName);
        System.out.println("newUrl"+fileName);
        System.out.println("imgUrl"+imgUrl);
        value.put("fileName", fileName);
        value.put("imgUrl",imgUrl);
        return value;
    }



    /*前台*/
    @RequestMapping("thePrimaryQuery")
    public String thePrimaryQuery(HttpServletRequest request,String cid,String csid,Model model){
        if (request.getSession().getAttribute("dbuser")!=null){
            Users dbuser = (Users) request.getSession().getAttribute("dbuser");
            model.addAttribute("user",dbuser);
            System.out.println(dbuser);
        }
        //根据一级分类查询商品
        List<Product> thePrimaryList = commodityService.thePrimaryQuery(cid,csid);
        model.addAttribute("thePrimaryList", thePrimaryList);
        //查询一级表
        List<Category> cate = categorysecondService.queryCategory();
        model.addAttribute("cate",cate);
        //查询二级
        List<com.jk.model.categorysecond.Categorysecond> cs = categorysecondService.queryOneAndTwo();
        model.addAttribute("cs",cs);
        //LOGO
        List<Logo> logos = logoService.queryLogo();
        System.out.println(logos.size());
        model.addAttribute("logo",logos);

        return "frontpage/clothing";
    }


    /**
     * 前端分页
     */
    @RequestMapping("limitProduct")
    @ResponseBody
    public ResultPage limitProduct(Product product,String cid,String csid){
        return commodityService.limitProduct(product,cid,csid);
    }

    /*前台*/
    @RequestMapping("querydetails")
    public String queryDetails(String cid,Model model,String pid){
        //根据一级分类查询商品
        List<Product> thePrimaryList = commodityService.thePrimaryQuery(cid,pid);
        model.addAttribute("thePrimaryList", thePrimaryList);
        //查询一级表
        List<Category> cate = categorysecondService.queryCategory();
        model.addAttribute("cate",cate);
        //查询二级
        List<com.jk.model.categorysecond.Categorysecond> cs = categorysecondService.queryOneAndTwo();
        model.addAttribute("cs",cs);
        //商品详情
        List<Product> details = commodityService.queryDetails(pid);
        model.addAttribute("details", details);
        //LOGO
        List<Logo> logos = logoService.queryLogo();
        System.out.println(logos.size());
        model.addAttribute("logo",logos);

        return "frontpage/commoditydetails";
    }


    @RequestMapping("queryaaa")
    @ResponseBody
    public List<CommodityProperty> queryCommodityProperty(String pid){
        List<CommodityProperty> cProperties = commodityService.queryCommodityProperty(pid);
             return cProperties;
    }

}
