/**
 * 
 */
package org.antunesleo.products.converter;

import org.antunesleo.products.dao.CategorieDao;
import org.antunesleo.products.model.Categorie;
import org.springframework.core.convert.converter.Converter;

/**
 * @author leonardo
 *
 */
public class StringToCategoryConverter implements Converter<String, Categorie>{
	public Categorie convert(String source) {
		CategorieDao dao = new CategorieDao();
		Categorie categorie = dao.findById(Long.valueOf(source));
		return categorie;
	}

}
