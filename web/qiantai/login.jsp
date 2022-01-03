<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
<head>
</head>
<script language="JavaScript">
		function login11()
			{
				
				if (document.form1.name.value == "" ) 
				{
					alert("请输入用户名!");
					document.form1.name.focus();
					return false;
				}
				if (document.form1.pwd.value == ""  )  
				{
					alert("请输入密码!");
					document.form1.pwd.focus();
					return false;
				}
			}
</script>
<%
String error = (String)request.getAttribute("error");
String ok = (String)request.getAttribute("ok");
if(error != null && error.equals("1")){
%>
<script>alert('用户名或密码错误!')</script>
<%
}
%>
<body>
<form method="post" action="<%=path %>/servlet/UserLoginServlet" name="form1" onSubmit="return login11()">
  <table align="center" width="100%" style="border:0">
    <%
  if(session.getAttribute("login") != null && !session.getAttribute("login").equals("")){
  ArrayList al = (ArrayList)session.getAttribute("login");
  String name = (String)al.get(1);
  %>
    <tr>
      <td align="center" style="border:0"><%=name %>您好，欢迎光临！</td>
    </tr>
    <%
  }else{
   %>
    <tr align="center">
      <td style="border:0"><FONT color="#999999">用户您好，预定客房请先登录</FONT> 用户名：
        <input class="input7" type="text" name="name" style="width:100px;">
        密&nbsp; 码：
        <input class="input7" type="password" name="pwd" style="width:100px;">
        &nbsp;&nbsp;
        <input type="submit" value="登录"></td>
    </tr>
    <%} %>
  </table>
</form>
</body>
</html>