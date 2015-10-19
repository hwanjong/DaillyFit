package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import bean.Board;
import bean.User;
<<<<<<< HEAD
import mapper.BoardMapper;
=======
>>>>>>> 82d6bb046153b72e0ccac837f582949dd84fda7f
import mapper.UserMapper;
import mybatis.config.MyBatisManager;

public class InfoDAO {
	public static SqlSessionFactory sqlSessionFactory = MyBatisManager.getInstance();
	
	public Board getEvent(){
		SqlSession session = sqlSessionFactory.openSession();
		Board board =null;
		try{
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			board= mapper.curEvent();
		}catch(Exception e){
			return null;
		}finally{
			session.close();
		}
		return board;
	}
	
	public void updateEvent(Board board){
		SqlSession session = sqlSessionFactory.openSession();
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			mapper.updateEvent(board);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			session.close();
		}
	
	}
	public User getUser(User user){
		SqlSession session = sqlSessionFactory.openSession();
		User findUser =null;
		try{
			UserMapper mapper = session.getMapper(UserMapper.class);
			findUser=mapper.getUserInfo(user);
			System.out.println(findUser.getNicName());
		}catch(Exception e){
			return null;
		}finally{
			session.close();
		}
		return findUser;
	}
	
	public boolean joinUser(User user){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			UserMapper mapper = session.getMapper(UserMapper.class);
			mapper.insertUser(user);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
		return true;
	}
	
	public boolean isRegistedId(String inputId){
		SqlSession session = sqlSessionFactory.openSession();
		User findUser =null;
		try{
			UserMapper mapper = session.getMapper(UserMapper.class);
			findUser=mapper.checkId(inputId);
			System.out.println(findUser.getNicName());
		}catch(Exception e){
			return false;
		}finally{
			session.close();
		}
		return true;
	}
	
	public boolean updateUser(User user){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			UserMapper mapper = session.getMapper(UserMapper.class);
			mapper.updateUserInfo(user);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
		return true;
	}

}
