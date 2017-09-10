<%@page import="java.sql.*"%>
<%@ page import="com.yc.sql.connDB" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>本日销售记录</title>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
		
		<style type="text/css">
			#c2{
			width: 100%;
			height: 400px;
	        float: left;
			}
			
			#c2 table{
				margin: auto;
			}
		a{
			text-decoration: none;
		}
		a:hover{
			color: #0000FF;
		}

		</style>
	</head><jsp:include page="isLogin.jsp"></jsp:include>
	<body>
		<div id="bodyy">
			<div id="top">
				<div id="topleft"></div>
				<div id="topright">
					<marquee>管理员：<%=session.getAttribute("adm") %> 您好，欢迎登录使用！</marquee>
				</div>
				<div id="toprr">
					<a href="main.jsp"><img src="img/out.gif"/></a>
				</div>
			</div>
			
			<div id="left">
				<ul>
					<li class="menutitle"><b>菜单管理</b>
						<ul>
							<li class="meunPic"><img src="img/menu_topline.gif"/></li>
							<li class="menu"><a href="newcaidan.jsp" class="liA">添加新菜单</a></li>
							<li class="menu"><a href="caidanxinxi.jsp" class="liA">菜单信息列表</a></li>
						</ul>
					</li>
					<li class="menutitle">
						<b>菜单类别管理</b>
						<ul>
							<li class="meunPic"><img src="img/menu_topline.gif"/></li>
							<li class="menu"><a href="addItem.jsp" class="liA">添加新类别</a></li>
							<li class="menu"><a href="leibiexinxibiao.jsp" class="liA">类别信息列表</a></li>
						</ul>
					</li>
					<li class="menutitle">
						<b>公告信息管理</b>
						<ul>
							<li class="meunPic"><img src="img/menu_topline.gif"/></li>
							<li class="menu"><a href="addnews.jsp" class="liA">添加新公告</a></li>
							<li class="menu"><a href="listnews.jsp" class="liA">通告信息列表</a></li>
						</ul>
					</li>
					<li class="menutitle">
						<b>销售订单管理</b>
						<ul>
							<li class="meunPic"><img src="img/menu_topline.gif"/></li>
							<li class="menu"><a href="xiaoshoudingdan.jsp" class="liA">销售订单信息列表</a></li>
							<li class="menu"><a href="xiaoshoudingdanchaxun.jsp" class="liA">销售订单查询</a></li>
							<li class="menu"><a href="benrixiaoshoujilu.jsp" class="liA">本日销售记录</a></li>
						</ul>
					</li>
					<li class="menutitle"><a href="guanlixinxi.jsp" class="leftBA"><b>系统用户管理</b></a><br /></li>
					<li class="menutitle"><a href="main.jsp" class="leftBA"><b>注销退出</b></a></li>
				</ul>
			</div>
			
			<div id="right">
				<div id="rigtop">
					<div id="rigtitle" >
						<b>本日销售记录</b>
					</div>
				</div>
				
				<div id="c2">
					<table width="86%"  align="center" height="250px" cellspacing="0px" border="1px" style="margin-top: 60px; border-color:cornflowerblue;">
						<tr align="center">
							<td colspan="4"><b><font face="黑体">本日销售额统计</font></b></td>
						</tr>
						<tr align="center">
							<td><b><font face="黑体">菜品名称</font></b></td>
							<td><b><font face="黑体">订购数量</font></b></td>
							<td><b><font face="黑体">单价</font></b></td>
							<td><b><font face="黑体">合计</font></b></td>
						</tr>
						
						<%
							String sql1 = " select cai_no,sum(sell_num) from sellinfo "+
								      " group by cai_no  order by sellinfo.cai_no  ";
							String sql2 = " select cai_name,cai_vipPrice from greens "+
								      " where cai_no in (select cai_no from sellinfo) order by cai_no ";
							String sql3 = " select sum(sell_num) from sellinfo ";
							connDB.getConn();
							double allprice=0.0;
							ResultSet p=connDB.connQuery(sql1);
							ResultSet q=connDB.connQuery(sql2);
							ResultSet r=connDB.connQuery(sql3);r.next();
							while(p.next()&&q.next()){
								allprice+=(double)q.getDouble("cai_vipPrice")*p.getInt("sum(sell_num)");
						%>
								<tr align="center">
									<td ><%=q.getString("cai_name") %></td>
									<td ><%=p.getString("sum(sell_num)") %></td>
									<td ><%=q.getString("cai_vipPrice") %></td>
									<td ><%=q.getDouble("cai_vipPrice")*p.getDouble("sum(sell_num)") %></td>
								</tr><% 
						}%>
						<tr align="center">
							<td colspan="4">合计：<%=r.getString("sum(sell_num)") %>份&nbsp;<%=allprice %>元</td>	
						</tr>
						<tr align="center">
					<td colspan="4">
						<b><font face="黑体">
							共1页<a href="#">首页</a><a href="#">尾页</a>
						</font></b>
					</td>
						</tr>
					</table>
					
				</div>

			</div>
		</div>
	</body>
</html>
