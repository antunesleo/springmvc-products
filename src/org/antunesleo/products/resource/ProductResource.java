package org.antunesleo.products.resource;


import javax.websocket.server.PathParam;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.antunesleo.products.dao.ProductDao;
import org.antunesleo.products.model.Product;

@Path("/product/{id}")
public class ProductResource {
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Product getProductById(@PathParam("id") Long id) {
		System.out.println("oi");
		ProductDao productDao = new ProductDao();
		Product product = productDao.findById(id);
		return product;
	}
}
