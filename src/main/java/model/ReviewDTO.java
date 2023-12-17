package model;

import java.sql.Date;

public class ReviewDTO {
   private int ReviewNum;
   private String reviewContent;
   private Date reviewWriteDate;
   private int postNum;
   private String reviewWriterId;
   private String postWriterId;
   
   public ReviewDTO() {}
   public ReviewDTO(String reviewContent, java.util.Date reviewWriteDate, int postNum, String reviewWriterId, String postWriterId) {
      this.reviewContent = reviewContent;
      this.reviewWriteDate = (java.sql.Date)reviewWriteDate;
      this.postNum = postNum;
      this.reviewWriterId = reviewWriterId;
      this.postWriterId = postWriterId;
   }
   
   public String getPostWriterId() {
      return postWriterId;
   }
   public void setPostWriterId(String postWriterId) {
      this.postWriterId = postWriterId;
   }
   public int getReviewNum() {
      return ReviewNum;
   }
   public void setReviewNum(int reviewNum) {
      ReviewNum = reviewNum;
   }
   public String getReviewContent() {
      return reviewContent;
   }
   public void setReviewContent(String reviewContent) {
      this.reviewContent = reviewContent;
   }
   public Date getReviewWriteDate() {
      return reviewWriteDate;
   }
   public void setReviewWriteDate(Date reviewWriteDate) {
      this.reviewWriteDate = reviewWriteDate;
   }
   public int getPostNum() {
      return postNum;
   }
   public void setPostNum(int postNum) {
      this.postNum = postNum;
   }
   public String getReviewWriterId() {
      return reviewWriterId;
   }
   public void setReviewWriterId(String reviewWriterId) {
      this.reviewWriterId = reviewWriterId;
   }
   
   @Override
   public String toString() {
      return "ReviewDTO [ReviewNum=" + ReviewNum + ", reviewContent=" + reviewContent + ", reviewWriteDate="
            + reviewWriteDate + ", postNum=" + postNum + ", reviewWriterId=" + reviewWriterId + "]";
   }

}