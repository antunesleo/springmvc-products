package org.antunesleo.controller;

import java.util.List;

import javax.validation.Valid;

import org.antunesleo.dao.JdbcProductDao;
import org.antunesleo.dao.JdbcUomDao;
import org.antunesleo.model.Product;
import org.antunesleo.model.Uom;
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
		JdbcUomDao uomDao = new JdbcUomDao();
		model.addAttribute("uomDao",uomDao);
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
	public String form(Model model) {
		JdbcProductDao dao = new JdbcProductDao();
		JdbcUomDao uomDao = new JdbcUomDao();
		model.addAttribute("uoms", uomDao.getList(true));		
		model.addAttribute("products", dao.getList());
		return "product/form";
	}
	
	@RequestMapping("removeProduct")
	public String remove(Product product) {
		JdbcProductDao dao = new JdbcProductDao();
		dao.remove(product);
		return "redirect:listProducts";
	}
	
	@RequestMapping("showProduct")
	public String show(Long id, Model model) {
		JdbcProductDao dao = new JdbcProductDao();
		model.addAttribute("product", dao.findById(id));
		JdbcUomDao uomDao = new JdbcUomDao();
		model.addAttribute("uomDao",uomDao);
		return "product/show";
	}
	
	@RequestMapping("updateProduct")
	public String update(Product product) {
		JdbcProductDao dao = new JdbcProductDao();
		dao.update(product);
		return "redirect:listProducts";
	}
	
}
