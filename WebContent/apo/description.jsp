<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/styl.css"/>
	</head>
	<body>
		<div id="back">
			<div id="top">
				<div id="top1">
					<ul>
						<li><a href="Login.jsp">会员登录</a></li>|
						<li><a href="userCenter.jsp">会员注册</a></li>
					</ul>
				</div>
				
				<div id="">
					<div style="float: left;">
						<img src="img/1257477260.gif"/>
					</div>
					
					<div id="top2">
						<div id="wel">
							<% 
						if(session.getAttribute("userNo") != null){%>
							<marquee behavior="slide">亲爱的<%=session.getAttribute("userName") %>用户，您好！欢迎光临！</marquee><%
						}else{%>
							<marquee behavior="slide">阿婆私房菜，做最好吃的菜！</marquee><%
						}%>
						</div>
					
					
						<ul>
							<li><a href="main.jsp">首页</a></li>
							<li><a href="myEat.jsp">我的餐车</a></li>
							<li><a href="order.jsp">我的订单</a></li>
							<li><a href="userinfo.jsp">用户中心</a></li>
							<!--<li><a href="description.html">配送说明</a></li>
							<li><a href="aboutUs.html">关于我们</a></li>-->
							<li><a href="getout.jsp">注销退出</a></li>
						</ul>
					</div>
				</div>	
			</div>
			
			<div id="des">
				<br />
				<p align="center" style="font-size: 28px;">配送指南</p><br /><br />
				<p>午餐时间：<span style="color: red;">11:00~14:00</span></p><br />
				<p>晚餐时间：<span style="color: red;">17:00~21:00</span></p><br />
				<p>联系电话：<span style="color: red;">4008888</span></p><br />
				<p>联系人：<span style="color: red;">李经理</span></p><br />
				<p>注：<span style="color: red;">本店不支持网上付款，费用将有送餐人员代收，请自备零钱，谢谢合作！</span></p><br />
				<p>订单经过本店客服人员确认后，将安排快递人员送餐。 由于中午订餐人员比较多，请在本店正常营业时间外订餐，
					到时才能准时送达！ 周末进店人员比较多，暂不支持订餐，望见谅！</p>
			</div>
			
			<div id="bottom">
				<ul>
					<li>
						<a href="aboutUs.jsp">关于我们</a>
					</li>|
					<li>
						<a href="description.jsp">配送说明</a>
					</li>
				</ul>
				Copyright(C)2015-2020
			</div>

		</div>
	</body>
</html>
