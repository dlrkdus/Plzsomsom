package model.service;

import java.sql.SQLException;

import model.TransactionDTO;
import model.dao.TransactionDAO;
import java.util.List;


public class TransactionManager {
	private static TransactionManager transMan = new TransactionManager();
	private TransactionDAO transDAO;

	private TransactionManager() {
		try {
			transDAO = new TransactionDAO();
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	public static TransactionManager getInstance() {
		return transMan;
	}
	
	public int insertTransaction(TransactionDTO trans) throws SQLException, ExistingUserException { 
		return transDAO.insertTransaction(trans);
	}
	
	public int updateCount(int postNum) throws SQLException{
		return transDAO.updateCount(postNum);
	}
	
    public List<TransactionDTO> selectTransactionList(String userId) {
        return transDAO.selectTransactionList(userId);
    }
	


	public TransactionDAO getTransactionDAO() {
		return this.transDAO;
	}
}