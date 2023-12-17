package controller;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.userInfo.DeleteUserController;
import controller.userInfo.ListUserController;
import controller.userInfo.LoginController;
import controller.userInfo.LogoutController;
import controller.userInfo.ProfileController;
import controller.userInfo.RegisterUserController;
import controller.userInfo.UpdateUserController;
import controller.userInfo.ViewUserController;
import controller.wishItem.DeleteWishItemController;
import controller.wishItem.InsertWishItemController;
import controller.wishItem.ListWishItemController;
import controller.comments.DeleteCommentsController;
import controller.comments.InsertCommentsController;
import controller.comments.ListCommentsController;
import controller.post.DeletePostController;
import controller.post.InsertPostController;
import controller.post.PostListController;
import controller.post.SearchPostController;
import controller.post.SelectPostController;
import controller.post.UpdatePostController;
import controller.review.ListReviewController;
import controller.review.insertReviewController;
import controller.transaction.InsertTransactionController;
import controller.transaction.ListTransactionController;

public class RequestMapping {
    private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);
    
    // 각 요청 uri에 대한 controller 객체를 저장할 HashMap 생성
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	// 각 uri에 대응되는 controller 객체를 생성 및 저장
        mappings.put("/", new ForwardController("index.jsp"));

        // 댓글 관련 request URI 추가
        mappings.put("/comments/list", new ListCommentsController());			//댓글 리스트 출력
        mappings.put("/comments/delete", new DeleteCommentsController());		//댓글 삭제
        mappings.put("/comments/insert", new InsertCommentsController());		//댓글 삽입

        // 게시글 관련 request URI 추가
        mappings.put("/post/insert", new InsertPostController()); //게시글 작성
        mappings.put("/post/insert/form", new ForwardController("/post/BoardContentForm.jsp")); //게시글 작성 폼
        mappings.put("/post/update/form", new UpdatePostController()); //GET
        mappings.put("/post/update", new UpdatePostController()); //POST
        mappings.put("/post/delete", new DeletePostController()); //게시글 삭제
        mappings.put("/post/detail", new SelectPostController()); //게시글 상세보기
        mappings.put("/post/list", new PostListController()); //게시글 리스트 조회
        mappings.put("/post/search", new SearchPostController()); //게시글 검색 조회
        mappings.put("/post/main", new ForwardController("/board/main.jsp"));
        
        //마이페이지 관련 request URI 추가
        mappings.put("/mypage/profile", new ProfileController());	//마이페이지 프로필 화면
        mappings.put("/mypage/profile/form", new ForwardController("/mypage/profileUpdate.jsp"));	//마이페이지 프로필 편집

        
        // 유저 관련 request URI 추가
        mappings.put("/user/login", new LoginController());      
        mappings.put("/user/register", new RegisterUserController());     
        mappings.put("/user/delete", new DeleteUserController());   
        mappings.put("/user/insert/form", new ForwardController("/user/registerForm.jsp"));
        mappings.put("/user/list", new ListUserController());      //사용자 리스트
        mappings.put("/user/logout", new LogoutController());      //로그아웃
        mappings.put("/user/login/form", new ForwardController("/user/loginForm.jsp"));
        mappings.put("/user/view", new ViewUserController());
        mappings.put("/user/update", new UpdateUserController());

        
        // 리뷰 관련 request URI 추가
        mappings.put("/mypage/myreview", new ListReviewController());
        mappings.put("/mypage/review/form", new ForwardController("/mypage/reviewInsert.jsp")); 
        mappings.put("/mypage/review/insert", new insertReviewController()); 
        
        
        // WishItem 관련 request URI 추가
        mappings.put("/wishItem/delete", new DeleteWishItemController());
        mappings.put("/wishItem/insert", new InsertWishItemController());
        mappings.put("/wishItem/list", new ListWishItemController());
        
        //Transaction 관련 request URI 추가
        mappings.put("/transaction/insert", new InsertTransactionController());
        mappings.put("/transaction/list", new ListTransactionController());
        
        
        
        logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {	
    	// 주어진 uri에 대응되는 controller 객체를 찾아 반환
        return mappings.get(uri);
    }
}