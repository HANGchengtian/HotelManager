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
	<div class="bg_color" style="height:100%;">
	<jsp:include flush="true" page="/servlet/ListServlet"/>
	<jsp:include flush="true" page="/admin/top.jsp"/>
  	<table width="99%" class="table_style"  align="center">
		<tr>
			<td align="center">��Ա�û���</td>
			<td align="center">��Ա��ʵ����</td>
			<td align="center">�Ա�</td>
			<td align="center">����</td>
			<td align="center">��ϵ��ʽ</td>
			<td align="center">��ͥסַ?</td>
			<td align="center"> </td>
		</tr>
		<%
		ArrayList books = (ArrayList)request.getAttribute("users");
		for(int i = 0;i < books.size();i++){
			ArrayList alRow = (ArrayList)books.get(i);
		 %>
		<tr>
			<td  align="center" height="20"><%=alRow.get(1) %></td>
			<td  align="center" height="20"><%=alRow.get(3) %></td>
			<td  align="center" height="20"><%=alRow.get(4) %></td>
			<td  align="center" height="20"><%=alRow.get(5) %></td>
			<td  align="center" height="20"><%=alRow.get(8) %></td>
			<td  align="center" height="20"><%=alRow.get(7) %></td>
			<td  align="center" height="20"><a href="servlet/DelServlet?userid=<%=alRow.get(0) %>">ɾ��</a></td>
		</tr>
		<%} %>
	</table>
  	</div>
  </body>
</html>