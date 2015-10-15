package dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import bean.Sale;
import bean.Shop;
import mapper.BuyMapper;
import mapper.SaleMapper;
import mapper.ShopMapper;
import mybatis.config.MyBatisManager;

public class ShopDAO {
	public static SqlSessionFactory sqlSessionFactory = MyBatisManager.getInstance();
	
	public void addBuyList(ArrayList<Sale> buyList, String userId){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			BuyMapper mapper = session.getMapper(BuyMapper.class);
			for(Sale sale : buyList){
				sale.setUserId(userId);
				mapper.addBuy(sale);
			}
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	public Sale getSale(String saleId){
		SqlSession session = sqlSessionFactory.openSession();
		Sale sale = null;
		try{
			SaleMapper mapper = session.getMapper(SaleMapper.class);
			sale=  mapper.getSaleItem(saleId);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			session.close();
		}
		return sale;
	}
	public Shop getShopInfo(String shopNum){
		SqlSession session = sqlSessionFactory.openSession();
		Shop shop = null;
		try{
			ShopMapper mapper = session.getMapper(ShopMapper.class);
			shop=  mapper.getShopInfo(shopNum);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			session.close();
		}
		return shop;
	}
	public ArrayList<Sale> getSaleProduct(String shopNum){
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<Sale> saleList = null;
		try{
			SaleMapper mapper = session.getMapper(SaleMapper.class);
			saleList = mapper.getSaleList(shopNum);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			session.close();
		}
		return saleList;
	}
	

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

	public void updateLocation(Shop shop){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			ShopMapper mapper = session.getMapper(ShopMapper.class);
			mapper.updateLocateInfo(shop);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
	}

	public ArrayList<Shop> getRangeShop(String lat,String lng, boolean product) {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<Shop> shopList = null;
		try{
			ShopMapper mapper = session.getMapper(ShopMapper.class);
			if(product) shopList=  mapper.getRangeProduct(lat,lng);
			else shopList=  mapper.getRangeShop(lat,lng);


			System.out.println("찾은 shop갯수 : "+shopList.size());
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			session.close();
		}
		return shopList;
	}

	public ArrayList<Shop> getShopListByName(String shopName) {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<Shop> shopList = null;
		try{
			ShopMapper mapper = session.getMapper(ShopMapper.class);
			shopList=  mapper.getShopSearchList(shopName);
			System.out.println("찾은 shop갯수 : "+shopList.size());
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			session.close();
		}
		return shopList;
	}

	public Shop getshopInfo(String shopNum) {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		Shop shop=null;
		try{
			ShopMapper mapper = session.getMapper(ShopMapper.class);
			shop=  mapper.getShopinfo(shopNum);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			session.close();
		}
		return shop;

	}

	public void deleteShop(String shopNum) {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		try{
			ShopMapper mapper = session.getMapper(ShopMapper.class);
			mapper.deleteShop(shopNum);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
	}

	public boolean addShop(Shop shop){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			ShopMapper mapper = session.getMapper(ShopMapper.class);
			mapper.addShop(shop);
			session.commit();

			int lastIndexShopNum = mapper.lastIndex();
			SaleMapper saleMapper = session.getMapper(SaleMapper.class);
			for(Sale sale : shop.getSaleList()){
				sale.setShopNum(lastIndexShopNum);
				saleMapper.addSaleProduct(sale);
			}

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