package org.antunesleo.model;

/**
 * @author antunesleo
 *
 */
public class Product {
	private Long id;
	private String name;
	private String description;
	private	boolean active;
	private double price;	
	private Categorie categorie;
	
	public Long getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getDescription() {
		return description;
	}
	public boolean isActive() {
		return active;
	}
	public double getPrice() {
		return price;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Categorie getCategorie() {
		return categorie;
	}
	public void setCategorie(Categorie categorie) {
		this.categorie = categorie;
	}
}
