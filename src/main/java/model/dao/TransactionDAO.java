package model.dao;
import java.io.IOException;
import model.TransactionDTO;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

public class TransactionDAO{
	private SqlSessionFactory sqlSessionFactory;
	private String namespace="model.dao.mybatis.mapper.TransactionMapper";
	
	public TransactionDAO() {
		
		
	      String resource = "mybatis-config.xml";
	      InputStream inputStream;
	      try {
	         inputStream = Resources.getResourceAsStream(resource);
	      } catch (IOException e) {
	         throw new IllegalArgumentException(e);
	      }
	      sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	   }
	
	public int insertTransaction(TransactionDTO Transaction) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        try {
            int n = sqlSession.insert(namespace+".insertTransaction",Transaction);
            if (n > 0) { sqlSession.commit(); } 
            return n;
        }
        finally {
            sqlSession.close();
        }
    }
	
	public int updateCount(int postNum) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		try {
			int result = sqlSession.update(namespace + ".updateCount", postNum);
			
			if(result > 0) {
				sqlSession.commit();
			}else {
				sqlSession.rollback();
			}
			
			return result;
		}finally {
			sqlSession.close();
		}
	}
	
	public List<TransactionDTO> selectTransactionList(String userId){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		try {
			return sqlSession.selectList(namespace + ".selectTransactionList", userId);
		}finally {
			sqlSession.close();
		}
	}

}