package bean;

import java.io.Serializable;

public class Sale implements Serializable{
	int shopNum;
	int saleId;
	String saleType;
	String typeAmount;
	String salePrice;
	
	public Sale(String saleType,String typeAmount,String salePrice){
		this.saleType=saleType;
		this.typeAmount = typeAmount;
		this.salePrice= salePrice;
	}
	public int getShopNum() {
		return shopNum;
	}
	public void setShopNum(int shopNum) {
		this.shopNum = shopNum;
	}
	public int getSaleId() {
		return saleId;
	}
	public void setSaleId(int saleId) {
		this.saleId = saleId;
	}
	public String getSaleType() {
		return saleType;
	}
	public void setSaleType(String saleType) {
		this.saleType = saleType;
	}
	public String getTypeAmount() {
		return typeAmount;
	}
	public void setTypeAmount(String typeAmount) {
		this.typeAmount = typeAmount;
	}
	public String getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(String salePrice) {
		this.salePrice = salePrice;
	}
	
}
