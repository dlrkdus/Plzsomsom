package model.dao.mapper;

import java.util.List;

import model.TransactionDTO;

public interface TransactionMapper {

	public void insertTransaction(TransactionDTO Transaction); 
	List<TransactionDTO> selectTransactionList(String userId);
	int updateCount(int postNum);
}