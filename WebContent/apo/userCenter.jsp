<%@page import="java.sql.*"%>
<%@ page import="com.yc.sql.connDB" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>
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
			
			<%
			if(session.getAttribute("userNo") != null){
				%><h3>您已登录，请先注销！</h3><% 
			}else{
			%>
			
			<%
			request.setCharacterEncoding("utf-8");
			String action = request.getParameter("action");
			String userNa="",userPwd="",userPwdd="",userRNa="",addSex="",userBir="",userId="",userAd="",userPh="",userEm="";
			
			
			if("add".equals(action)){
				 userNa = request.getParameter("userCount");
				 userPwd = request.getParameter("userPas");
				 userPwdd = request.getParameter("userPass");
				 userRNa = request.getParameter("userName");
				String Sex=request.getParameter("userSex");

				if(Sex.equals("m")){
					addSex="男";
				}else{
					addSex="女";
				}
				
				 userBir = request.getParameter("userBir");
				 userId = request.getParameter("userID");
				 userAd = request.getParameter("userAddre");
				 userPh = request.getParameter("userPhone");
				 userEm = request.getParameter("userMail");
				if(userPwd.equals(userPwdd)){
						connDB.getConn();
						String sql = " insert into userinfo values(apo_user_id.nextval,?,?,?,?,?,?,?,?,?) ";
						int ans = connDB.updateEmp(sql,userNa,userPwd,userRNa,addSex,Date.valueOf(userBir),userId,userAd,userPh,userEm);
						if(ans > 0){
							System.out.println("操作成功");
							%><h1>注册成功</h1><a href="Login.jsp">返回登录</a><% 
						}else{
							%><h1>注册失败</h1><% 
							System.out.println("操作失败");
						}
						connDB.closeConn();
					}else{
						%><h1>两次输入的密码不一致，注册失败</h1><%
					}
			}
			%>
			
			<div id="userCent">
				<table border="0" cellspacing="0" cellpadding="0" >
					<form action="userCenter.jsp?action=add" method="post">
					<tr>
						<td colspan="3"><b>请填写用户信息（带*的为必填项）</b></td>
					</tr>
					<tr>
						<td class="left">用户名：</td>
						<td class="center"><input type="text" name="userCount" id="userCount" 
							maxlength="12" required="required" value="" size="15px"/></td>
						<td class="right"><span>*</span>您用来登陆的用户名</td>
					</tr>
					<tr>
						<td class="left">密码：</td>
						<td class="center"><input type="password" name="userPas" id="userPas" minlength="5" maxlength="12" required="required" value="" size="15px"/></td>
						<td class="right"><span>*</span>长度必须大于5个小于16个字符，只能为英语字、数字</td>
					</tr>
					<tr>
						<td class="left">确认密码：</td>
						<td class="center"><input type="password" name="userPass" id="userPas" minlength="5" maxlength="12" required="required" value="" size="15px"/></td>
						<td class="right"><span>*</span>请将输入的密码再次输入</td>
					</tr>
					<tr>
						<td class="left">真实姓名：</td>
						<td class="center"><input type="text" name="userName" id="userName" maxlength="12" required="required" value="" size="15px"/></td>
						<td class="right"><span>*</span>填写您的真实的姓名</td>
					</tr>
					<tr>
						<td class="left">性别：</td>
						<td class="center"><input type="radio" name="userSex" id="userSex" value="" checked="checked"/>男
							<input type="radio" name="userSex" id="userSex" value=""/>女 </td>
						<td class="right"><span>*</span>填写您的性别</td>
					</tr>
					<tr>
						<td class="left">生日：</td>
						<td class="center"><input type="date" name="userBir" id="userBir" required="required"  value="" size="15px"/></td>
						<td class="right"><span>*</span>填写您的生日</td>
					</tr>
					<tr>
						<td class="left">身份证号：</td>
						<td class="center"><input type="text" name="userID" id="userID" maxlength="18" required="required" value="" size="15px"/></td>
						<td class="right"><span>*</span>填写您的身份证号</td>
					</tr>
					<tr>
						<td class="left">家庭住址：</td>
						<td class="center"><input type="text" name="userAddre" id="userAddre" maxlength="100" required="required" value="" size="15px"/></td>
						<td class="right"><span>*</span>填写您的家庭住址</td>
					</tr>
					<tr>
						<td class="left">电话号码：</td>
						<td class="center"><input type="tel" name="userPhone" id="userPhone" maxlength="11" required="required" value="" size="15px"/></td>
						<td class="right"><span>*</span>填写您的电话号码(格式为02411111111或13911111111)</td>
					</tr>
					<tr>
						<td class="left">电子邮箱：</td>
						<td class="center"><input type="email" name="userMail" id="userMail" maxlength="18" required="required" value="" size="15px"/></td>
						<td class="right"><span>*</span>请填写您有效的邮件地址，以便于我们为您提供有效的服务。</td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" id="tijiao" value=""/></td>
						<td align="left"><input type="reset" /></td>
					</tr>
					</form>
				</table>
			</div>
			<%} %>
			<div id="bottom" >
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