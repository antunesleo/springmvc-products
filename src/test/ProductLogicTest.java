package test;

import org.antunesleo.products.logic.ProductLogic;
import org.antunesleo.products.model.Product;

import junit.framework.TestCase;

public class ProductLogicTest extends TestCase {

	public void testIsDeliveredPayedTrue() {
		Product product = new Product();
		product.setPrice(0.35);
		boolean returnExpected = true;
		
		boolean returnReal = ProductLogic.isDeliveredPayed(product);
		assertEquals(returnExpected, returnReal);
	}
	
	public void testIsDeliveredPayedFalse() {
		Product product = new Product();
		product.setPrice(6.35);
		boolean returnExpected = false;
		
		boolean returnReal = ProductLogic.isDeliveredPayed(product);
		assertEquals(returnExpected, returnReal);
	}
}
