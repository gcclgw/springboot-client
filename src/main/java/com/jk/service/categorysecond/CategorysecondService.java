package com.jk.service.categorysecond;

import com.jk.model.category.Category;
import com.jk.model.categorysecond.Categorysecond;

import java.util.List;

public interface CategorysecondService {
    /**
     * 查询二级
     * @return
     */
    List<Categorysecond> queryCategorysecond();

    /**
     * 删除二级
     * @param csid
     */
    void delCategorysecond(String csid);

    /**
     * 新增二级
     */
    void saveCategorysecond(Categorysecond categorysecond);

    /**
     * 回显
     */
    Categorysecond querysecondByid(Integer scid);

    /**
     * 修改二级
     */
    void editSecond(Categorysecond categorysecond);

    /**
     * 下拉框
     * @return
     */
    List<Category> querycate();

    /**
     * 根据一级查二级
     */
    List<Categorysecond> queryOneAndTwo();
}
