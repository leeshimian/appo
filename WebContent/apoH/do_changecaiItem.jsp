<%@page import="java.sql.*"%>
<%@ page import="com.yc.sql.connDB" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head><jsp:include page="isLogin.jsp"></jsp:include>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String typeid = request.getParameter("id");
	String typename = request.getParameter("newname");
	String sql = " update caitype set type_name =? where type_id=? ";
	connDB.getConn();
	int ans = connDB.updateEmp(sql,typename,typeid);
	if(ans > 0){
		System.out.println("操作成功");connDB.closeConn();
		request.getRequestDispatcher("leibiexinxibiao.jsp").forward(request, response);
	}else{
		System.out.println("操作失败"); connDB.closeConn();
		request.getRequestDispatcher("changecaiItem.jsp").forward(request, response);
	}
	connDB.closeConn();
	%>
</body>
</html>