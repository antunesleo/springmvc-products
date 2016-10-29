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
			String sql = "SELECT * FROM product ORDER BY name";
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
				product.setUom(rs.getInt("uom"));
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
	
	public void add(Product product) {
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
			stmt.setInt(9, product.getUom());
			stmt.setInt(10, product.getUntPerPallet());
			stmt.setString(11, product.getCategory());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void update(Product product) {
		try {
			if (product.getId() != null) {
				String sql = "UPDATE product SET description = ?, name = ?, active = ?, discontinued = ?, sold = ?, "
						+ "manufactured = ?, guaranteeDays = ?, price = ?, uom = ?, untPerPallet = ?, category = ?"
						+ "WHERE id = ?";
				PreparedStatement stmt = this.connection.prepareStatement(sql);
				stmt.setString(1, product.getDescription());
				stmt.setString(2, product.getName());
				stmt.setBoolean(3, product.isActive());
				stmt.setBoolean(4, product.isDiscontinued());
				stmt.setBoolean(5, product.isSold());
				stmt.setBoolean(6, product.isManufactured());
				stmt.setInt(7, product.getGuaranteeDays());
				stmt.setDouble(8, product.getPrice());
				stmt.setInt(9, product.getUom());
				stmt.setInt(10, product.getUntPerPallet());
				stmt.setString(11, product.getCategory());
				stmt.setLong(12, product.getId());
				stmt.execute();
				stmt.close();
			}
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void remove(Product product) {
		try {
			String sql = "DELETE FROM product WHERE id = ?";
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setLong(1, product.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public Product findById(Long id) {
		try {
			if (id != null) {
				String sql = "SELECT * FROM product WHERE id = ?";
				PreparedStatement stmt = this.connection.prepareStatement(sql);
				stmt.setLong(1, id);
				ResultSet rs = stmt.executeQuery();
				Product product = new Product();
				JdbcUomDao uomDao = new JdbcUomDao();
				while (rs.next()) {
					product.setId(rs.getLong("id"));
					product.setName(rs.getString("name"));
					product.setDescription(rs.getString("description"));
					product.setCategory(rs.getString("category"));
					product.setActive(rs.getBoolean("active"));
					product.setManufactured(rs.getBoolean("manufactured"));
					product.setDiscontinued(rs.getBoolean("discontinued"));
					product.setSold(rs.getBoolean("sold"));
					if(rs.getInt("uom") != 0) {
						product.setUom(rs.getInt("uom"));
						product.setUomName(uomDao.getNameById(id));
					}
					product.setUntPerPallet(rs.getInt("untPerPallet"));
					product.setPrice(rs.getDouble("price"));
					product.setGuaranteeDays(rs.getInt("guaranteeDays"));
				}
				return product;
			}
			return null;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public int getNumberOfRecords() {
		try {
			String sql = "SELECT COUNT(*) as numberRecords FROM product";
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			int numberRecords = 0;
			while (rs.next()) {
				numberRecords = rs.getInt("numberRecords");
			}
			return numberRecords;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
