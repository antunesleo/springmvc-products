/**
 * 
 */
package org.antunesleo.converter;

import org.antunesleo.dao.CategorieDao;
import org.antunesleo.model.Categorie;
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
