package controller.transaction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.userInfo.UserSessionUtils;
import model.TransactionDTO;
import model.service.TransactionManager;

public class InsertTransactionController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(InsertTransactionController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	HttpSession session = request.getSession();
        String userId = request.getParameter("postWriterId");
        userId = UserSessionUtils.getLoginUserId(session);
        int productCategoryNum = Integer.parseInt(request.getParameter("productCategoryNum"));

         // POST request (회원정보가 parameter로 전송됨)
            TransactionDTO trans = new TransactionDTO(
               userId,
               Integer.parseInt(request.getParameter("postNum"))
               );
        
          log.debug("Insert Transaction : {}", trans);

        TransactionManager manager = TransactionManager.getInstance();
        manager.insertTransaction(trans);
        manager.updateCount(Integer.parseInt(request.getParameter("postNum")));
         
        request.setAttribute("postNum", Integer.parseInt(request.getParameter("postNum")));
        request.setAttribute("productCategoryNum", Integer.parseInt(request.getParameter("productCategoryNum")));
        
        return "redirect:/post/list" + "?productCategoryNum=" + productCategoryNum;   // 성공 시 거래완료 화면으로 redirect  
    }
}