package dao;

import java.util.ArrayList;

import mapper.UserMapper;
import mybatis.config.MyBatisManager;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import bean.User;

public class InfoDAO {
	public static SqlSessionFactory sqlSessionFactory = MyBatisManager.getInstance();
	
	public User getUser(User user){
		SqlSession session = sqlSessionFactory.openSession();
		User findUser =null;
		try{
			UserMapper mapper = session.getMapper(UserMapper.class);
			findUser=mapper.getUserInfo(user);
			System.out.println(findUser.getNicname());
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return findUser;
	}

}
