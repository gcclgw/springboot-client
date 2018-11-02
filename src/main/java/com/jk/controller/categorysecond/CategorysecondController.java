package com.jk.controller.categorysecond;

import com.jk.model.category.Category;
import com.jk.model.categorysecond.Categorysecond;
import com.jk.service.categorysecond.CategorysecondService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("categorysecond")
public class CategorysecondController {
    @Autowired
    private CategorysecondService categorysecondService;

    /**
     * 根据一级查二级
     */
    @RequestMapping("queryOneAndTwo")
    @ResponseBody
    public  List<Categorysecond> queryOneAndTwo(){
        List<Categorysecond> cs = categorysecondService.queryOneAndTwo();
        return cs;
    }

    /**
     * 进入二级页面
     * @return
     */
    @RequestMapping("toCategorysecondJsp")
    public String toCategorysecondJsp(){
        return "categorysecond/categorysecond_list";
    }

    /**
     * 查询二级
     */
    @RequestMapping("queryCategorysecond")
    @ResponseBody
    public List<Categorysecond> queryCategorysecond(){
        List<Categorysecond> second = categorysecondService.queryCategorysecond();
        return second;
    }

    /**
     * 删除二级
     */
    @RequestMapping("delCategorysecond")
    @ResponseBody
    public void delCategorysecond(String csid){
        categorysecondService.delCategorysecond(csid);
    }

    /**
     * 进入新增页面
     */
    @RequestMapping("toaddCategorysecond")
    public String toaddCategorysecond(Model model){
        List<Category> cate = categorysecondService.querycate();
        model.addAttribute("cate",cate);
        return "categorysecond/categorysecond_add";
    }
    /**
     * 新增二级
     */
    @RequestMapping("saveCategorysecond")
    @ResponseBody
    public String saveCategorysecond(Categorysecond categorysecond){
        categorysecondService.saveCategorysecond(categorysecond);
        return "{}";
    }

    /**
     * 回显
     */
    @RequestMapping("querysecondByid")
    public String querysecondByid(Model model,Integer scid){
        Categorysecond categorysecond = categorysecondService.querysecondByid(scid);
        model.addAttribute("cs",categorysecond);
        model.addAttribute("scid",scid);
        return "categorysecond/categorysecond_edit";
    }

    /**
     * 修改二级
     */
    @RequestMapping("editSecond")
    @ResponseBody
    public String editSecond(Categorysecond categorysecond){
        categorysecondService.editSecond(categorysecond);
        return "{}";
    }
}
