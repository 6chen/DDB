<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>데이터 베이스 설계 및 구축</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#home").click(function() {
			$("#mainFrame").attr("src", "main.jsp");
		});
		$("#fileParsingPage").click(function() {
			$("#mainFrame").attr("src", "./BizExtract/fileparsing.jsp");
		});
		$("#parsingResult").click(function() {
			$("#mainFrame").attr("src", "./BizExtract/parsingresult.jsp");
		});
		$("#bizConResult").click(function() {
			$("#mainFrame").attr("src", "./BizExtract/bizconresult.jsp");
		});
	});
</script>

</head>
<body>
	<p></p>
	<div class="container">
		<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">DBEC Yusin</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li class="active"><a id="home" href="#">Home</a></li>
					<li><a id="fileParsingPage" href="#">요구사항 문서 파싱</a></li>
					<li><a id="parsingResult" href="#">파싱결과 조회</a></li>
					<li><a id="bizConResult" href="#">업무후보 조회</a></li>
				</ul>
			</div>
		</div>
		</nav>
	</div>
	<div class="container">
		<script type="text/javascript" language="javascript">
			function iFrameHeight() {
				var ifm = document.getElementById("mainFrame");
				var subWeb = document.frames ? document.frames["mainFrame"].document
						: ifm.contentDocument;
				if (ifm != null && subWeb != null) {
					ifm.height = subWeb.body.scrollHeight;
				}
			}
		</script>
		<iframe id="mainFrame" src="main.jsp" frameborder=0 scrolling="no"
			width="1140" onLoad="iFrameHeight()"> </iframe>
	</div>
</body>
</html>