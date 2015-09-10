package controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Shop;
import dao.ShopDAO;
import hello.annotation.Mapping;
import hello.annotation.RootURL;
import hello.mv.ModelView;

@RootURL("/admin")
public class AdminController {

	@Mapping(url="/searchGoogle.ap")
	ModelView getSearchGooglePage(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/admin/searchShopGoogle");
		return mv;
	}
	
	@Mapping(url="/geoLocation.ap")
	ModelView getFindGeoLocationPage(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/admin/findGeoLocation");
		ShopDAO dao =new ShopDAO();
		ArrayList<Shop> shopList = dao.getAllShopInfo();
		mv.setModel("shopList", shopList);
		mv.setModel("size", shopList.size());

		return mv;
	}
	
	@Mapping(url="/registLocation.ap")
	ModelView registGeoLocation(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("redirect:/dailyfit/admin/geoLocation.ap");
		ShopDAO dao =new ShopDAO();
		ArrayList<Shop> shopList = dao.getAllShopInfo();

		for(Shop shop:shopList){
			try{
				String address = shop.getAddress();
				address=URLEncoder.encode(address, "UTF-8");
				String url = "http://openapi.map.naver.com/api/geocode?key=b5168682c5a10f1e5b7592ae92fbb844&encoding=utf-8&coord=latlng&query="+address;
				URL mapXmlUrl = new URL(url);  //URL연결하고 받아오고 하는 부분들은 import가 필요하다. java.net.*
				HttpURLConnection urlConn = (HttpURLConnection)mapXmlUrl.openConnection();
				urlConn.setDoOutput(true);
				urlConn.setRequestMethod("POST");

				int len = urlConn.getContentLength();  //받아오는 xml의 길이

				if(len > 0){ 
					BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream(),"utf-8"));
					String inputLine="";
					String mapxml = ""; //받아온 xml
					while((inputLine = br.readLine())!=null){
						mapxml += inputLine;  //한글자씩 읽어옵니다
					}
					if(mapxml != null){
						if(mapxml.indexOf("</item>") > -1 ){   //item이 있으면 좌표를 받아와야지
							String lat = "";  //위도
							String lon = "";  //경도
							lon = mapxml.substring( mapxml.indexOf("<x>")+3, mapxml.indexOf("</x>") ) ; //경도 잘라오기
							lat = mapxml.substring( mapxml.indexOf("<y>")+3, mapxml.indexOf("</y>") ) ; //위도 잘라오기
							shop.setLat(Double.parseDouble(lat));
							shop.setLng(Double.parseDouble(lon));
							
						}
					}
					br.close();  //버퍼리더 닫기
				}
				System.out.println(shop.getLat()+", "+shop.getLng()+" : "+shop.getShopName()+", "+shop.getAddress());
				dao.updateLocation(shop);

			}catch(Exception e){
				e.printStackTrace();
			}
		}
		mv.setModel("shopList", shopList);
		mv.setModel("size", shopList.size());

		return mv;
	}
}
