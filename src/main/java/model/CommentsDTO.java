package model;

import java.util.Date;


/**
 * 댓글 관리를 위해 필요한 도메인 클래스. Comments 테이블과 대응됨
 */
public class CommentsDTO {
	private int commentsNum;
	private String commContent;
	private String commWriterId;
	private int postNum;
	private Date commWriteDate;
	
	
	//insert를 위한 생성자

	public CommentsDTO(String commContent, String commWriterId, int postNum, Date commWriteDate) {
		super();
		this.commContent = commContent;
		this.commWriterId = commWriterId;
		this.postNum = postNum;
		this.commWriteDate = commWriteDate;
		
	}	
	
	
	public CommentsDTO(int commentsNum, String commContent, Date commWriteDate, int postNum, String commWriterId) {
		super();
		this.commentsNum = commentsNum;
	}	
	
	
	//getter, setter


	public int getCommentsNum() {
		return commentsNum;
	}


	public void setCommentsNum(int commentsNum) {
		this.commentsNum = commentsNum;
	}


	public String getCommContent() {
		return commContent;
	}


	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}


	public Date getCommWriteDate() {
		return commWriteDate;
	}


	public void setCommWriteDate(Date commWriteDate) {
		this.commWriteDate = commWriteDate;
	}


	public int getPostNum() {
		return postNum;
	}


	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}


	public String getCommWriterId() {
		return commWriterId;
	}


	public void setCommWriterId(String commWriterId) {
		this.commWriterId = commWriterId;
	}





	@Override
	public String toString() {
		return "Comments [commentsNum=" + commentsNum + ", commContent=" + commContent + ", commWriterId="
				+ commWriterId + ", postNum=" + postNum + ", commWriteDate=" + commWriteDate + "]";
	
	}



	
}



	
	
	
	