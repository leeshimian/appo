<%@page import="java.sql.*"%>
<%@ page import="com.yc.sql.connDB" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8" />
		<title>登录首页</title>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
	</head>
	<body style="background-color: #1D3647;width: 1300px;height: 736px;">
	<%
	request.setCharacterEncoding("UTF-8");
	String hh = request.getParameter("hh");
	if("aa".equals(hh)){
		 String name =	request.getParameter("sa");
		    String mima =	request.getParameter("passw");
		    connDB.getConn();
		    String sql = "select*from adm_user where mange_name =? and  mange_pwd= ?";
		    ResultSet rs = connDB.connQuery(sql,name,mima);
		    if(rs.next()){
		    	session.setAttribute("adm",rs.getString("mange_name"));
		    	request.getRequestDispatcher("caidanxinxi.jsp").forward(request, response);
			}else{
				request.setAttribute("error_msg", "用户名或者密码错误");
				System.out.println("查无此人，登录失败!!!");
			}
		    connDB.closeConn();
	}
	
	
	%>
		<div id="all">
			<table id="alltable"  border="1px" cellspacing="1px" cellpadding="0" width="1200px" height="500px">
				<tr>
					<td width="50%">
						<table class="table2" cellspacing="0" cellpadding="0" width="100%">
							<tr><td colspan="2"><img src="img/logo.png"/></td></tr>
							<tr height="20px"><td colspan="2"><img src="img/icon-mail2.gif"/>客户服务邮箱:&nbsp;<a href="#">admin@apsfc.com</a><br />
								&nbsp;<img src="img/icon-phone.gif"/>官方网站:&nbsp;<a href="#"> http://www.apsfc.com</a>
							</td></tr>
							<tr height="30px"><td colspan="2"></td></tr>
							<tr>
								<td align="right"><img src="img/icon-demo.gif"/>&nbsp;<a href="#"><span style="font-size: 20px;">使用说明</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="img/icon-login-seaver.gif"/>&nbsp;<a href="#"><span style="font-size: 20px;">在线客服</span></a></td>
							</tr>
						</table>
					</td>
					<td width="50%">
						<table class="table3" cellspacing="0" cellpadding="0" width="100%">
							<form action="main.jsp?hh=aa" method="post">
								<tr><td colspan="2"><span style="font-size: 20px;"><b>登录网上订餐后台管理</b></span></td></tr>
								<tr>
									<td width="40%" align="right">管理员：</td>
									<td width="60%" align="left">&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="sa" id="sa" value="" size="15" required="required"/>
									<%
									String errorMsg =(String) request.getAttribute("error_msg");
									if(errorMsg != null){
										out.print(errorMsg);
									}
									%></td>
								</tr>
								<tr>
									<td align="right">密码：&nbsp;&nbsp;&nbsp;</td>
									<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="passw" id="passw" value="" size="15" required="required"/></td>
								</tr>
								<tr>
									<td></td>
									<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="s" id="s" value="" />5天内自动登录</td>
								</tr>
								<tr>
									<td align="center" colspan="2">
									<input type="submit" value="提交"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="" id="" value="重置" />
									</td>
								</tr>
							</form>
						</table>
					</td>
				</tr>
			</table>
			<p style="margin-left: 950px; color: white;font-family: '微软雅黑';font-size: 10px;"> Copyright&copy; 2015-2020</p>
		</div>
	</body>
</html>
