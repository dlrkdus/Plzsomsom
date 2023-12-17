//WishItemDAO

package model.dao;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

import model.WishItemDTO;


public class WishItemDAO{

   private String namespace="model.dao.mybatis.mapper.WishItemMapper";
   private SqlSessionFactory sqlSessionFactory;
   
   public WishItemDAO() {
            String resource = "mybatis-config.xml";
            InputStream inputStream;
            try {
               inputStream = Resources.getResourceAsStream(resource);
            } catch (IOException e) {
               throw new IllegalArgumentException(e);
            }
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
         }
      
    public int insertWishItem(WishItemDTO WishItem) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        try {
            int n = sqlSession.insert(namespace+".insertWishItem",WishItem);
            if (n > 0) { sqlSession.commit(); } 
            return n;
        }
        finally {
            sqlSession.close();
        }
    }

    public int deleteWishItem(int wishNum) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        try {
            int n = sqlSession.delete(namespace+".deleteWishItem",wishNum);
            if (n > 0) { sqlSession.commit(); } 
            return n;
        }
        finally {
           sqlSession.close();
        }
    }
    
   public List<WishItemDTO> selectWishItem(String userId){
      SqlSession sqlSession = sqlSessionFactory.openSession();
      
      try {
         return sqlSession.selectList(namespace + ".selectWishItem", userId);
      }finally {
         sqlSession.close();
      }
   }
   


   public boolean findWishItem(WishItemDTO wishDTO) {
      SqlSession sqlSession = sqlSessionFactory.openSession();
      try {
      String result = sqlSession.selectOne(namespace+".findWishItem", wishDTO);
      return Boolean.parseBoolean(result);
      }finally {
    	  sqlSession.close();
      }
   }

   

}