package dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.eclipse.jdt.internal.compiler.parser.ParserBasicInformation;

import bean.Board;
import bean.User;
import mapper.BoardMapper;
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
	public void deleteNotice(Board board){
		SqlSession session = sqlSessionFactory.openSession();
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			mapper.deleteNotice(board);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			session.close();
		}
	}
	public void insertNotice(Board board){
		SqlSession session = sqlSessionFactory.openSession();
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			mapper.insertNotice(board);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			session.close();
		}
	}
	
	public void updateNotice(Board board){
		SqlSession session = sqlSessionFactory.openSession();
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			mapper.updateNotice(board);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			session.close();
		}
	}
	public ArrayList<Board> getNotices(){
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<Board> boardList =null;
		try{
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			boardList= mapper.noticeList();
		}catch(Exception e){
			return null;
		}finally{
			session.close();
		}
		return boardList;
	}
	
	public Board getNotice(Board target){
		SqlSession session = sqlSessionFactory.openSession();		
		Board board= new Board();
		try{
			BoardMapper mapper = session.getMapper(BoardMapper.class);			
			board= mapper.getNotice(target);
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
	
	public void insertQestion(Board board){
		SqlSession session = sqlSessionFactory.openSession();
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			mapper.insertQestion(board);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			session.close();
		}
	}
	
	public ArrayList<Board> getQuestionAD(){
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<Board> boardList =null;
		try{
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			boardList= mapper.ADList();
		}catch(Exception e){
			return null;
		}finally{
			session.close();
		}
		return boardList;
	}
	

}
