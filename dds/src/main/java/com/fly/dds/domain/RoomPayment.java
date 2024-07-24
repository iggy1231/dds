package com.fly.dds.domain;

public class RoomPayment {
	private long sale_num; // 숙소 주문 번호
	private String reg_date; // 예약일자
	private String sdate;
	private String edate;
	private String total_price; 
	private long coupon_price;
	private long point_price;
	private long discount; // 할인된 금액
	private String final_price; // 결제 금액
	private String name;
	private long detail_num; // 숙소 상세정보(객실 옵션)의 기본키번호
	private long user_num;
	
	private String subject; // 상품명
	private String thumbnail; // 상품 썸네일
	
	// room_pay_cash
	private long ok_num;
	private String card_name;
	
	public long getOk_num() {
		return ok_num;
	}
	public void setOk_num(long ok_num) {
		this.ok_num = ok_num;
	}
	public String getCard_name() {
		return card_name;
	}
	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}
	public long getSale_num() {
		return sale_num;
	}
	public void setSale_num(long sale_num) {
		this.sale_num = sale_num;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	public long getCoupon_price() {
		return coupon_price;
	}
	public void setCoupon_price(long coupon_price) {
		this.coupon_price = coupon_price;
	}
	public long getPoint_price() {
		return point_price;
	}
	public void setPoint_price(long point_price) {
		this.point_price = point_price;
	}
	public long getDiscount() {
		return discount;
	}
	public void setDiscount(long discount) {
		this.discount = discount;
	}
	public String getFinal_price() {
		return final_price;
	}
	public void setFinal_price(String final_price) {
		this.final_price = final_price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getDetail_num() {
		return detail_num;
	}
	public void setDetail_num(long detail_num) {
		this.detail_num = detail_num;
	}
	public long getUser_num() {
		return user_num;
	}
	public void setUser_num(long user_num) {
		this.user_num = user_num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	
	
}
