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
	String annocid = request.getParameter("id");
	String annoctitle = request.getParameter("newtitle");
	String annoctext = request.getParameter("newtext");
	String sql = " update annoc set annoc_title =?,annoc_text=?,annoc_time=sysdate where annoc_id=? ";
	connDB.getConn();
	int ans = connDB.updateEmp(sql,annoctitle,annoctext,annocid);
	if(ans > 0){
		System.out.println("操作成功");connDB.closeConn();
		request.getRequestDispatcher("listnews.jsp").forward(request, response);
	}else{
		System.out.println("操作失败"); connDB.closeConn();
		request.getRequestDispatcher("changeAnnoc.jsp").forward(request, response);
	}
	connDB.closeConn();
	%>
</body>
</html>