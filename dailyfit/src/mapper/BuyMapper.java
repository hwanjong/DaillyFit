package mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import bean.Sale;

public interface BuyMapper {

	void addBuy(Sale sale);
	ArrayList<Sale> getBuyListByUser(String userId);
	Sale getBuyInfo(String buyId);
	void countUpWaitCount(@Param("upCount")int upCount,@Param("buyId")String buyId);
	void countDownWaitCount(String buyId);
	void updatePost(@Param("buyId")String buyId, @Param("post")String post);
}
