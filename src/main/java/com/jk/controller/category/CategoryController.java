package com.jk.controller.category;

import com.jk.model.category.Category;
import com.jk.service.category.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
@Controller
@RequestMapping("category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    /**
     * 去修改页面回显
     */
    @RequestMapping("toEditList")
    public String toEditList(Model model,Integer id){
        Category category = categoryService.toEditList(id);
        model.addAttribute("category",category);
        model.addAttribute("id",id);
        return "catetory/category_edit";
    }

    /**
     * 修改
     */
    @RequestMapping("editcate")
    @ResponseBody
    public String editcate(Category category){
        categoryService.editcate(category);
        return "{}";
    }


    /**
     * 去新增页面
     * @return
     */
    @RequestMapping("toaddcategory")
    public String toaddcategory(){
        return "catetory/category_add";
    }

    /**
     * 新增一级
     */
    @RequestMapping("addCategory")
    @ResponseBody
    public String addCategory(Category category){
        categoryService.addCategory(category);
        return "{}";
    }

    /**
     * 删除一级分类管理
     */
    @RequestMapping("delCategory")
    @ResponseBody
    public void delCategory(String cid){
        categoryService.delCategory(cid);
    }


    /**
     * 去查询页面
     * @return
     */
    @RequestMapping("tocategory")
    public String tocategory(){
        return "catetory/catagory_list";
    }

    /**
     * 查询一级
     * @param model
     * @return
     */
    @RequestMapping("/queryCategory")
    @ResponseBody
    public List<Category> queryCommodity(Model model){
        List<Category> category = categoryService.querycategory();
        /*String str = JSON.toJSONString(category);
        model.addAttribute("str",str);*/
        return category;
    }
}
