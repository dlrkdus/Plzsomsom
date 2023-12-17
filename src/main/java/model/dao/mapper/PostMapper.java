/*게시글 조회 메소드 수정*/
package model.dao.mapper;

import java.util.List;
import model.PostDTO;

public interface PostMapper {
	int insertPost(PostDTO post);
	
	int updatePost(PostDTO post);
	
	int deletePost(int postNum);
	
	PostDTO getPost(int postNum);
	
	List<PostDTO> getPostList(String productCategoryNum);
	
	List<PostDTO> getSearchPost(String word);
}
