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
import org.antunesleo.model.Uom;

/**
 * @author antunesleo
 *
 * UOM = unit of measure
 * This class was created to register UOMS, like kilograma, metro yards, etc
 */

public class JdbcUomDao {
	public Connection connection = new ConnectionFactory().getConnection();
	
	public List<Uom> getList(boolean activeOnly) {
		try {
			List<Uom> uoms = new ArrayList<Uom>();
			String sql = null;
			
			if (activeOnly) {
				sql = "SELECT * FROM uom WHERE active = true"; 
			} else {
				sql = "SELECT * FROM uom"; 
			}
			
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Uom uom = new Uom();
				uom.setId(rs.getLong("id"));
				uom.setName(rs.getString("name"));
				uom.setDescription(rs.getString("description"));
				uom.setActive(rs.getBoolean("active"));
				uoms.add(uom);
			}
			stmt.close();
			rs.close();
			return uoms;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void add(Uom uom) {
		try {
			String sql = "INSERT INTO uom (name, description, active) VALUES (?,?,?)";
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setString(1, uom.getName());
			stmt.setString(2, uom.getDescription());
			stmt.setBoolean(3, uom.isActive());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void update(Uom uom) {
		//needs to develop
	}
	
	public Uom findById(Long id) {
		if (id == null)
			return null;
		
		try {
			String sql = "SELECT * FROM uom WHERE id = ?";
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			Uom uom = new Uom();
			while (rs.next()) {
				uom.setId(rs.getLong("id"));
				uom.setName(rs.getString("name"));
				uom.setDescription(rs.getString("description"));
				uom.setActive(rs.getBoolean("active"));
			}
			return uom;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public String getNameById(Long id) {
		if (id == null)
			return null;
		
		try {
			String sql = "SELECT * FROM uom WHERE id = ?";
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			Uom uom = new Uom();
			while (rs.next()) {
				uom.setId(rs.getLong("id"));
				uom.setName(rs.getString("name"));
			}
			return uom.getName();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
