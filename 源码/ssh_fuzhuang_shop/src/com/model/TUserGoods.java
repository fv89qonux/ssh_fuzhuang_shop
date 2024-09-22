package com.model;

import org.springframework.orm.hibernate3.HibernateTemplate;

/**
 * TUser generated by MyEclipse Persistence Tools
 */

public class TUserGoods implements java.io.Serializable
{

	// Fields

	private Integer id;
	private Integer user_id;
	private Integer goods_id;
	private Integer count;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(Integer goods_id) {
		this.goods_id = goods_id;
	}
	public TUserGoods(Integer user_id, Integer goods_id) {
		this.user_id = user_id;
		this.goods_id = goods_id;
	}
	public TUserGoods(Integer goods_id, Integer user_id, Integer count) {
		this.user_id = user_id;
		this.goods_id = goods_id;
		this.count = count;
	}
	public TUserGoods() {
		super();
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "TUserGoods [id=" + id + ", user_id=" + user_id + ", goods_id="
				+ goods_id + ", count=" + count + "]";
	}
	public TUserGoods(Integer id, Integer user_id, Integer goods_id,
			Integer count) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.goods_id = goods_id;
		this.count = count;
	}
	
	

}