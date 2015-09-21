package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Shop;
import dao.InfoDAO;
import dao.ShopDAO;
import hello.annotation.Mapping;
import hello.annotation.RootURL;
import hello.mv.ModelView;

@RootURL("/check")
public class CheckController {
	
	@Mapping(url="/idcheck.ap",method="post")
	ModelView isRegistedID(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/jsonView");
		InfoDAO dao = new InfoDAO();
		String inputId = request.getParameter("inputId");
		if(dao.isRegistedId(inputId)){
			mv.setModel("check", "yes");
		}
		return mv;
	}
	
	@Mapping(url="/searchShop.ap",method="post")
	ModelView getShopListByName(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/shopJson");
		ShopDAO dao = new ShopDAO();
		String shopName = request.getParameter("shopName");
		ArrayList<Shop> shopList = dao.getShopListByName(shopName);
		mv.setModel("shopList", shopList);
		return mv;
	}
	
	@Mapping(url="/delShop.ap",method="post")
	ModelView delShopByShopNum(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/jsonView");
		ShopDAO dao = new ShopDAO();
		String shopNum = request.getParameter("shopNum");
		String adminPw = request.getParameter("adminPw");
		if(adminPw.equals("sunny")){
			dao.deleteShop(shopNum);
			mv.setModel("check", "yes");
			return mv;
		}else{
			mv.setModel("check", "no");
			return mv;
		}
	}
	
	
}