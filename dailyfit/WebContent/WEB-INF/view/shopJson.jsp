<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
{ "shopList": [ <c:forEach var="shop" items="${model.shopList }">
	{ "shopNum":"${shop.shopNum}", "shopName" : "${shop.shopName}","tel" : "${shop.tel}","address":"${shop.address}","mainImgUrl" : "${shop.mainImgUrl}","dprice":"${shop.dprice}","distance":"${shop.distance}"} ,
	</c:forEach>""
] }