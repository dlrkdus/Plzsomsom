package model.dao.mapper;

import java.util.List;

import model.WishItemDTO;


public interface WishItemMapper {

	public void insertWishItem(WishItemDTO wishItem); 
	List<WishItemDTO> selectWishItem(String userId);
    public int deleteWishItem(int wishNum);  
    boolean findWishItem(WishItemDTO wishItem);

}
