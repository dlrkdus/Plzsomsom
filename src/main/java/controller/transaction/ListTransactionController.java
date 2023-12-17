package controller.transaction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.userInfo.UserSessionUtils;
import model.dao.TransactionDAO;
import model.TransactionDTO;

public class ListTransactionController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		//추가부분
		HttpSession session = request.getSession();
		String userId = UserSessionUtils.getLoginUserId(session);
		
		TransactionDAO trans = new TransactionDAO();
		
		List<TransactionDTO> transList = trans.selectTransactionList(userId);
		
		request.setAttribute("transList", transList);
		
		return "/mypage/transactionList.jsp";
	}

}

