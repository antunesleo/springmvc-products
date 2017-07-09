package org.antunesleo.products.resource;

import java.util.List;

import javax.websocket.server.PathParam;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.antunesleo.products.dao.CategorieDao;
import org.antunesleo.products.model.Categorie;
@Path("/CategoryService")

public class CategoryResource {
	CategorieDao categorieDao = new CategorieDao();
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/categories")
	public List<Categorie> getProductById(@PathParam("id") Long id) {
		return categorieDao.getList();
	}
}
