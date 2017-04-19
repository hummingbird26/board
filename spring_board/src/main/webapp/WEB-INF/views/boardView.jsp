<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<title>boardView</title>
</head>
<body>
<div class = "container">
<h1>BOARD VIEW</h1>

	<div class="row">
		<div class="col-md-4">
                board_no : ${board.board_no}
        </div>
        <div class="col-md-4">
                board_title : ${board.board_title}
        </div>
    </div>
   	<div class = "row">
                <div class="col-md-4">board_user : ${board.board_user}</div>
                <div class="col-md-4">board_date : ${board.board_date}</div>
	</div>
    <div class = "row">
    			<div class="col-md-8">board_content : </div>
	</div>
	<div class = "row">
                <div class="col-md-8">${board.board_content}</div>
	</div>

                <div>
                    <a href="${pageContext.request.contextPath}/boardModify?boardNo=${board.board_no}">
                    <input class = "btn-default" type = "button" value = "수정"/>
                    </a>
                    <a href="${pageContext.request.contextPath}/boardRemove?boardNo=${board.board_no}">
                    <input class = "btn-default" type = "button" value = "삭제"/>
                    </a>
                </div>
</div>
</body>
</html>
