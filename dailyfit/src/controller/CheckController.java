package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InfoDAO;
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
}