package com.fly.dds.domain;

import java.util.Set;

public class Info {
	private long num;
	private String region_Main;
	private String region_Sub;
	private String contentId;
	private String contentType;
	private String name;
	private String thumbnail;
	private String main_Category;
	private String middle_Category;
	private String sub_Category;
	
	private String homepage;
	private String tel;
	private String addr1;
	private String addr2;
	private String zipcode;
	private String mapx;
	private String mapy;
	private String overview;
	
	private Set<String> tags;
	
	public Set<String> getTags() {
		return tags;
	}
	public void setTags(Set<String> tags) {
		this.tags = tags;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getRegion_Main() {
		return region_Main;
	}
	public void setRegion_Main(String region_Main) {
		this.region_Main = region_Main;
	}
	public String getRegion_Sub() {
		return region_Sub;
	}
	public void setRegion_Sub(String region_Sub) {
		this.region_Sub = region_Sub;
	}
	public String getContentId() {
		return contentId;
	}
	public void setContentId(String contentId) {
		this.contentId = contentId;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getMain_Category() {
		return main_Category;
	}
	public void setMain_Category(String main_Category) {
		this.main_Category = main_Category;
	}
	public String getMiddle_Category() {
		return middle_Category;
	}
	public void setMiddle_Category(String middle_Category) {
		this.middle_Category = middle_Category;
	}
	public String getSub_Category() {
		return sub_Category;
	}
	public void setSub_Category(String sub_Category) {
		this.sub_Category = sub_Category;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getMapx() {
		return mapx;
	}
	public void setMapx(String mapx) {
		this.mapx = mapx;
	}
	public String getMapy() {
		return mapy;
	}
	public void setMapy(String mapy) {
		this.mapy = mapy;
	}
	public String getOverview() {
		return overview;
	}
	public void setOverview(String overview) {
		this.overview = overview;
	}
}
