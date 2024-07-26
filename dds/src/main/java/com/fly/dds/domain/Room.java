package com.fly.dds.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Room {
	private long num;
	private String subject;
	private String content;
	private String caution;
	private String room_type;
	private String reg_date;
	private int post_num;
	private String addr1;
	private String addr2;

	private int active;

	private long key_num;
	private String key_value;
	private long option_num;
	private String option_content;
	private int option_price;

	private String facility_content;

	private long photo_num; // fileNum
	private List<MultipartFile> addFiles; // 추가 이미지
	private String photo; // filename

	private MultipartFile thumbnailFile;
	private String thumbnail;

	// detail
	private long facility_num;
	private List<String> detail_contents;
	private String detail_content;
	private List<Long> detail_nums;
	private long detail_num;
	private List<Integer> peoples;
	private int people;
	private List<Integer> prices;
	private int price;
	private List<Integer> discounts;
	private int discount;
	private List<String> names;
	private String name;
	private List<MultipartFile> detailPhotoFiles;
	private List<String> detail_photos;
	private String detail_photo;
	private List<Long> points;

	private long point;
	
	private double rating;
	private int ratingCount;
	
	private String sdate;
	private String edate;
	private int days;
	
	private long saleNum;
    private long detailNum;
    private long userNum;
	
	

	public long getSaleNum() {
		return saleNum;
	}

	public void setSaleNum(long saleNum) {
		this.saleNum = saleNum;
	}

	public long getDetailNum() {
		return detailNum;
	}

	public void setDetailNum(long detailNum) {
		this.detailNum = detailNum;
	}

	public long getUserNum() {
		return userNum;
	}

	public void setUserNum(long userNum) {
		this.userNum = userNum;
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

	public int getDays() {
		return days;
	}

	public void setDays(int days) {
		this.days = days;
	}

	public long getNum() {
		return num;
	}

	public void setNum(long num) {
		this.num = num;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCaution() {
		return caution;
	}

	public void setCaution(String caution) {
		this.caution = caution;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public int getPost_num() {
		return post_num;
	}

	public void setPost_num(int post_num) {
		this.post_num = post_num;
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

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public long getKey_num() {
		return key_num;
	}

	public void setKey_num(long key_num) {
		this.key_num = key_num;
	}

	public String getKey_value() {
		return key_value;
	}

	public void setKey_value(String key_value) {
		this.key_value = key_value;
	}

	public long getOption_num() {
		return option_num;
	}

	public void setOption_num(long option_num) {
		this.option_num = option_num;
	}

	public String getOption_content() {
		return option_content;
	}

	public void setOption_content(String option_content) {
		this.option_content = option_content;
	}

	public int getOption_price() {
		return option_price;
	}

	public void setOption_price(int option_price) {
		this.option_price = option_price;
	}

	public String getFacility_content() {
		return facility_content;
	}

	public void setFacility_content(String facility_content) {
		this.facility_content = facility_content;
	}

	public long getPhoto_num() {
		return photo_num;
	}

	public void setPhoto_num(long photo_num) {
		this.photo_num = photo_num;
	}

	public List<MultipartFile> getAddFiles() {
		return addFiles;
	}

	public void setAddFiles(List<MultipartFile> addFiles) {
		this.addFiles = addFiles;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public MultipartFile getThumbnailFile() {
		return thumbnailFile;
	}

	public void setThumbnailFile(MultipartFile thumbnailFile) {
		this.thumbnailFile = thumbnailFile;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public long getFacility_num() {
		return facility_num;
	}

	public void setFacility_num(long facility_num) {
		this.facility_num = facility_num;
	}

	public List<String> getDetail_contents() {
		return detail_contents;
	}

	public void setDetail_contents(List<String> detail_contents) {
		this.detail_contents = detail_contents;
	}

	public String getDetail_content() {
		return detail_content;
	}

	public void setDetail_content(String detail_content) {
		this.detail_content = detail_content;
	}

	public List<Long> getDetail_nums() {
		return detail_nums;
	}

	public void setDetail_nums(List<Long> detail_nums) {
		this.detail_nums = detail_nums;
	}

	public long getDetail_num() {
		return detail_num;
	}

	public void setDetail_num(long detail_num) {
		this.detail_num = detail_num;
	}

	public List<Integer> getPeoples() {
		return peoples;
	}

	public void setPeoples(List<Integer> peoples) {
		this.peoples = peoples;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public List<Integer> getPrices() {
		return prices;
	}

	public void setPrices(List<Integer> prices) {
		this.prices = prices;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public List<Integer> getDiscounts() {
		return discounts;
	}

	public void setDiscounts(List<Integer> discounts) {
		this.discounts = discounts;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public List<String> getNames() {
		return names;
	}

	public void setNames(List<String> names) {
		this.names = names;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<MultipartFile> getDetailPhotoFiles() {
		return detailPhotoFiles;
	}

	public void setDetailPhotoFiles(List<MultipartFile> detailPhotoFiles) {
		this.detailPhotoFiles = detailPhotoFiles;
	}

	public List<String> getDetail_photos() {
		return detail_photos;
	}

	public void setDetail_photos(List<String> detail_photos) {
		this.detail_photos = detail_photos;
	}

	public String getDetail_photo() {
		return detail_photo;
	}

	public void setDetail_photo(String detail_photo) {
		this.detail_photo = detail_photo;
	}

	public List<Long> getPoints() {
		return points;
	}

	public void setPoints(List<Long> points) {
		this.points = points;
	}

	public long getPoint() {
		return point;
	}

	public void setPoint(long point) {
		this.point = point;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public int getRatingCount() {
		return ratingCount;
	}

	public void setRatingCount(int ratingCount) {
		this.ratingCount = ratingCount;
	}

}
