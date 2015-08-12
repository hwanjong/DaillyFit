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
		System.out.println("요청받음");
		ModelView mv = new ModelView("/main");
		return mv;
		
	}

}
