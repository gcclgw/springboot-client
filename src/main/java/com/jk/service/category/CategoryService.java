package com.jk.service.category;

import com.jk.model.category.Category;

import java.util.List;

public interface CategoryService {
    /**
     * 查询一级
     * @return
     */
    List<Category> querycategory();

    /**
     * 删除一级
     * @param category
     */
    void delCategory(String cid);

    /**
     * 新增一级
     * @param category
     */
    void addCategory(Category category);


    /**
     * 回显
     * @return
     * @param id
     */
    Category toEditList(Integer id);

    /**
     * 修改
     * @param category
     */
    void editcate(Category category);


}
