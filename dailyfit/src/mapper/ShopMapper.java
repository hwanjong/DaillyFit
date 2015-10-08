package mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import bean.Shop;

public interface ShopMapper {
	ArrayList<Shop> getAllShop();
	void updateLocateInfo(Shop shop);
	ArrayList<Shop> getRangeShop(@Param("lat")String lat, @Param("lng")String lng);
	ArrayList<Shop> getRangeProduct(@Param("lat")String lat, @Param("lng")String lng);
	Shop getShopinfo(@Param("shopNum")String shopNum);
	ArrayList<Shop> getShopSearchList(@Param("shopName")String shopName);
	void deleteShop(@Param("shopNum")String shopNum);
	void addShop(Shop shop);
	int lastIndex();
	
}
