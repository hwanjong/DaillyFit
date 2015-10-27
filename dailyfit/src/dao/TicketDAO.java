package dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import bean.Sale;
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
			sale.setShopName(shopMapper.getShopinfo(Integer.toString(sale.getShopNum())).getShopName());
		}
		session.close();
		return buyList;
	}

	public boolean updateUse(String saleId) {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		try {
			BuyMapper mapper = session.getMapper(BuyMapper.class);
			Sale sale = mapper.getBuyInfo(saleId);
			if(sale.getAvailability() > sale.getWaitCount()){
				mapper.countUpWaitCount(sale.getWaitCount()+1,saleId);
				session.commit();
			}else{
				return false;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		return true;
	}

}
