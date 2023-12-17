package model;

public class WishItemDTO{

    private int wishNum;
    private int postNum;
    private String userId;
    private String title;
    private int price;
    private int count;

    
    public WishItemDTO(){
        super();
    }

    public WishItemDTO(int wishNum, int postNum, String userId){
        super();
        this.wishNum=wishNum;
        this.postNum=postNum;
        this.userId=userId;      
    }

    public WishItemDTO(int postNum, String userId) {
		this.postNum = postNum;
		this.userId = userId;
	}
    
    public WishItemDTO(String title,int price,int count)
    {
    	super();
    	this.title=title;
    	this.price=price;
    	this.count=count;
    }
    
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getWishNum() {return wishNum;}
	public void setWishNum(int wishNum) {this.wishNum=wishNum;}

	public int getPostNum() {return postNum;}
	public void setPostNum(int postNum) {this.postNum=postNum;}
	
	public int getPrice() {return price;}
	public void setPrice(int price) {this.price=price;}
	
	public int getCount() {return count;}
	public void setCount(int count) {this.count=count;}

	public String getUserId() {return userId;}
	public void setUserId(String userId) {this.userId=userId;}

}