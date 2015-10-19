package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Board;
import bean.Sale;
import bean.User;
import dao.InfoDAO;
import dao.ShopDAO;
import dao.TicketDAO;
import hello.annotation.Mapping;
import hello.annotation.RootURL;
import hello.mv.ModelView;

@RootURL("/user")
public class UserController {

	@Mapping(url="/useTicket.ap")
	ModelView getTicketPage(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/myinfo/ticket");
		User user = (User) request.getSession().getAttribute("user");
		TicketDAO dao = new TicketDAO();
		ArrayList<Sale> buyList = dao.getBuyList(user);
		mv.setModel("buyList", buyList);
		for(Sale sale : buyList){
			System.out.println(sale.getSaleName());
		}
		return mv;
	}
	
	@Mapping(url="/useRequest.ap",method="post")
	ModelView useRequest(HttpServletRequest request,HttpServletResponse response){
		System.out.println("durlemfdjdha");
		ModelView mv = new ModelView("/myinfo/jsonView");
		mv.setModel("registed", "no");
		if(request.getSession().getAttribute("user") ==null)	return mv;

		String saleId = request.getParameter("saleId");
		TicketDAO dao = new TicketDAO();
		if(dao.updateUse(saleId)){
			mv.setModel("check", "yes");
			System.out.println("update성공");
		}
		return mv;
	}
	
	@Mapping(url="/ticketHistory.ap")
	ModelView getTicketHistroy(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/myinfo/ticketHistory");
		return mv;
	}
	
	@Mapping(url="/buyRequest.ap",method="post")
	ModelView doBuy(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("redirect:/dailyfit/mypage.ap");
		
		ShopDAO dao = new ShopDAO();
		User user = (User) request.getSession().getAttribute("user");
		
		if(user==null) return new ModelView("redirect:/dailyfit/main.ap");
		
		String userId = user.getUserId();
		ArrayList<Sale> buyList = new ArrayList<>();
		String[] saleList = request.getParameterValues("saleList");// 해당 Shop의 리스트가져오기
		for(String saleId :saleList){
			String amount=request.getParameter(saleId);
			//구매한목록만 추가
			if(!amount.equals("0")){
				System.out.println(saleId +": "+ amount);
				Sale sale = dao.getSale(saleId);
				sale.setAvailability(Integer.parseInt(amount)*Integer.parseInt(sale.getTypeAmount()));
				//00개월 이용권이면 그냥 갯수로만침
				if(sale.getSaleType().equals("M")){
					sale.setAvailability(Integer.parseInt(amount));
				}else{
					sale.setAvailability(Integer.parseInt(amount)*Integer.parseInt(sale.getTypeAmount()));
				}
				buyList.add(sale);
			}
		}
		dao.addBuyList(buyList,userId);
		return mv;
	}
	@Mapping(url="/goal.ap")
	ModelView myGoal(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/myinfo/myGoal");
		User sessionUser = (User) request.getSession().getAttribute("user");
		if(sessionUser==null) return new ModelView("/dailyfit/login");
		InfoDAO dao = new InfoDAO();
		User user = dao.getUser(sessionUser);
		mv.setModel("curUser", user);		
		return mv;		
	}
	

	@Mapping(url="/infoChange.ap", method="post", bean="bean.User")
	ModelView setAjaxInfoChange(HttpServletRequest request,HttpServletResponse response,Object obj){
		System.out.println("userInfoChange 요쳥");
		ModelView mv = new ModelView("/myinfo/jsonView");
		InfoDAO dao = new InfoDAO();
		User updateTarget =(User)obj;
		
		updateTarget.setUserId(((User)request.getSession().getAttribute("user")).getUserId());
		dao.updateUser(updateTarget);
		mv.setModel("user", updateTarget);
		return mv;		
	}
	
	@Mapping(url="/notice.ap")
	ModelView notice(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/myinfo/notice");
		InfoDAO dao = new InfoDAO();
		ArrayList<Board> boardList = dao.getNotices();
		mv.setModel("boardList", boardList);
		return mv;
	}
}
