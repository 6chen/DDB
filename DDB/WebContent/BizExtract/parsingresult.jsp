<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="Model.BizRequir"%>
<%@page import="java.util.List"%>
<%@page import="DAO.BizRequirDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파싱결과 조회</title>
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

<script type="text/javascript">
	$(document).ready(function() {
		$("ul>li").click(function() {
			var btnVal = $(this).text();
			$("#fileSelectMenuBtn").text(btnVal);
			$("#resultMain").attr("src","./parsingresult2.jsp?fileNo="+btnVal);
		});
	});
</script>

</head>
<body>
	<div class="container-fluid">
	<div class="panel panel-success">
      <div class="panel-heading">요구사항 문서 파싱 결과</div>
      <div class="panel-body">
      		<div class="row-fluid">
			<div class="span12">
				<div id="fileSelectMenu" class="dropdown">
					<button class="btn btn-default dropdown-toggle" type="button"
						id="fileSelectMenuBtn" data-toggle="dropdown">
						파일을 선택하세요 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu"
						aria-labelledby="fileSelectMenuBtn">

						<%
							BizRequirDAO bizRequirDAO = new BizRequirDAO();
										List<BizRequir> bizRequirs =  bizRequirDAO.getAllBizRequirs();
										
										for(BizRequir bizRequir : bizRequirs){
						%>


						<li role="presentation"><a role="menuitem" tabindex="-1"
							href="#"><%=bizRequir.getBizRequirNo()%></a></li>
						<%
							}
						%>
					</ul>
					파일의 파싱 결과:
				</div>
				<p></p>
				<iframe id="resultMain" src="parsingresult2.jsp" frameborder=0 scrolling="no"
					width="100%" height="800"> </iframe>
			</div>
		</div>
		</div>
    </div>
	</div>
</body>
</html>