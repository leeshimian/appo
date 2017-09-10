<%@page import="java.sql.*"%>
<%@ page import="com.yc.sql.connDB" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>添加新类别</title>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
		<style type="text/css">
			#c2 table{
				margin: auto;
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
						<b>添加菜品</b>
					</div>
				</div>
				
				<div id="c2">
					<br /><br /><br />
					<form action="to_newcaidan.jsp" method="post">
					<table align="center" border="1" cellspacing="0" cellpadding="0" width="950px" bordercolor="blue" >
						<tr>
							<td class="left">菜品名称：</td>
							<td class="right"><input type="text" name="cai_name" maxlength="20" required="required"/></td>
						</tr>
						<tr>
							<td class="left">原 料：</td>
							<td class="right"><input type="text" name="cai_material" maxlength="100" required="required" /></td>
						</tr>
						<tr>
							<td class="left">市场价格：</td>
							<td class="right"><input type="text" name="cai_mPrice" maxlength="5" required="required"/></td>
						</tr>
						<tr>
							<td class="left">会员价格：</td>
							<td class="right"><input type="text" name="cai_vipPrice" maxlength="5" required="required" /></td>
						</tr>
						<tr>
							<td class="left">说 明：</td>
							<td class="right"><textarea name="cai_info" rows="10" cols="30" maxlength="20" required="required"></textarea></td>
						</tr>
						<tr>
							<td class="left">菜品类别：</td>
							<td class="right">
							<%
							String seltitem = " select * from caitype order by type_id ";
							connDB.getConn();
							ResultSet p = connDB.connQuery(seltitem);
							%>
								<select name="cai_kind">
								<%
								while(p.next()){
								%>
									<option value="<%=p.getString("type_name") %>" ><%=p.getString("type_name") %></option><%}connDB.closeConn(); %>
								</select>
							</td>
						</tr>
						<tr>
							<td class="left">上传图片：</td>
							<td class="right"><input type="file" name="cai_img" /></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit" /></td>
						</tr>
					</table>
					</form>		
					<br /><br />			
				</div>


			</div>
		</div>
	</body>
</html>