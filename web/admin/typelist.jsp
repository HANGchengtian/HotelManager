<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  </head>
  <jsp:include flush="true" page="/servlet/SessAdminServlet"/>
  <body>
  <%
  String error = (String)request.getAttribute("error");
  if(error != null && !error.equals("")){
  	%><script>alert('该类别不能删除!')</script><%
  }
   %>
	<div class="bg_color" style="height:100%;">
	<jsp:include flush="true" page="/servlet/ListServlet"/>
	<jsp:include flush="true" page="/admin/top.jsp"/>
  	<table width="99%" class="table_style"  align="center">
		<tr>
			<td align="center">序号</td>
			<td align="center">类别名称</td>
			<td align="center"> </td>
			<td align="center"> </td>
		</tr>
		<%
		ArrayList books = (ArrayList)request.getAttribute("type");
		for(int i = 0;i < books.size();i++){
			ArrayList alRow = (ArrayList)books.get(i);
		 %>
		<tr>
			<td  align="center" height="20"><%=alRow.get(0) %></td>
			<td  align="center" height="20"><%=alRow.get(1) %></td>

			<td  align="center" height="20"><a href="servlet/DelServlet?typeid=<%=alRow.get(0) %>">删除</a></td>
		</tr>
		<%} %>
		<tr>
			<td  align="center" colspan="4" height="25"><a href="admin/addtype.jsp">添加新类别</a></td>
		</tr>
	</table>
  	</div>
  </body>
</html>