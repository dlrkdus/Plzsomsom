package model.service;

import java.util.List;

import model.WishItemDTO;
import model.dao.WishItemDAO;

/**
 * 사용자 관리 API를 사용하는 개발자들이 직접 접근하게 되는 클래스.
 * UserDAO를 이용하여 데이터베이스에 데이터 조작 작업이 가능하도록 하며,
 * 데이터베이스의 데이터들을 이용하여 비지니스 로직을 수행하는 역할을 한다.
 * 비지니스 로직이 복잡한 경우에는 비지니스 로직만을 전담하는 클래스를 
 * 별도로 둘 수 있다.
 */
public class WishItemManager {
	private static WishItemManager wishMan = new WishItemManager();
	private WishItemDAO wishDAO;

	private WishItemManager() {
		try {
			wishDAO = new WishItemDAO();
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	public static WishItemManager getInstance() {
		return wishMan;
	}
	
	public int insertWishItem(WishItemDTO wish){ 
		return wishDAO.insertWishItem(wish);
	}

	public int deleteWishItem(int wishNum) {
		return wishDAO.deleteWishItem(wishNum);
	}
	
    public List<WishItemDTO> selectWishItem(String userId) {
        return wishDAO.selectWishItem(userId);
    }

	
	public boolean findWishItem(WishItemDTO wish) {	
		return wishDAO.findWishItem(wish);
	}



	public WishItemDAO getWishItemDAO() {
		return this.wishDAO;
	}
	

}