package controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Comparator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils.Collections;

import bean.Shop;
import bean.User;
import dao.InfoDAO;
import dao.ShopDAO;
import hello.annotation.Mapping;
import hello.annotation.RootURL;
import hello.mv.ModelView;

@RootURL("/")
public class RootController {
	
	@Mapping(url="/registDevice.ap")
	ModelView registDevice(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/main");
		return mv;
	}
	@Mapping(url="/main.ap")
	ModelView getMainPage(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/main");
		System.out.println("main요청");
		return mv;
	}
	@Mapping(url="/shop.ap")
	ModelView getShopPage(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/shop");
		return mv;
	}
	@Mapping(url="/mypage")
	ModelView getMyPage(HttpServletRequest request,HttpServletResponse response){
		ModelView mv=null;
		User user = (User) request.getSession().getAttribute("user");
		if(user==null){
			mv = new ModelView("/join");
		}else{
			mv = new ModelView("/mypage");
		}
		return mv;
	}
	@Mapping(url="/join",method="post",bean="bean.User")
	ModelView doJoin(HttpServletRequest request,HttpServletResponse response,Object obj){
		ModelView mv = new ModelView("redirect:/dailyfit/main.ap");
		User user = (User) obj;
		InfoDAO infoDao = new InfoDAO();
		if(infoDao.joinUser(user)){
			request.getSession().setAttribute("user", user);
		}
		return mv;
	}
	
	@Mapping(url="/rangeShop.ap",method="post")
	ModelView ajaxRangeShop(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/shopJson");
		ShopDAO dao = new ShopDAO();
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
		ArrayList<Shop> shopList = null;
		shopList= dao.getRangeShop(lat,lng);
		for(Shop shop:shopList){
			double lat1=Double.parseDouble(lat);
			double lng1=Double.parseDouble(lng);
			
			double lat2=shop.getLat();
			double lng2=shop.getLng();
			double theta = lng1 - lng2;
			double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2))+ Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2))* Math.cos(deg2rad(theta));
			dist=Math.acos(dist);
			dist=rad2deg(dist);
			dist=dist*60*1.1515;
			dist=dist*1.609344;
			if(dist>0.3) dist-=0.3;
			shop.setDistance(new DecimalFormat("#.##").format(dist));
		}
		Comparator<Shop> comparator = new Comparator<Shop>(){

			@Override
			public int compare(Shop o1, Shop o2) {
				// TODO Auto-generated method stub
				return Double.parseDouble(o1.getDistance()) > Double.parseDouble(o2.getDistance()) ? 1:-1;
			}
			
		};
		java.util.Collections.sort(shopList, comparator);
		
		mv.setModel("shopList", shopList);
		
		return mv;
	}
	
	
	private double rad2deg(double rad){
		return (rad*180.0/Math.PI);
	}
	private double deg2rad(double deg){
		return (deg*Math.PI/180.0);
	}
	
	@Mapping(url="/noShop.ap",method="get")
	ModelView getNoShopPage(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/noShop");
		String shopNum = request.getParameter("shopNum");
		ShopDAO dao = new ShopDAO();
		Shop shop=dao.getshopInfo(shopNum);
		mv.setModel("shop", shop);
		return mv;
	}
	@Mapping(url="/login",method="post",bean="bean.User")
	ModelView doLogin(HttpServletRequest request,HttpServletResponse response,Object obj){
		ModelView mv = new ModelView("redirect:/dailyfit/main.ap");
		User user = (User) obj;
		InfoDAO infoDao = new InfoDAO();
		User userInfo = infoDao.getUser(user);
		if(userInfo!=null)	request.getSession().setAttribute("user", userInfo);
		return mv;
	}
	
	@Mapping(url="/logout.ap")
	ModelView doLogout(HttpServletRequest request,HttpServletResponse response){
		System.out.println("로그아웃요청");
		request.getSession().invalidate();
		ModelView mv = new ModelView("redirect:/dailyfit/main.ap");
		return mv;
	}
	

}