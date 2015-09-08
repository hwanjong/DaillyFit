package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Shop;
import dao.ShopDAO;
import hello.annotation.Mapping;
import hello.annotation.RootURL;
import hello.mv.ModelView;

@RootURL("/admin")
public class AdminController {

	@Mapping(url="/searchGoogle.ap")
	ModelView getSearchGooglePage(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/admin/searchShopGoogle");
		return mv;
	}
	@Mapping(url="/geoLocation.ap")
	ModelView getFindGeoLocationPage(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/admin/findGeoLocation");
		ShopDAO dao =new ShopDAO();
		ArrayList<Shop> shopList = dao.getAllShopInfo();
		
		return mv;
	}
}
