package org.antunesleo.model;

/**
 * @author antunesleo
 *
 */
public class Product {
	private Long id;
	private String name;
	private String description;
	private	boolean isActive;
	private Integer untPerPallet;
	private Integer guaranteeDays;
	private String uom;
	private boolean isManufactured;
	private boolean isSold;
	private boolean isDiscontinued;
	private double price;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
	public Integer getUntPerPallet() {
		return untPerPallet;
	}
	public void setUntPerPallet(Integer untPerPallet) {
		this.untPerPallet = untPerPallet;
	}
	public Integer getGuaranteeDays() {
		return guaranteeDays;
	}
	public void setGuaranteeDays(Integer guaranteeDays) {
		this.guaranteeDays = guaranteeDays;
	}
	public String getUom() {
		return uom;
	}
	public void setUom(String uom) {
		this.uom = uom;
	}
	public boolean isManufactured() {
		return isManufactured;
	}
	public void setManufactured(boolean isManufactured) {
		this.isManufactured = isManufactured;
	}
	public boolean isSold() {
		return isSold;
	}
	public void setSold(boolean isSold) {
		this.isSold = isSold;
	}
	public boolean isDiscontinued() {
		return isDiscontinued;
	}
	public void setDiscontinued(boolean isDiscontinued) {
		this.isDiscontinued = isDiscontinued;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
}
