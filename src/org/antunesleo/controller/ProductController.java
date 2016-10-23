package org.antunesleo.controller;

import java.util.List;

import javax.validation.Valid;

import org.antunesleo.dao.JdbcProductDao;
import org.antunesleo.model.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	
	@RequestMapping("addProduct")
	public String add(@Valid Product product, BindingResult result) {
		if (result.hasErrors()) {
			return "product/form";
		}
		JdbcProductDao dao = new JdbcProductDao();
		dao.add(product);
		return "redirect:listProducts";	
	}
	
	@RequestMapping("/newProduct")
	public String form() {
		return "product/form";
	}
	
}