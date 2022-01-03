<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
<head>
<title>后台管理</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/img/admin-css.css">
</head>
<body>
<div class="content">
  <div id="top_img"><br><br><br><font style="font-size:24px; font-family: '微软雅黑'"; color="##333399">酒店管理系统_后台管理<br><br><br></font></div>
  <div id="menu_left">
    <div id="menu_right">
      <ul id="nav">

        <li class="top"><a href="<%=path %>/admin/hotellist.jsp" class="top_link"><span>客房管理</span></a></li>
        <li class="top"><a href="<%=path %>/admin/typelist.jsp" class="top_link"><span>客房类别管理</span></a></li>
        <li class="top"><a href="<%=path %>/admin/userlist.jsp" class="top_link"><span>会员管理</span></a></li>
        <li class="top"><a href="<%=path %>/admin/kuxiao.jsp" class="top_link"><span>剩余房间查询</span></a></li>
        <li class="top"><a href="<%=path %>/admin/order.jsp" class="top_link"><span>订房信息查询</span></a></li>
        <li class="top"><a href="<%=path %>/admin/modifypwd.jsp" class="top_link"><span>用户管理</span></a></li>
        <li class="top"><a href="<%=path %>/servlet/RemoveServlet?admin=1" class="top_link"><span>注销退出</span></a></li>
      </ul>
    </div>
  </div>
</div>
</body>
</html>