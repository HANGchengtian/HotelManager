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
	<jsp:include flush="true" page="/admin/top.jsp"/>
	<form action="servlet/OrderListServlet" name="form1" method="post">
	<table width="40%" class="table_style"  align="center">
		<tr>
			<td>���û�����ѯ��<input type="text" name="username" size="14">
			<input type="submit" value="��ѯ">
			</td>
		</tr>
		<tr>
			<td> �ͷ����Ʋ�ѯ��<input type="text" name="bookname" size="14">
			<input type="submit" value="��ѯ">
		</tr>
		</table>
	</form>
  	<table width="99%" class="table_style"  align="center">
		<tr>
			<td align="center">�û���</td>
			<td align="center">��ʵ����</td>
			<td align="center">�ͷ�����</td>
			<td align="center">����</td>
			<td align="center">Ԥ������</td>
			<td align="center">��סʱ��</td>
			<td align="center">�뿪ʱ��</td>

			<td align="center">�ϼ�</td>
			<td align="center">�Ƿ��뿪</td>
			<td align="center">��</td>
		</tr>
		<jsp:include flush="true" page="/servlet/ListServlet"/>
		<%
		ArrayList books = null;
		if(request.getAttribute("order") == null){
			books = (ArrayList)request.getAttribute("orders");
		}else{
			books = (ArrayList)request.getAttribute("order");
		}
		for(int i = 0;i < books.size();i++){
			ArrayList alRow = (ArrayList)books.get(i);
		 %>
		<tr>
			<td align="center" height="20"><%=alRow.get(0) %></td>
	    <td align="center" height="20"><%=alRow.get(1) %></td>
	    <td align="center" height="20"><%=alRow.get(2) %></td>
	    <td align="center" height="20"><%=alRow.get(6) %>Ԫ</td>
	    <td align="center" height="20"><%=alRow.get(7) %></td>
	    <td align="center" height="20"><%=alRow.get(8).toString().substring(0,10) %></td>
	    <td align="center" height="20"><%=alRow.get(9).toString().substring(0,10) %></td>

			<td align="center" height="20">
			<%
					if(alRow.get(10) == null){
						%><%=Integer.parseInt(alRow.get(6).toString())*Integer.parseInt(alRow.get(7).toString()) %>Ԫ<%
					}else{
						%><%=Integer.parseInt(alRow.get(6).toString())*Integer.parseInt(alRow.get(7).toString())+Integer.parseInt(alRow.get(6).toString())*Integer.parseInt(alRow.get(10).toString()) %>Ԫ<%
					}
					 %>
			</td>
			<td align="center" height="20">
			<%
			if(alRow.get(12).equals("δ�뿪")){
				%><a href="servlet/HuanBookServlet?id=<%=alRow.get(3) %>"><%=alRow.get(12) %></a><%
			}else{
				%><font color="#ff0000"><%=alRow.get(12) %></font><%
			}
			 %>			
			</td>
			<td align="center" height="20"><a href="servlet/DelServlet?loanbook=<%=alRow.get(3) %>">ɾ��</a></td>
		</tr>
		<%} %>
	</table>

  	</div>
  </body>
</html>