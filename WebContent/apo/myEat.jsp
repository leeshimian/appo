<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page import="com.yc.sql.connDB" %>

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
			
			<div id="myCar">
				<table border="1px" bordercolor="aqua" cellspacing="0" cellpadding="2px" width="500px">
					<tr><td colspan="3"><b>我的订餐信息列表</b></td></tr>
					<tr>
						<td width="40%">菜品名称</td>
						<td width="30%">单价</td>
						<td width="30%">数量</td>
					</tr>
					<% 
					int allCount = 0;
					Double allPrice = 0.0;
			if(session.getAttribute("userNo") != null){
					
						 	connDB.getConn();
						
							//清空购物车
							String flag = request.getParameter("flag");
							 if("delall".equals(flag)){
								 String delSql = "DELETE FROM dinner" ;
								 connDB.updateEmp(delSql);
							 }
						
						 	String sql = "SELECT cai_name, AVG(cai_price),COUNT(cai_name) from dinner group by cai_name order by AVG(cai_price) ";
						 	String sql1 = "SELECT cai_no from dinner group by cai_no order by AVG(cai_price) ";
						 	ResultSet rs = connDB.connQuery(sql); 
						 	ResultSet rs1 = connDB.connQuery(sql1); 
						 	
						 	ArrayList<String> caino = new ArrayList<String>();
						 	ArrayList<String> cainum = new ArrayList<String>();
							while(rs.next()&&rs1.next()){
								caino.add(rs1.getString("cai_no"));
								cainum.add(rs.getString("COUNT(cai_name)"));
						 %>
						 
						 <tr align="center" height="45px">
							<% allPrice += (rs.getFloat("AVG(cai_price)")) * (rs.getInt("COUNT(cai_name)")); %>
							<% allCount= allCount+ rs.getInt("COUNT(cai_name)"); %>
							<td width="100px"><%= rs.getString("cai_name") %></td>
							<td width="100px"><%= rs.getFloat("AVG(cai_price)") %></td>
							<td width="100px"><%= rs.getInt("COUNT(cai_name)") %></td>
						</tr>						
						<% } connDB.closeConn();
						%>
					<tr>
						<td colspan="3">小计：<%=allPrice %>元&nbsp;&nbsp;共<%= allCount %>份</td>
					</tr>
					<tr>
						<td colspan="3"><a href="myEat.jsp?d_flag=dinnercar"><img src="./img/canche_submit.gif"></a>&nbsp;<a href="myEat.jsp?flag=delall"><img src="./img/quxiao2.gif" /></a></td>
					</tr>
				
			
				<%		
					String d_flag = request.getParameter("d_flag"); 
					if ("dinnercar".equals(d_flag)){
						String userId = (String)session.getAttribute("userNo");
						connDB.getConn();
						int j=0,ans;
						for(int i=0;i<caino.size();i++){
							String insertSell = " insert into sellinfo values(sell_id.nextval,?,?,?,sysdate,'否') ";
							String deletd = " delete dinner ";
							ans = connDB.updateEmp(insertSell,userId,caino.get(i),cainum.get(i));
							if(ans > 0){
								j++;
								connDB.updateEmp(deletd);
								System.out.println("操作成功");
							}else{							
								System.out.println("操作失败");
							}
						}
						
						connDB.closeConn();
						if(j==caino.size()){	
							request.getRequestDispatcher("order.jsp").forward(request, response);
						}else{
							System.out.println("操作失败");
						}
					}
				}
				%>
			</table>
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
