package controller.wishItem;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.service.WishItemManager;

public class DeleteWishItemController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(DeleteWishItemController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		int wishNum = Integer.parseInt(request.getParameter("wishNum"));
    	log.debug("Delete WishItem : {}", wishNum);

		WishItemManager manager = WishItemManager.getInstance();		
				
		manager.deleteWishItem(wishNum);	
		
		//위시리스트 삭제
		return "redirect:/wishItem/list";		// 위시리스트로 이동
		
		
	}
}