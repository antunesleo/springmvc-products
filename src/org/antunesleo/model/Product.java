package org.antunesleo.model;

/**
 * @author antunesleo
 *
 */
public class Product {
	private Long id;
	private String name;
	private String description;
	private String category;
	private	boolean active;
	private Integer untPerPallet;
	private Integer guaranteeDays;
	private Integer uom;
	private String 	uomName;
	private boolean manufactured;
	private boolean sold;
	private boolean discontinued;
	private double price;	
	
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
	public Integer getUntPerPallet() {
		return untPerPallet;
	}
	public Integer getGuaranteeDays() {
		return guaranteeDays;
	}
	public Integer getUom() {
		return uom;
	}
	public boolean isManufactured() {
		return manufactured;
	}
	public boolean isSold() {
		return sold;
	}
	public boolean isDiscontinued() {
		return discontinued;
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
	public void setUntPerPallet(Integer untPerPallet) {
		this.untPerPallet = untPerPallet;
	}
	public void setGuaranteeDays(Integer guaranteeDays) {
		this.guaranteeDays = guaranteeDays;
	}
	public void setUom(Integer uom) {
		this.uom = uom;
	}
	public void setManufactured(boolean manufactured) {
		this.manufactured = manufactured;
	}
	public void setSold(boolean sold) {
		this.sold = sold;
	}
	public void setDiscontinued(boolean discontinued) {
		this.discontinued = discontinued;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getUomName() {
		return uomName;
	}
	public void setUomName(String uomName) {
		this.uomName = uomName;
	}
	
}
