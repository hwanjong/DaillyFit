package mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import bean.Sale;

public interface BuyMapper {

	void addBuy(Sale sale);
	ArrayList<Sale> getBuyListByUser(String userId);
	Sale getBuyInfo(String saleId);
	void countUpWaitCount(@Param("upCount")int upCount,@Param("saleId")String saleId);
}
