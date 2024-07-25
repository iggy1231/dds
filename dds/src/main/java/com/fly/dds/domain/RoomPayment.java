package com.fly.dds.domain;

public class RoomPayment {
	private long sale_num; // 숙소 주문 번호
	private String reg_date; // 예약일자
	private String sdate;
	private String edate;
	private int total_price; 
	private int coupon_price;
	private int point_price;
	private int discount; // 할인된 금액
	private int final_price; // 결제 금액
	private String name;
	private long detail_num; // 숙소 상세정보(객실 옵션)의 기본키번호
	private long user_num;
	
	private String subject; // 상품명
	private String thumbnail; // 상품 썸네일
	
	// room_pay_cash
	private String imp_uid;
	private String card_name;
	
	private String nickName;

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

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public int getCoupon_price() {
		return coupon_price;
	}

	public void setCoupon_price(int coupon_price) {
		this.coupon_price = coupon_price;
	}

	public int getPoint_price() {
		return point_price;
	}

	public void setPoint_price(int point_price) {
		this.point_price = point_price;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getFinal_price() {
		return final_price;
	}

	public void setFinal_price(int final_price) {
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

	public String getImp_uid() {
		return imp_uid;
	}

	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}

	public String getCard_name() {
		return card_name;
	}

	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	
}
