package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;
import dao.InfoDAO;
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
	
	@Mapping(url="/setting.ap")
	ModelView mySetting(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/test/mySetting");
		return mv;
	}
	@Mapping(url="/goal.ap")
	ModelView myGoal(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/test/myGoal");
		User user = (User) request.getSession().getAttribute("user");
		if(user != null)
			return mv;
		else
			return new ModelView("/test/mySetting");
	}
	
	@Mapping(url="/userInfoChange.ap", method="post")
	ModelView ajaxRangeProduct(HttpServletRequest request,HttpServletResponse response){
		System.out.println("userInfoChange 요쳥");
		ModelView mv = new ModelView("/test/jsonView");
		InfoDAO dao = new InfoDAO();
		User updateTarget = new User();
		updateTarget.setUserId(((User)request.getSession().getAttribute("user")).getUserId());
		updateTarget.setHeight(request.getParameter("height"));
		updateTarget.setTargetPower(request.getParameter("targetPower"));
		updateTarget.setTargetWeight(request.getParameter("targetWeight"));
		updateTarget.setWeight(request.getParameter("weight"));
		updateTarget.setPw(((User)request.getSession().getAttribute("user")).getPw());
		dao.updateUser(updateTarget);
		
		updateTarget = dao.getUser(updateTarget);
		request.getSession().setAttribute("user", updateTarget);
		//ArrayList<Shop> shopList = null;
		//shopList= dao.getRangeShop(lat,lng,true);
		//System.out.println("찾은갯수:"+shopList.size());		
		//mv.setModel("shopList", shopList);
		return mv;
		
	}
}