package org.antunesleo.controller;

import java.util.List;

import javax.validation.Valid;

import org.antunesleo.dao.CategorieDao;
import org.antunesleo.dao.ProductDao;
import org.antunesleo.model.Categorie;
import org.antunesleo.model.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author antunesleo
 *
 */
@Controller
public class ProductController {

	@RequestMapping("listProducts") 
	public String list(Model model) {
		ProductDao dao = new ProductDao();
		List<Product> products = dao.getList();
		model.addAttribute("products", products);
		return "product/list";
	}
	
	@RequestMapping("addProduct")
	public String add(@Valid Product product, BindingResult result) {
		if (result.hasErrors()) {
			for (ObjectError error : result.getAllErrors()) {
				System.out.println(error.toString() + " -- " + error.getDefaultMessage());
			}
			return "product/form";
		}
		ProductDao dao = new ProductDao();
		dao.add(product);
		return "redirect:listProducts";	
	}
	
	@RequestMapping("/newProduct")
	public String form(Model model) {
		CategorieDao dao = new CategorieDao();	
		model.addAttribute("categories", dao.getList());
		return "product/form";
	}
	
	@RequestMapping("removeProduct")
	public String remove(Product product) {
		ProductDao dao = new ProductDao();
		dao.remove(product);
		return "redirect:listProducts";
	}
	
	@RequestMapping("showProduct")
	public String show(Long id, Model model) {
		ProductDao dao = new ProductDao();
		model.addAttribute("product", dao.findById(id));
		return "product/show";
	}
	
	@RequestMapping("updateProduct")
	public String update(Product product) {
		ProductDao dao = new ProductDao();
		dao.update(product);
		return "redirect:listProducts";
	}
	
}
