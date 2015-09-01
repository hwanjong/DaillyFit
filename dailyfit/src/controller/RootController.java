package controller;

import hello.annotation.Mapping;
import hello.annotation.RootURL;
import hello.mv.ModelView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;

import dao.InfoDAO;

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