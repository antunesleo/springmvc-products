/**
 * 
 */
package org.antunesleo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.antunesleo.jdbc.ConnectionFactory;
import org.antunesleo.model.Product;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author antunesleo
 *
 */
public class JdbcProductDao {
	private Connection connection = null;
	
	@Autowired
	public JdbcProductDao() {
		if (this.connection == null) {
			this.connection = new ConnectionFactory().getConnection(); 
		}
	}
	
	public List<Product> getList() {
		try {
			List<Product> products = new ArrayList<Product>();
			String sql = "SELECT * FROM product WHERE active = true";
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getLong("id"));
				product.setDescription(rs.getString("description"));
				product.setName(rs.getString("name"));
				product.setActive(rs.getBoolean("active"));
				product.setDiscontinued(rs.getBoolean("discontinued"));
				product.setSold(rs.getBoolean("sold"));
				product.setManufactured(rs.getBoolean("manufactured"));
				product.setGuaranteeDays(rs.getInt("guaranteeDays"));
				product.setPrice(rs.getDouble("price"));
				product.setUom(rs.getString("uom"));
				product.setUntPerPallet(rs.getInt("untPerPallet"));	
				product.setCategory(rs.getString("category"));
				products.add(product);
			}
			rs.close();
			stmt.close();
			return products;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void adiciona(Product product) {
		try {
			String sql = "INSERT INTO product (description, name, active, discontinued, sold, manufactured, "
					+ "guaranteeDays, price, uom, untPerPallet, category) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setString(1, product.getDescription());
			stmt.setString(2, product.getName());
			stmt.setBoolean(3, product.isActive());
			stmt.setBoolean(4, product.isDiscontinued());
			stmt.setBoolean(5, product.isSold());
			stmt.setBoolean(6, product.isManufactured());
			stmt.setInt(7, product.getGuaranteeDays());
			stmt.setDouble(8, product.getPrice());
			stmt.setString(9, product.getUom());
			stmt.setInt(10, product.getUntPerPallet());
			stmt.setString(11, product.getCategory());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
