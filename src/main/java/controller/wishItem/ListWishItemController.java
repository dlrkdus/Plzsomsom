//ListWishItemController
package controller.wishItem;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.userInfo.UserSessionUtils;
import model.dao.WishItemDAO;
import model.WishItemDTO;

public class ListWishItemController implements Controller{

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      // TODO Auto-generated method stub
	  HttpSession session = request.getSession();
	  String userId = UserSessionUtils.getLoginUserId(session);
	  
      WishItemDAO wish = new WishItemDAO();
      List<WishItemDTO> wishList = wish.selectWishItem(userId);
      
      // commList 객체를 request에 저장하여 커뮤니티 리스트 화면으로 이동(forwarding)
      request.setAttribute("wishList", wishList);   
      
      return "/mypage/wishList.jsp";
   }

}