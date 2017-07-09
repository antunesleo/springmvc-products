/**
 * 
 */
package org.antunesleo.products.model;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement(name = "categorie")
/**
 * @author leonardo
 *
 */
public class Categorie implements Serializable{
	private static final long serialVersionUID = -725738935501642331L;
	private long id;
	private String name;
	private String description;
	private boolean active;
	
	public long getId() {
		return id;
	}
	@XmlElement
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	@XmlElement
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	@XmlElement
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isActive() {
		return active;
	}
	@XmlElement
	public void setActive(boolean active) {
		this.active = active;
	}
}
