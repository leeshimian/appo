<%@page import="java.sql.*"%>
<%@ page import="com.yc.sql.connDB" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>通告信息列表</title>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
		
		<style type="text/css">
			#c2{
			width: 100%;
	        float: left;
			}
			
			#c2 table{
				margin: auto;
				line-height: 30px;
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
						<b>公告列表</b>
					</div>
				</div>
				
				<div id="c2">
					<table width="86%"  align="center"  cellspacing="0px" border="1px" style="margin-top: 60px; border-color:cornflowerblue;">
						<tr align="center">
							<td colspan="5"><b><font face="黑体">公告信息列表</font></b></td>
						</tr>
						<tr align="center">
							<td><b><font face="黑体">标题</font></b></td>
							<td><b><font face="黑体">内容</font></b></td>
							<td><b><font face="黑体">发布时间</font></b></td>
							<td colspan="2"></td>
						</tr>
						
						<%
							request.setCharacterEncoding("utf-8");
							String action = request.getParameter("action");
							if("deleteNew".equals(action)){
								String annocid = request.getParameter("id");
								String deleteNo = " delete annoc where annoc_id=? ";
								
								connDB.getConn();
								int ans = connDB.updateEmp(deleteNo,annocid);
								if(ans > 0){
									System.out.println("操作成功");
								}else{
									System.out.println("操作失败");
								}
								connDB.closeConn();
							}
						%>
						
						<%
						String pag=request.getParameter("page");
						if(pag==null){pag="1";}
						   int t=Integer.parseInt(pag);
						   int m=6*t-5,n=6*t;
						
						String sql = " select * from (select t.*,rownum rn from(select * from annoc order by annoc_id ) t) l where l.rn>="+m+" and l.rn<="+n;
						String sql1 ="select count(*) from annoc";
						connDB.getConn();
						ResultSet p = connDB.connQuery(sql);
						ResultSet pp = connDB.connQuery(sql1);
						pp.next();
						while(p.next()){
						%>
						
						<tr>
							<td width="10%"><%=p.getString("annoc_title") %></td>
							<td width="50%"><%=p.getString("annoc_text") %></td>
							<td width="20%"><%=p.getString("annoc_time") %></td>
							<td width="10%">
								<a href="changeAnnoc.jsp?action=getchange&id=<%=p.getString("annoc_id") %>">修改</a>
							</td>
							<td width="10%">
								<a href="listnews.jsp?action=deleteNew&id=<%=p.getString("annoc_id") %>">删除</a>
							</td>
							
						</tr><%
						}
						int max=(pp.getInt("count(*)")-1)/6+1;
						connDB.closeConn();
						%>
						
						<tr align="center">
					<td colspan="5">
						<b><font face="黑体">
						<a href="listnews.jsp?page=1">首页</a><%=" " %>
						    <% if(t>1) 
						     {%><a href="listnews.jsp?page=<%=(t-1) %>">上一页</a><%} %><%=" " %>
						             共<%=max %>页
						              第<%=t %>页<%=" " %>
						     <%if(t<max)
						      {%><a href="listnews.jsp?page=<%=(t+1) %>">下一页</a><% }%><%=" " %>
						 <a href="listnews.jsp?page=<%=max %>">尾页</a><%=" " %>        
						</font></b>
					</td>
						</tr>
					</table><br /><br />
					
				</div>
			</div>
		</div>
	</body>
</html>
