package dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import bean.Shop;
import bean.User;
import mapper.ShopMapper;
import mybatis.config.MyBatisManager;

public class ShopDAO {
public static SqlSessionFactory sqlSessionFactory = MyBatisManager.getInstance();
	
	public ArrayList<Shop> getAllShopInfo(){
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<Shop> shopList = null;
		try{
			ShopMapper mapper = session.getMapper(ShopMapper.class);
			shopList=  mapper.getAllShop();
			System.out.println("찾은 shop갯수 : "+shopList.size());
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			session.close();
		}
		return shopList;
	}
}