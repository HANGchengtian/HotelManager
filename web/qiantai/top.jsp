<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
<head>
<title>�Ƶ����ϵͳ</title>
<link href="<%=path %>/img/css.css" type="text/css" rel="stylesheet"/>
</head>
<body>

<br><br>
<table width="95%" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="left" valign="middle" style=" border: 0px"><font style=" font-size:24px; 

font-family:'΢���ź�'">�Ƶ�ͷ�Ԥ������ϵͳ</font></td>
  </tr>
</table>
<br><br>

<div id="content">

  <div id="menu_left">
    <div id="menu_right">
      <ul id="nav">
        <li class="top"><a href="<%=path %>/qiantai/index.jsp" class="top_link"><span>��ҳ</span></a></li>
        <li class="top"><a href="<%=path %>/qiantai/reg.jsp" class="top_link"><span>�û�ע��</span></a></li>
        <li class="top"><a href="<%=path %>/servlet/ShowUserServlet" class="top_link"><span>�û�����</span></a></li>
        <li class="top"><a href="<%=path %>/qiantai/search.jsp" class="top_link"><span>�ͷ�����</span></a></li>
        <li class="top"><a href="<%=path %>/qiantai/loan_hotel_note.jsp" class="top_link"><span>Ԥ����¼</span></a></li>

        <%
		  if(session.getAttribute("login") != null && !session.getAttribute("login").equals("")){
		  ArrayList al = (ArrayList)session.getAttribute("login");
		  String name = (String)al.get(1);
		  %>
        <li class="top"><a href="<%=path %>/servlet/RemoveServlet?login=1" class="top_link"><span>ע���˳�</span></a></li>
        <%} %>
      </ul>
    </div>
  </div>
</div>
</body>
</html>