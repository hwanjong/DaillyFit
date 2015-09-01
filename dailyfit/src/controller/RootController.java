package controller;

import hello.annotation.Mapping;
import hello.annotation.RootURL;
import hello.mv.ModelView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.MidiDevice.Info;

import bean.User;

import dao.InfoDAO;

@RootURL("/")
public class RootController {
	
	@Mapping(url="/registDevice")
	ModelView registDevice(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/main");
		return mv;
	}
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
	@Mapping(url="/join")
	ModelView getJoinPage(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/join");
		return mv;
	}
	
	@Mapping(url="/login",method="post",bean="bean.User")
	ModelView doLogin(HttpServletRequest request,HttpServletResponse response,Object obj){
		ModelView mv = new ModelView("/main");
		User user = (User) obj;
		System.out.println(user.getUserId());
		InfoDAO infoDao = new InfoDAO();
		infoDao.getUser(user);
		return mv;
	}

}