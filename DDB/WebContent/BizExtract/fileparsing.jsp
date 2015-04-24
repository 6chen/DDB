<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>요구사항 파일 파싱</title>
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
</head>
<body>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<strong>요구사항 파일 파싱</strong>
		</div>
		<div class="panel-body">
			<form action="fileparser" role="form">
				<div class="form-group">
					<label for="usr">요구사항 파일 경로를 입력하세요(docx):</label>
					<input type="text" class="form-control" id="usr">
				</div>
				<div>
					<button type="button" class="btn btn-default">파일 경로</button>
					<button type="submit" class="btn btn-success">파싱 시작</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>