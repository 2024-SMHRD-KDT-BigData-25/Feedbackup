<%@page import="java.util.List"%>
<%@page import="com.smhrd.basic.model.MavenMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%List<MavenMember> list = (List<MavenMember>) request.getAttribute("list"); %>
	<table border=1>
      <tr>
         <th>기업</th>
         <th>질문</th>
         <th>답변</th>
      </tr>
		<%for(MavenMember m : list) {%>
      <tr>
         <td><%=m.getJob_code() %></td>
         <td><%=m.getQ_text()%></td>
         <td><%=m.getA_text()%></td>
      </tr>
	<%} %>
   </table>
</body>
</html>