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
  <script language="JavaScript">
		function check11()
			{

				if (document.form1.name.value == "" )
				{
					alert("���Ʋ���Ϊ��!");
					document.form1.name.focus();
					return false;
				}
				if (document.form1.author.value == ""  )
				{
					alert("��Ų���Ϊ��!");
					document.form1.author.focus();
					return false;
				}
				if (document.form1.publishing.value == ""  )
				{
					alert("�Ƽ�ָ������Ϊ��!");
					document.form1.publishing.focus();
					return false;
				}
				if (document.form1.number.value == ""  )
				{
					alert("�ͷ���ʩ����Ϊ��!");
					document.form1.number.focus();
					return false;
				}
				if (document.form1.price.value == ""  )
				{
					alert("ÿ�շ��ò���Ϊ��!");
					document.form1.price.focus();
					return false;
				}
				if (document.form1.storage.value == ""  )
				{
					alert("������������Ϊ��!");
					document.form1.storage.focus();
					return false;
				}
				if (document.form1.brief.value == ""  )
				{
					alert("���ݲ���Ϊ��!");
					document.form1.brief.focus();
					return false;
				}

				if (document.form1.img.value == ""  )
				{
					alert("�ϴ��ļ�����Ϊ��!");
					document.form1.img.focus();
					return false;
				}
			}
</script>
	<jsp:include flush="true" page="/servlet/SessAdminServlet"/>
  <body>
	<div class="bg_color" style="height:100%;">
	<jsp:include flush="true" page="/servlet/ListServlet"/>
	<jsp:include flush="true" page="/admin/top.jsp"/>
	<form action="AddHotelServlet" method="post" name="form1" onSubmit="return check11()" enctype="multipart/form-data">
	<table width="50%" class="table_style"  align="center">
	<%
 	 ArrayList type = (ArrayList)request.getAttribute("type");
	 %>
		<tr>
			<td height="25"  align="right" width="31%">�ͷ����ƣ�</td>
			<td height="25"  width="66%">
			<input type="text" name="name" size="45"></td>
		</tr>
		<tr>
			<td height="25"  align="right" width="31%">�ͷ���ţ�</td>
			<td height="25"  width="66%">
			<input type="text" name="author" size="45"></td>
		</tr>
		<tr>
			<td height="25"  align="right" width="31%">�Ƽ�ָ����</td>
			<td height="25"  width="66%">
			<input type="text" name="publishing" size="45"></td>
		</tr>
		<tr>
			<td height="25"  align="right" width="31%">�ͷ���ʩ��</td>
			<td height="25"  width="66%">
			<input type="text" name="number" size="45"></td>
		</tr>
		<tr>
			<td height="25"  align="right" width="31%">ÿ�շ��ã�</td>
			<td height="25"  width="66%">
			<input type="text" name="price" size="45"></td>
		</tr>
		<tr>
			<td height="25"  align="right" width="31%">����������</td>
			<td height="25"  width="66%">
			<input type="text" name="storage" size="45"></td>
		</tr>
		<tr>
			<td height="25"  align="right" width="31%">�ͷ���飺</td>
			<td height="25"  width="66%">
			<textarea rows="12" name="brief" cols="43"></textarea></td>
		</tr>
		<tr>
			<td height="25"  align="right" width="31%">�ͷ����</td>
			<td height="25"  width="66%">
			<select name="type">
			<%
            for(int i = 0;i < type.size();i++){
            	ArrayList alRow = (ArrayList)type.get(i);
            %>
             <option value="<%=alRow.get(0)%>"><%=alRow.get(1)%></option>
             <%}%>
			</select>
			</td>
		</tr>
		<tr>
			<td height="25"  align="right" width="31%">
			�ͷ��ȼ���</td>
			<td height="25"  width="66%">
			<select size="1" name="tate">
			<option value="1">�Ƽ��ͷ�</option>
			<option value="2">��׼�ͷ�</option>
			</select></td>
		</tr>
		<tr>
			<td height="25"  align="right" width="31%">
			�ϴ�ͼƬ��</td>
			<td height="25"  width="66%">
			<input type="file" name="img" size="34"></td>
		</tr>
		<tr>
			<td height="25"  align="center" colspan="2">
			<input type="submit" value="���"></td>
		</tr>
		</table>
	</form>
  	</div>
  </body>
</html>