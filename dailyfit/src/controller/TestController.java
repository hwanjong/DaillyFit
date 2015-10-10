package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hello.annotation.Mapping;
import hello.annotation.RootURL;
import hello.mv.ModelView;

@RootURL("/test")
public class TestController {
	@Mapping(url="/upload.ap")
	ModelView getFindGeoLocationPage(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/test/upload");
		return mv;
	}
	
	@Mapping(url="/upload.ap",method="post")
	ModelView uploadPost(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/test/upload");
		return mv;
	}
	
	@Mapping(url="/userView.ap")
	ModelView userPage(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/test/userView");
		return mv;
	}
}
