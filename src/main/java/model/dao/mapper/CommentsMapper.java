package model.dao.mapper;

import java.util.List;


import model.CommentsDTO;

public interface CommentsMapper {

	public int insertComments(CommentsDTO comments);		//댓글 추가
 
	public int updateComments(CommentsDTO comments);		//댓글 수정

	public int deleteComments(int commentsNum);		//댓글 삭제
	
	public CommentsDTO getComments(int commentsNum);		//댓글 조회

	public List<CommentsDTO> getCommentsList(int postNum);		//게시글 페이지 정보와 게시글 번호에 맞는 댓글 리스트 조회



}
