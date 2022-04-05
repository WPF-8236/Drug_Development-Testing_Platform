package com.WPF.controller;

import com.alibaba.druid.pool.DruidDataSource;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/jasper")
public class JasperController {
	@Resource
	private DruidDataSource myDataSource;

	@RequestMapping("/exportPdf")
	public void exportPdf(HttpServletResponse response, HttpServletRequest request) throws Exception {
		System.setProperty("java.awt.headless", "true");
		//1.读取.japser文件，构建输入流
		InputStream in = request.getServletContext().getResourceAsStream("/jasper/crf.jasper");

		Map<String, Object> map = new HashMap<>();
		map.put("Parameter1","2022-4-5 12:55:13");
		//2.构建Print对象，用于让模块结合数据
		//第三个参数：如果是JDBC数据源，应该设置Connection对象
		JasperPrint print = JasperFillManager.fillReport(in, map, myDataSource.getConnection());

		//3.使用Exporter导出PDF
		JasperExportManager.exportReportToPdfStream(print, response.getOutputStream());

	}
}
