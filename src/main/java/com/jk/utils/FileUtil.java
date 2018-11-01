/**
 * <pre>项目名称:sss_demo
 * 文件名称:FileUtil.java
 * 包名:com.jk.sss.util
 * 创建日期:2018年7月11日下午7:14:00
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre>
 */
package com.jk.utils;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class FileUtil {
	public static void downLoadFile(HttpServletResponse response, HttpServletRequest request, String filename) {
		String realPath = request.getServletContext().getRealPath("/") + filename;
		File file = new File(realPath);
		if (file.exists()) {
			response.setCharacterEncoding("utf-8");
			response.setHeader("Content-Disposition", "attachment;filename=" + file.getName());
			response.setHeader("Content-Type", "application/octet-stream");
			FileInputStream is = null;
			ServletOutputStream outputStream = null;
			try {
				is = new FileInputStream(file);
				outputStream = response.getOutputStream();
				byte[] b = new byte[1024];
				int read = is.read(b);
				while (-1 != read) {
					outputStream.write(b);
					outputStream.flush();
					//读取下一次
					read = is.read(b);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				if (null != outputStream) {
					try {
						outputStream.close();
						outputStream = null;
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if (null != is) {
					try {
						is.close();
						is = null;
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
	}
	public static Map<String,Object> uploadImg(MultipartFile file, HttpServletRequest request){
		Map<String,Object> map =new HashMap<>();
		if(file !=null){
			String realPath = request.getServletContext().getRealPath("/upload/");
			File f =new File(realPath);

			if(!f.exists()){
				f.mkdirs();
			}
			//重命名文件
			String oldFileName = file.getOriginalFilename();
			String FileName = UUID.randomUUID().toString()+oldFileName.substring(oldFileName.lastIndexOf("."));
			try {
				file.transferTo(new File(realPath+FileName));
				map.put("img", "/upload/"+FileName);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return map;

	}

}
