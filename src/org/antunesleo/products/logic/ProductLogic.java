package org.antunesleo.products.logic;

import org.antunesleo.products.model.Product;

public class ProductLogic {
	
	public static boolean isDeliveredPayed(Product product) {
		if (product.getPrice() > 5) {
			return false;
		} else {
			return true;
		}
	}
}
