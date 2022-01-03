<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
<head>
</head>
<jsp:include flush="true" page="top.jsp"/>
<body>
<div class="bg_color" style="height:100%;">
  <table>
    <tr>
      <td rowspan="2" width="200" valign="top"><jsp:include flush="true" page="left1.jsp"/></td>
      <td><jsp:include flush="true" page="login.jsp"/></td>
    </tr>
    <tr>
      <td width="100%"><jsp:include flush="true" page="/servlet/ListServlet"/>
        <table height="100%" align="center" width="100%">
          <tr>
            <td bgcolor="#CAE4FF"><b><font color="#ff9900">&nbsp;推荐客房</font></b></td>
          </tr>
          <tr>
            <td><%
				  ArrayList alNewly = (ArrayList)request.getAttribute("tuibook");
				  ArrayList newbook = (ArrayList)request.getAttribute("newbook");
                  ArrayList alType = (ArrayList)request.getAttribute("type");
                  int tem = 0;
				  int x = 0;
				  if(alNewly.size()%3 == 0){
				  	tem = alNewly.size()/3;
				  }else{
				  	tem = alNewly.size()/3+1;
				  }
				  for(int n = 1;n <= tem;n++){ 
					 %>
              <table width="100%">
                <tr>
                  <%
                for(int i = n*3-3;i < alNewly.size();i++){
                      ArrayList alNewlyRow = (ArrayList)alNewly.get(i);
                  %>
                  <td style="border:0">
                  
                  <table width="98%">
                      <tr >
                        <td colspan="2" bgcolor="#FFE3BB"><font color="#ff9900">
                          <%
							   for(int j = 0;j < alType.size();j++){
								  ArrayList alTypeRow = (ArrayList)alType.get(j);
								  if(alTypeRow.get(0).equals(alNewlyRow.get(8))){%>
                          <a href="<%=path%>/servlet/SearchServlet?types=<%=alTypeRow.get(0)%>"><%=alTypeRow.get(1)%></a>
                          <%break;}}%>
                          </font></td>
                      </tr>
                      <tr>
                        <td colspan="2" height="2">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="160" rowspan="4" valign="middle"><a href="<%=path%>/qiantai/loan_hotel.jsp?bookId=<%=alNewlyRow.get(0)%>"><img src="<%=path%>/<%=alNewlyRow.get(11)%>" border="0" alt="<%=alNewlyRow.get(1)%>" width="160" height="160"/></a></td>
                        <td><a href="<%=path%>/qiantai/loan_hotel.jsp?bookId=<%=alNewlyRow.get(0)%>">
                          <%if(alNewlyRow.get(1).toString().length()>10){%>
                          <%=alNewlyRow.get(1).toString().substring(0,7)%>......
                          <%}else{%>
                          <%=alNewlyRow.get(1)%>
                          <%}%>
                          </a></td>
                      </tr>
                      <tr>
                        <td>&nbsp;<%=alNewlyRow.get(5)%>元/日</td>
                      </tr>
                      <tr>
                        <td>&nbsp;剩余数量：<%=alNewlyRow.get(6)%></td>
                      </tr>
                      <tr>
                        <td><%
                              if(!alNewlyRow.get(6).equals("0")){ 
                              %>
                          <a href="<%=path%>/qiantai/loan_hotel.jsp?bookId=<%=alNewlyRow.get(0)%>"> <img height="18" src="<%=path%>/img/goumai.gif" width="40" border="0" alt=""/> </a>
                          <%}else{ %>
                          <a href="<%=path%>/qiantai/loan_hotel.jsp?bookId=<%=alNewlyRow.get(0)%>"> <img height="18" src="<%=path%>/img/goumai1.gif" width="40" border="0" alt=""/> </a>
                          <%} %></td>
                      </tr>
                    </table>
                    <br></td>
                  <%
                        x++;
			 	if(x == 3){
			 	x = 0;
			 	break;
			 	}
                        }
                        %>
                </tr>
              </table>
              <%} %></td>
          </tr>
          <tr>
            <td bgcolor="#D5D5EA">&nbsp;<b><font color="#66cc00">标准客房</font></b></td>
          </tr>
          <tr>
            <td><%
					 for(int n = 1;n <= tem;n++){ 
					 %>
              <table width="100%">
                <tr>
                  <%
                        x=0;
                for(int i = n*3-3;i < newbook.size();i++){
                      ArrayList alNewlyRow = (ArrayList)newbook.get(i);
                  %>
                  <td style="border:0"><table width="98%">
                      <tr>
                        <td colspan="2" bgcolor="#ccffcc"><font color="#66cc00">
                          <%
							   for(int j = 0;j < alType.size();j++){
								  ArrayList alTypeRow = (ArrayList)alType.get(j);
								  if(alTypeRow.get(0).equals(alNewlyRow.get(8))){%>
                          <a href="<%=path%>/servlet/SearchServlet?types=<%=alTypeRow.get(0)%>"><%=alTypeRow.get(1)%></a>
                          <%break;}}%>
                          </font></td>
                      </tr>
                      <tr>
                        <td colspan="2" height="2">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="90" rowspan="4" valign="middle"><a href="<%=path%>/servlet/BookinfServlet?id=<%=alNewlyRow.get(0)%>"> <img src="<%=path%>/<%=alNewlyRow.get(11)%>" border="0" alt="<%=alNewlyRow.get(1)%>" width="90" height="80"/> </a></td>
                        <td><a href="<%=path%>/servlet/BookinfServlet?id=<%=alNewlyRow.get(0)%>">
                          <%if(alNewlyRow.get(1).toString().length()>10){%>
                          <%=alNewlyRow.get(1).toString().substring(0,7)%>......
                          <%}else{%>
                          <%=alNewlyRow.get(1)%>
                          <%}%>
                          </a></td>
                      </tr>
                      <tr>
                        <td>&nbsp;<%=alNewlyRow.get(5)%>元/日</td>
                      </tr>
                      <tr>
                        <td>&nbsp;剩余数量：<%=alNewlyRow.get(6)%></td>
                      </tr>
                      <tr>
                        <td><%
                              if(!alNewlyRow.get(6).equals("0")){ 
                              %>
                          <a href="<%=path%>/qiantai/loan_hotel.jsp?bookId=<%=alNewlyRow.get(0)%>"> <img height="18" src="<%=path%>/img/goumai.gif" width="40" border="0" alt=""/> </a>
                          <%}else{ %>
                          <a href="<%=path%>/qiantai/beforehand_book.jsp?bookId=<%=alNewlyRow.get(0)%>"> <img height="18" src="<%=path%>/img/goumai1.gif" width="40" border="0" alt=""/> </a>
                          <%} %></td>
                      </tr>
                    </table>
                    <br></td>
                  <%
                        x++;
			 	if(x == 3){
			 	x = 0;
			 	break;
			 	}
                        }
                        %>
                </tr>
              </table>
              <%} %></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<jsp:include flush="true" page="Copyright.jsp"/>
</body>
</html>

