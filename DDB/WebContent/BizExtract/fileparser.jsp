<%@page import="util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String fileName = request.getParameter("fileName");

	FileParser fileParser = new FileParser();
	fileParser.startParsing(fileName);
	
%>

<script type="text/javascript">
	alert("파싱 완료 되었습니다.");
	location.href = "fileparsing.jsp";
</script>