<%@page import="java.sql.*"%>
<%@ page import="com.yc.sql.connDB" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
		<style type="text/css">
			#c2{
			width: 100%;
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
						<b>订单信息</b>
					</div>
				</div>
				
				<div id="c2">
					<table width="86%" align="center" height="120px" cellspacing="0px" border="1px" style="margin-top: 10px; border-color:cornflowerblue;">
						<form action="xiaoshoudingdanchaxun.jsp?action=select" method="post">
						<tr>
						<td align="right"><b><font face="黑体"><label for="name">按用户名查询</label></font></b></td>
							<td align="left">
								<input type="text" name="name" style="margin-left: 10px"/>
								<input type="submit" />
							</td>
						</tr></form>
						<form action="xiaoshoudingdanchaxun.jsp?action=select" method="post">
						<tr>
						<td align="right"><b><font face="黑体"><label for="me">按菜品名称查询</label></font></b></td>
							<td align="left">
								<input type="text" name="me" style="margin-left: 10px"/>
								<input type="submit" />
							</td>
						</tr></form>
						<form action="xiaoshoudingdanchaxun.jsp?action=select" method="post">
						<tr>
						<td align="right"><b><font face="黑体"><label for="na">按销售日期查询</label></font></b></td>
							<td align="left">
								<input type="date" style="margin-left: 10px" name="na" />
								<input type="submit" />
							</td>
						</tr>
						</form>
					</table>
					<table width="86%"  align="center" cellspacing="0px" border="1px" style="margin-top: 10px;line-height:30px, border-color:cornflowerblue;">
						<tr align="center">
							<td colspan="11"><b><font face="黑体">销售订单查询结果信息列表</font></b></td>
						</tr>
						<tr align="center">
							<td><b><font face="黑体">用户ID</font></b></td>
							<td><b><font face="黑体">真实姓名</font></b></td>
							<td><b><font face="黑体">联系方式</font></b></td>
							<td><b><font face="黑体">家庭住址</font></b></td>
							<td><b><font face="黑体">菜品名称</font></b></td>
							<td><b><font face="黑体">订购数量</font></b></td>
							<td><b><font face="黑体">单价(元)</font></b></td>
							<td><b><font face="黑体">合计(元)</font></b></td>
							<td><b><font face="黑体">订购时间</font></b></td>
							<td><b><font face="黑体">是否派送</font></b></td>
							<td><b><font face="黑体">确认订单</font></b></td>
						</tr>
						
						<%
							request.setCharacterEncoding("utf-8");
							String action = request.getParameter("action");
							if("select".equals(action)){
								String username=request.getParameter("name");
								String cai_name=request.getParameter("me");
								String sell_date=request.getParameter("na");
								double sum=0.0;
								if(username!=null){
									String sql = " select sell_id,userinfo.user_id,userinfo.user_relname,user_tel,user_address, "+ 
											" cai_name,sell_num, cai_vipPrice,sell_date,sell_send from userinfo,greens,sellinfo "+
											"  where userinfo.user_id=sellinfo.user_id and sellinfo.cai_no=greens.cai_no "+
									        "   and user_name=? order by user_name,sell_id ";
									connDB.getConn();
									ResultSet p=connDB.connQuery(sql,username);
									while(p.next()){
										sum = p.getDouble("cai_vipPrice")*p.getDouble("sell_num");
										%>
										<tr align="center">
											<td ><%=p.getString("user_id") %></td>
											<td ><%=p.getString("user_relname") %></td>
											<td ><%=p.getString("user_tel") %></td>
											<td ><%=p.getString("user_address") %></td>
											<td ><%=p.getString("cai_name") %></td>
											<td ><%=p.getString("sell_num") %></td>
											<td ><%=p.getString("cai_vipPrice") %></td>
											<td ><%=sum %></td>
											<td ><%=p.getString("sell_date") %></td>
											<td ><%=p.getString("sell_send") %></td>
											<td>
												<a href="xiaoshoudingdan.jsp?action=delete&id=<%=p.getString("sell_id") %>">取消</a>
											</td>
											
										</tr><% 
									}
											connDB.closeConn();
											
								}
								
								if(cai_name!=null){
									String sql = " select sell_id,userinfo.user_id,userinfo.user_relname,user_tel,user_address, "+ 
											" cai_name,sell_num, cai_vipPrice,sell_date,sell_send from userinfo,greens,sellinfo "+
											"  where userinfo.user_id=sellinfo.user_id and sellinfo.cai_no=greens.cai_no "+
									        "   and cai_name=? order by sell_id ";
									connDB.getConn();
									ResultSet q=connDB.connQuery(sql,cai_name);
									while(q.next()){
										sum = q.getDouble("cai_vipPrice")*q.getDouble("sell_num");
										%>
										<tr align="center">
											<td ><%=q.getString("user_id") %></td>
											<td ><%=q.getString("user_relname") %></td>
											<td ><%=q.getString("user_tel") %></td>
											<td ><%=q.getString("user_address") %></td>
											<td ><%=q.getString("cai_name") %></td>
											<td ><%=q.getString("sell_num") %></td>
											<td ><%=q.getString("cai_vipPrice") %></td>
											<td ><%=sum %></td>
											<td ><%=q.getString("sell_date") %></td>
											<td ><%=q.getString("sell_send") %></td>
											<td>
												<a href="xiaoshoudingdanchaxun.jsp?action=delete&id=<%=q.getString("sell_id") %>">取消</a>
											</td>
											
										</tr><% 
									}
											connDB.closeConn();
									
								}
								
								if(sell_date!=null){
									sell_date=sell_date.replace("-","");
									String sql = " select sell_id,userinfo.user_id,userinfo.user_relname,user_tel,user_address, "+ 
											" cai_name,sell_num, cai_vipPrice,sell_date,sell_send from userinfo,greens,sellinfo "+
											"  where userinfo.user_id=sellinfo.user_id and sellinfo.cai_no=greens.cai_no "+
									        "   and to_char(sell_date,'yyyymmdd')=? order by user_id,sell_id ";
									connDB.getConn();
									ResultSet q=connDB.connQuery(sql,sell_date);
									while(q.next()){
										sum = q.getDouble("cai_vipPrice")*q.getDouble("sell_num");
										%>
										<tr align="center">
											<td ><%=q.getString("user_id") %></td>
											<td ><%=q.getString("user_relname") %></td>
											<td ><%=q.getString("user_tel") %></td>
											<td ><%=q.getString("user_address") %></td>
											<td ><%=q.getString("cai_name") %></td>
											<td ><%=q.getString("sell_num") %></td>
											<td ><%=q.getString("cai_vipPrice") %></td>
											<td ><%=sum %></td>
											<td ><%=q.getString("sell_date") %></td>
											<td ><%=q.getString("sell_send") %></td>
											<td>
												<a href="xiaoshoudingdanchaxun.jsp?action=delete&id=<%=q.getString("sell_id") %>">取消</a>
											</td>
											
										</tr><% 
									}
											connDB.closeConn();
								}
							}
						%>
							
						<tr align="center">
					<td colspan="11">
						<b><font face="黑体">
							共1页<a href="#">首页</a><a href="#">尾页</a>
						</font></b>
					</td>
						</tr>
					</table><br /><br />
					
				</div>

			</div>
		</div>
	</body>
</html>
