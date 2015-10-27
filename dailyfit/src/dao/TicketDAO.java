package dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import bean.Sale;
import bean.Shop;
import bean.User;
import mapper.BuyMapper;
import mapper.ShopMapper;
import mybatis.config.MyBatisManager;

public class TicketDAO {
	public static SqlSessionFactory sqlSessionFactory = MyBatisManager.getInstance();
	
	public ArrayList<Sale> getBuyList(User user){
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<Sale> buyList = null;
		BuyMapper mapper = session.getMapper(BuyMapper.class);
		ShopMapper shopMapper = session.getMapper(ShopMapper.class);
		buyList = mapper.getBuyListByUser(user.getUserId());
		for(Sale sale: buyList){
			if(sale.getSaleType().equals("D")) sale.setSaleName("일일권");
			else if(sale.getSaleType().equals("C")) sale.setSaleName(sale.getTypeAmount()+"회 이용권");
			else if(sale.getSaleType().equals("M")) sale.setSaleName(sale.getTypeAmount()+"개월 이용권");
			else sale.setSaleName(sale.getTypeAmount()+"회 PT권");
			Shop shop = shopMapper.getShopinfo(Integer.toString(sale.getShopNum()));
			sale.setShopName(shop.getShopName());
			System.out.println(shop.getMainImgUrl());
			sale.setMainImgUrl(shop.getMainImgUrl().split("wtpwebapps")[1]);
		}
		session.close();
		return buyList;
	}

	public boolean updateUse(String buyId,int state) {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		try {
			BuyMapper mapper = session.getMapper(BuyMapper.class);
			Sale sale = mapper.getBuyInfo(buyId);
			if(state==1){
				if(sale.getAvailability() > sale.getWaitCount()){
					mapper.countUpWaitCount(sale.getWaitCount()+1,buyId);
					session.commit();
				}else{
					return false;
				}
			}else if(state==2){
				mapper.countDownWaitCount(buyId);
				session.commit();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public void updatePost(String buyId, String post) {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		try{
			BuyMapper mapper = session.getMapper(BuyMapper.class);
			mapper.updatePost(buyId,post);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
