package org.antunesleo.products.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.antunesleo.products.jdbc.ConnectionFactory;
import org.antunesleo.products.model.Categorie;
import org.antunesleo.products.model.Product;
import org.springframework.beans.factory.annotation.Autowired;

public class CategorieDao {
	private Connection connection = null;
	
	@Autowired
	public CategorieDao() {
		if (this.connection == null) {
			this.connection = new ConnectionFactory().getConnection(); 
		}
	}
	
	public Categorie loadModel(ResultSet rs) throws SQLException {
		Categorie categorie = new Categorie();
		categorie.setId(rs.getLong("id"));
		categorie.setDescription(rs.getString("description"));
		categorie.setName(rs.getString("name"));
		categorie.setActive(rs.getBoolean("active"));
		return categorie;
	}
	
	public List<Categorie> getList() {
		try {
			List<Categorie> categories = new ArrayList<Categorie>();
			String sql = "SELECT * FROM categorie ORDER BY name";
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				categories.add(loadModel(rs));
			}
			rs.close();
			stmt.close();
			return categories;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void add(Product product) {
		try {
			String sql = "INSERT INTO product (description, name, active, price) "
					+ "VALUES (?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setString(1, product.getDescription());
			stmt.setString(2, product.getName());
			stmt.setBoolean(3, product.isActive());
			stmt.setDouble(8, product.getPrice());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void update(Product product) {
		try {
			if (product.getId() != null) {
				String sql = "UPDATE product SET description = ?, name = ?, active = ?, price = ? "
						+ "WHERE id = ?";
				PreparedStatement stmt = this.connection.prepareStatement(sql);
				stmt.setString(1, product.getDescription());
				stmt.setString(2, product.getName());
				stmt.setBoolean(3, product.isActive());
				stmt.setDouble(8, product.getPrice());

				stmt.setLong(10, product.getId());
				stmt.execute();
				stmt.close();
			}
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void remove(Categorie categorie) {
		try {
			String sql = "DELETE FROM categorie WHERE id = ?";
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setLong(1, categorie.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public Categorie findById(Long id) {
		try {
			if (id != null) {
				String sql = "SELECT * FROM categorie WHERE id = ?";
				PreparedStatement stmt = this.connection.prepareStatement(sql);
				stmt.setLong(1, id);
				ResultSet rs = stmt.executeQuery();
				Categorie categorie = new Categorie();
				while (rs.next()) {
					categorie = loadModel(rs);
				}
				return categorie;
			}
			return null;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
