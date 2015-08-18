package controller;

import hello.annotation.Mapping;
import hello.annotation.RootURL;
import hello.mv.ModelView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RootURL("/")
public class RootController {
	
	@Mapping(url="/main.ap")
	ModelView getMainPage(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/main");
		return mv;
		
	}
	@Mapping(url="/shop.ap")
	ModelView getShopPage(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/shop");
		return mv;
		
	}

}