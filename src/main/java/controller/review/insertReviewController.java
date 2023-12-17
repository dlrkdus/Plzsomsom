package controller.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.userInfo.UserSessionUtils;
import model.dao.ReviewDAOImpl;
import model.ReviewDTO;

public class insertReviewController implements Controller {
   private static final Logger log = LoggerFactory.getLogger(insertReviewController.class);
   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      // TODO Auto-generated method stub
      HttpSession session = request.getSession();
      String reviewWriterId = UserSessionUtils.getLoginUserId(session);
      
      ReviewDTO review = new ReviewDTO(
            request.getParameter("reviewContent"),
            null,
            Integer.parseInt(request.getParameter("postNum")), 
            reviewWriterId,
            request.getParameter("postWriterId")
            );
      
      try {

         ReviewDAOImpl reviewDao = new ReviewDAOImpl();
         reviewDao.insertReview(review);
         log.debug("Insert Review : {}", review);
         
           return "redirect:/mypage/myreview";
      }catch (Exception e) {      // 예외 발생 시 입력 form으로 forwarding
            request.setAttribute("creationFailed", true);
         request.setAttribute("exception", e);
         request.setAttribute("review", review);
         return "/mypage/reviewInsert.jsp";
      }
   }

}