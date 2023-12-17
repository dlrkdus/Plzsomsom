package model;


public class TransactionDTO{

    private int transactionNum;
    private String userId;
    private int postNum;
    private String postWriterId;
    private String title;
    

    public TransactionDTO(){
    }

    public TransactionDTO(String userId, int postNum) {
    	this.userId = userId;
    	this.postNum = postNum;
    }
    
    public TransactionDTO(int transactionNum, String userId, int postNum){
        super();
        this.transactionNum=transactionNum;
        this.userId=userId;
        this.postNum=postNum;
        
    }
    // 추가부분
    public TransactionDTO(int transactionNum, String userId, int postNum, String postWriterId, String title){
        super();
        this.postWriterId = postWriterId;
        this.title = title;
    }
    public int getTransactionNum() {return transactionNum;}
	public void setTransactionNum(int transactionNum) {this.transactionNum=transactionNum;}

	public int getPostNum() {return postNum;}
	public void setPostNum(int postNum) {this.postNum=postNum;}

	public String getUserId() {return userId;}
	public void setUserId(String userId) {this.userId=userId;}

	public String getPostWriterId() {
		return postWriterId;
	}

	public void setPostWriterId(String postWriterId) {
		this.postWriterId = postWriterId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}


	
	


}