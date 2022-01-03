<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList putup = array.getPutup();
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
  <table width="99%" class="table_style" align="center">
    <tr height=30px>

    </tr>
    <tr>

    </tr>
    <tr>

    </tr>
    <%
    for(int i = 0; i < putup.size(); i++){
    	ArrayList alRow = (ArrayList)putup.get(i);
    %>
    <tr>
      <td align="center"><%=alRow.get(1) %></td>
      <td align="center"><%=alRow.get(2) %></td>
      <td align="center"><%=alRow.get(3) %></td>
      <td align="center"><a href="servlet/HotelinfServlet?id=<%=alRow.get(4) %>&adminshow=1"><%=alRow.get(9) %></a></td>
      <td align="center"><%=alRow.get(5) %></td>
      <td align="center"><%=alRow.get(6).toString().substring(0,10) %></td>
      <td align="center"><%=alRow.get(7).toString().substring(0,10) %></td>
      <td align="center"><%=alRow.get(8) %></td>
      <td align="center"><a href="servlet/DelServlet?putup=<%=alRow.get(0) %>">É¾³ý</a></td>
    </tr>
    <%} %>
  </table>
</div>
</body>
</html>