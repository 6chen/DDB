<%@page import="Model.Sentence"%>
<%@page import="java.util.List"%>
<%@page import="DAO.SentenceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

</head>
<body>
<!--<div class="panel panel-success">
       <div class="panel-heading">요구사항 문서 파싱 결과</div>
      <div class="panel-body"> -->
	<% 
		String fileNo = request.getParameter("fileNo");
		if(fileNo == null){
			out.print("조회된 결과가 없습니다.");
		}else{
			
			%>
			<table class="table">
		<thead>
			<tr>
				<th>파싱결과 번호</th>
				<th>파싱결과 내용</th>
				<th>파싱수행 시간</th>
				<th>업무후보 도출 </th>
			</tr>
		</thead>
		<tbody>
			
			
			<%
			SentenceDAO sentenceDAO = new SentenceDAO();
			List<Sentence> sentences =  sentenceDAO.getAllSentByFileNo(fileNo);
			
			for(Sentence sentence : sentences){
				%>
				<tr>
				<td width="110"><%=sentence.getSentenceNo() %></td>
				<td><%=sentence.getSentenceContent() %></td>
				<td width="110"><%=sentence.getSentenceInsertDate()%></td>
				<td width="110">미도출</td>
			</tr>
				
				<%
			}
			
			%>
					</tbody>
	</table>
			<%
		}
	%>
<!-- 	</div>
    </div> -->
</body>
</html>

