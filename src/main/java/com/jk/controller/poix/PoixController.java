package com.jk.controller.poix;

import com.jk.model.cont.Contx;
import com.jk.service.poix.PoixService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;




@Controller
@RequestMapping("poix")
public class PoixController {
    @Autowired
    private PoixService poixService;


    @RequestMapping("export")
    @ResponseBody
    public void export(HttpServletResponse response,String htid) throws IOException {
        List<Contx> users = poixService.selectUsers(htid);

        HSSFWorkbook wb = new HSSFWorkbook();

        HSSFSheet sheet = wb.createSheet("获取excel测试表格");

        HSSFRow row = null;

        row = sheet.createRow(0);//创建第一个单元格
        row.setHeight((short) (26.25 * 20));
        row.createCell(0).setCellValue("合同信息列表");//为第一行单元格设值

        /*为标题设计空间
         * firstRow从第1行开始
         * lastRow从第0行结束
         *
         *从第1个单元格开始
         * 从第3个单元格结束
         */
        CellRangeAddress rowRegion = new CellRangeAddress(0, 0, 0, 2);
        sheet.addMergedRegion(rowRegion);

      /*CellRangeAddress columnRegion = new CellRangeAddress(1,4,0,0);
      sheet.addMergedRegion(columnRegion);*/


        /*
         * 动态获取数据库列 sql语句 select COLUMN_NAME from INFORMATION_SCHEMA.Columns where table_name='user' and table_schema='test'
         * 第一个table_name 表名字
         * 第二个table_name 数据库名称
         * */
        row = sheet.createRow(1);
        row.setHeight((short) (22.50 * 20));//设置行高
        row.createCell(0).setCellValue("合同Id");//为第一个单元格设值
        row.createCell(1).setCellValue("合同名");//为第二个单元格设值
        row.createCell(2).setCellValue("状态");//为第三个单元格设值
        row.createCell(3).setCellValue("生效时间");//为第三个单元格设值
        row.createCell(4).setCellValue("结束时间");//为第三个单元格设值
        row.createCell(5).setCellValue("企业编号");//为第三个单元格设值
        row.createCell(6).setCellValue("创建时间");//为第三个单元格设值
        row.createCell(7).setCellValue("描述");//为第三个单元格设值

        for (int i = 0; i < users.size(); i++) {
            row = sheet.createRow(i + 2);
            Contx user = users.get(i);
            row.createCell(0).setCellValue(user.getHtid());
            row.createCell(1).setCellValue(user.getHtname());
            row.createCell(2).setCellValue(user.getHtstatus());
            row.createCell(3).setCellValue(user.getStartdate());
            row.createCell(4).setCellValue(user.getEndtime());
            row.createCell(5).setCellValue(user.getQid());
            row.createCell(6).setCellValue(user.getCreatdate());
            row.createCell(7).setCellValue(user.getHtinfo());
        }
        sheet.setDefaultRowHeight((short) (16.5 * 20));
        //列宽自适应
        for (int i = 0; i <= 13; i++) {
            sheet.autoSizeColumn(i);
        }

        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        OutputStream os = response.getOutputStream();
        response.setHeader("Content-disposition", "attachment;filename=user.xls");//默认Excel名称
        wb.write(os);
        os.flush();
        os.close();


    }


    @RequestMapping(value = "/import")
    public String exImport(@RequestParam(value = "filename")MultipartFile file, HttpSession session) {

        boolean a = false;

        String fileName = file.getOriginalFilename();

        try {
            a = poixService.batchImport(fileName, file);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:index";
    }



}
