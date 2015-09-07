package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hello.annotation.Mapping;
import hello.annotation.RootURL;
import hello.mv.ModelView;

@RootURL("/admin")
public class AdminController {

	@Mapping(url="/searchGoogle.ap")
	ModelView getSearchGooglePage(HttpServletRequest request,HttpServletResponse response){
		System.out.println("컴히얼");
		ModelView mv = new ModelView("/admin/searchShopGoogle");
		return mv;
	}
}
