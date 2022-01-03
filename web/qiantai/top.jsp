<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
<head>
<title>酒店管理系统</title>
<link href="<%=path %>/img/css.css" type="text/css" rel="stylesheet"/>
</head>
<body>

<br><br>
<table width="95%" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="left" valign="middle" style=" border: 0px"><font style=" font-size:24px; 

font-family:'微软雅黑'">酒店客房预订管理系统</font></td>
  </tr>
</table>
<br><br>

<div id="content">

  <div id="menu_left">
    <div id="menu_right">
      <ul id="nav">
        <li class="top"><a href="<%=path %>/qiantai/index.jsp" class="top_link"><span>首页</span></a></li>
        <li class="top"><a href="<%=path %>/qiantai/reg.jsp" class="top_link"><span>用户注册</span></a></li>
        <li class="top"><a href="<%=path %>/servlet/ShowUserServlet" class="top_link"><span>用户中心</span></a></li>
        <li class="top"><a href="<%=path %>/qiantai/search.jsp" class="top_link"><span>客房搜索</span></a></li>
        <li class="top"><a href="<%=path %>/qiantai/loan_hotel_note.jsp" class="top_link"><span>预定记录</span></a></li>

        <%
		  if(session.getAttribute("login") != null && !session.getAttribute("login").equals("")){
		  ArrayList al = (ArrayList)session.getAttribute("login");
		  String name = (String)al.get(1);
		  %>
        <li class="top"><a href="<%=path %>/servlet/RemoveServlet?login=1" class="top_link"><span>注销退出</span></a></li>
        <%} %>
      </ul>
    </div>
  </div>
</div>
</body>
</html>