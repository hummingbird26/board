<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
<script>
    $(document).ready(function(){
    //    alert('jquery test');
    /* 입력폼 유효성 관련 요구사항
        1. 모든 폼은 공백 또는 "" 문자는 입력되면 안된다.
        2. 비밀번호는 4자이상 입력하여야 한다.
    */
        $('#addButton').click(function(){
            if($('#board_pw').val().length <4) {
                alert('boardPw는 4자이상 이어야 합니다');
                $('#board_pw').focus();
            } else if($('#board_title').val()=='') {
                alert('boardTitle을 입력하세요');
                $('#board_title').focus();
            } else if($('#board_content').val()=='') {
                alert('boardContent을 입력하세요');
                $('#board_content').focus();
            } else if($('#board_user').val()=='') {
                alert('boardUser을 입력하세요');
                $('#board_user').focus();
            } else {
                $('#addForm').submit();
            }
        });
    });
</script>
<title>BOARD ADD(모델2 방식)</title>
</head>
<body>
<div class="container">
    <h1>BOARD ADD(모델2 방식)</h1>
    <form id="addForm" action="${pageContext.request.contextPath}/boardAdd" method="post">
        <div class="form-group">
            <label for="board_pw">boardPw :</label>
            <input class="form-control" name="board_pw" id="board_pw" type="password"/>
        </div>
        <div class="form-group">
            <label for="board_tw">boardTitle :</label>
            <input class="form-control" name="board_title" id="board_title" type="text"/>
        </div>
        <div class="form-group">
            <label for="board_content">boardContent :</label>
            <textarea class="form-control" name="board_content" id="board_content" rows="5" cols="50"></textarea>
        </div>
        <div class="form-group">
            <label for="board_user">boardName :</label>
            <input class="form-control" name="board_user" id="board_user" type="text"/>
        </div>
        <div>
            <input class="btn btn-default" id="addButton" type="button" value="글입력"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/boardList">글목록</a>
        </div>
    </form>
</div>
</body>
</html>