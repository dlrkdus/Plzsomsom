package controller.wishItem;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.userInfo.UserSessionUtils;
import model.WishItemDTO;
import model.service.WishItemManager;

public class InsertWishItemController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(InsertWishItemController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	

    	HttpSession session = request.getSession();
        String userId = request.getParameter("postWriterId");
        userId = UserSessionUtils.getLoginUserId(session);
        
    	// POST request (회원정보가 parameter로 전송됨)
       	WishItemDTO wish = new WishItemDTO(
       		Integer.parseInt(request.getParameter("postNum")),
			userId);
			
		
        log.debug("Insert WishItem : {}", wish);

		WishItemManager manager = WishItemManager.getInstance();
		boolean isWishAlreadyExisted = manager.findWishItem(wish);

		if (isWishAlreadyExisted) {
			return "redirect:/post/Board.jsp";
		}
		else{
			manager.insertWishItem(wish);
		    return "redirect:/wishItem/list";
		}
    	
    	
	        
    }
}
