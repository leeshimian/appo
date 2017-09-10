<%@page import="java.sql.*"%>
<%@ page import="com.yc.sql.connDB" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>菜单信息表</title>
		<style type="text/css">
		#right{
		height: 450px;
		}
		</style>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
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
						<b>菜品信息</b>
					</div>
				</div>
				
				<div id="rigbot">
					<table border="1px" bordercolor="blue" cellspacing="0" cellpadding="" width="400px">
						<tr>
							<th colspan="11">菜单信息列表</th>
						</tr>
						<tr>
							<td>菜单名称</td>
							<td>展示图片</td>
							<td>原料</td>
							<td>类型</td>
							<td>说明</td>
							<td>市场价格</td>
							<td>市场价销售数量</td>
							<td>会员单价</td>
							<td>会员价销售数量</td>
							<td colspan="2"></td>
						</tr>
						<%
			     request.setCharacterEncoding("utf-8");
			     
			     connDB.getConn();
			     String action =request.getParameter("action");
			     if("delete".equals(action))
			     {String cai_no =request.getParameter("id");
			      String dltsql="delete greens where cai_no=?";
			 	 connDB.updateEmp(dltsql,cai_no);}
			     
			     String pag=request.getParameter("page");
					if(pag==null){pag="1";}
				int t=Integer.parseInt(pag);
				int m=6*t-5,n=6*t;
				
			     String sql=" select * from (select t.*,rownum rn from(select * from greens ) t) l where l.rn>="+m+" and l.rn<="+n ;
			     ResultSet rs=connDB.connQuery(sql);
			     String sql1 ="select count(*) from greens";
			     ResultSet rs1=connDB.connQuery(sql1);
			     rs1.next();
			     while(rs.next()){
			      %>
						<tr>
							<td><%= rs.getString("cai_name")%></td>
							<td><img src="<%= rs.getString("cai_img")%>" width=50px></td>
							<td><%= rs.getString("cai_material")%></td>
							<td><%= rs.getString("cai_kind")%></td>
							<td><%= rs.getString("cai_info")%></td>
							<td><%= rs.getString("cai_mPrice")%></td>
							<td><%= rs.getString("cai_num")%></td>
							<td><%= rs.getString("cai_vipPrice")%></td>
							<td><%= rs.getString("cai_vipnum")%></td>
							<td><a href="caidanupdate.jsp?action=update&id=<%= rs.getString("cai_no")%>">修改</a></td>
							<td><a href="caidanxinxi.jsp?action=delete&id=<%= rs.getString("cai_no")%>">删除</a></td>
						</tr>
						<%}
			    		 int max=(rs1.getInt("count(*)")-1)/6+1;
			     		%>
						<tr><td colspan="11">
							<b><font face="黑体">
						<a href="caidanxinxi.jsp?page=1">首页</a><%=" " %>
						    <% if(t>1) 
						     {%><a href="caidanxinxi.jsp?page=<%=(t-1) %>">上一页</a><%} %><%=" " %>
						             共<%=max %>页
						              第<%=t %>页<%=" " %>
						     <%if(t<max)
						      {%><a href="caidanxinxi.jsp?page=<%=(t+1) %>">下一页</a><% }%><%=" " %>
						 <a href="caidanxinxi.jsp?page=<%=max %>">尾页</a><%=" " %>        
						</font></b></td>
						</tr>
					</table><br /><br />
				</div>
			</div>
		</div>
	</body>
</html>