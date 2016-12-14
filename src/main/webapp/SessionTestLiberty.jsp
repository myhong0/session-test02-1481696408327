<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Date"%>
<%@page import="javax.naming.InitialContext"%>


<html>
<script language="javascript">
<!--
function move()
{
   var frm = document.frm;
   frm.action = "SessionTestLiberty.jsp";
   frm.submit();
}
//-->
</script>
<head>
<%
	if (request.getParameter("DATA")!= null){
		session.setAttribute("DATA",request.getParameter("DATA"));
	}
		
 %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Session Tester JSP</title>
</head>
<body><p>Your session details:</p>
<table border="1">
	<tbody>
		<tr>
			<td>Session Id:</td>
			<td><%=session.getId() %></td>
		</tr>
		<tr>
			<td>Session creation date:</td>
			<td><%=new Date(session.getCreationTime())%></td>
		</tr>
		<tr>
			<td>Last time session accessed</td>
			<td><%=new Date(session.getLastAccessedTime())%></td>
		</tr>
		<tr>
			<td>Any data</td>
			<td><%= (session.getAttribute("DATA")!=null)?new String((session.getAttribute("DATA")).toString().getBytes("8859_1"), "UTF-8"):"&nbsp;" %></td>
		</tr>
		<tr>
		    <td>Server name</td>
		    <td><%=new InitialContext().lookup("serverName")%></td>
		</tr>
	</tbody>
</table>

<form action="SessionTestLiberty.jsp">Enter some data to store in the session:<input type="text" name="DATA" size="20"><br>
<input type="submit" name="Submit" value="Submit">&nbsp;&nbsp;<input type="button" name="Get" value = "Get" onClick="window.location='./SessionTestLiberty.jsp'">
</form>
</body>
</html>