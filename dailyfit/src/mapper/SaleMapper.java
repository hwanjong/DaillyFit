package mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import bean.Sale;

public interface SaleMapper {
	void addSaleProduct(Sale sale);
	ArrayList<Sale> getSaleList(@Param("shopNum")String shopNum);
}
