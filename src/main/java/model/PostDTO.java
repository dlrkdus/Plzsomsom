package model;

import java.sql.Date;

/*생성자 Date 부분 수정 -> java.util.Date와 jav.sql.Date 추가*/
public class PostDTO {
	private int postNum;
	private String postContent;
	private Date postDate;
	private String title;
	private int price;
	private int count;
	private String time;
	private String photo;
	private String productCategoryNum;
	private String postWriterId;
	
	/*생성자*/
	public PostDTO() {}
	
	public PostDTO(String postContent, int price, int count, String time, String photo, String productCategoryNum, String title, java.util.Date postDate, int postNum) {
		this.postContent = postContent;
		this.price = price;
		this.count = count;
		this.time = time;
		this.photo = photo;
		this.productCategoryNum = productCategoryNum;
		this.title = title;
		this.postDate = (java.sql.Date)postDate;
		this.postNum = postNum;
	}
	
	public PostDTO(String postContent, int price, int count, String time,
			String photo, String productCategoryNum, String postWriterId, String title, java.util.Date postDate) {
		this.postContent = postContent;
		this.price = price;
		this.count = count;
		this.time = time;
		this.photo = photo;
		this.productCategoryNum = productCategoryNum;
		this.postWriterId = postWriterId;
		this.title = title;
		this.postDate = (java.sql.Date)postDate;
	}
	
	public PostDTO(int postNum, String postContent, int price, int count, String time,
			String photo, String productCategoryNum, String postWriterId, String title, java.util.Date postDate) {
		this.postNum = postNum;
		this.postContent = postContent;
		this.price = price;
		this.count = count;
		this.time = time;
		this.photo = photo;
		this.productCategoryNum = productCategoryNum;
		this.postWriterId = postWriterId;
		this.title = title;
		this.postDate = (java.sql.Date)postDate;
	}

	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public String getProductCategoryNum() {
		return productCategoryNum;
	}
	public void setProductCategoryNum(String productCategoryNum) {
		this.productCategoryNum = productCategoryNum;
	}
	public String getPostWriterId() {
		return postWriterId;
	}
	public void setPostWriterId(String postWriterId) {
		this.postWriterId = postWriterId;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date date) {
		postDate = date;
	}
	
}
