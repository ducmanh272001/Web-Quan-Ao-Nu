package com.fashion.entity;

import java.util.Date;

public class TinTuc {

	private int id;
	private String title;
	private String descripe;
	private String content;
	private String type_tin;
	private Date day_tin;
	private String img;
	private int status;

	public TinTuc() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TinTuc(int id, String title, String descripe, String content, String type_tin, Date day_tin, String img,
			int status) {
		super();
		this.id = id;
		this.title = title;
		this.descripe = descripe;
		this.content = content;
		this.type_tin = type_tin;
		this.day_tin = day_tin;
		this.img = img;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescripe() {
		return descripe;
	}

	public void setDescripe(String descripe) {
		this.descripe = descripe;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getType_tin() {
		return type_tin;
	}

	public void setType_tin(String type_tin) {
		this.type_tin = type_tin;
	}

	public Date getDay_tin() {
		return day_tin;
	}

	public void setDay_tin(Date day_tin) {
		this.day_tin = day_tin;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "TinTuc [id=" + id + ", title=" + title + ", descripe=" + descripe + ", content=" + content
				+ ", type_tin=" + type_tin + ", day_tin=" + day_tin + ", day_update=" + ", img=" + img + ", status="
				+ status + "]";
	}

}
