package org.antunesleo.controller;

import java.util.List;

import org.antunesleo.dao.JdbcProductDao;
import org.antunesleo.model.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author antunesleo
 *
 */
@Controller
public class ProductController {

	@RequestMapping("listProducts") 
	public String list(Model model) {
		JdbcProductDao dao = new JdbcProductDao();
		List<Product> products = dao.getList();
		model.addAttribute("products", products);
		return "product/list";
	}
	
	@RequestMapping("newProduct")
	public String add(Product product) {
		return null;
	}
}
