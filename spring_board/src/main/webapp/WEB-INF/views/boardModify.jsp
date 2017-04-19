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
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
<script>
    $(document).ready(function(){
        $('#modifyButton').click(function(){
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
                $('#modifyForm').submit();
            }
        });
    });
</script>
<title>BOARD MODIFY FORM(spring mvc 방식)</title>
</head>
<body>
<div class="container">
    <h1>BOARD MODIFY FORM(spring mvc 방식)</h1> 
    <form id="modifyForm" action="${pageContext.request.contextPath}/boardModify" method="post">
        <div class="form-group">boardNo :
            <input class="form-control" name="board_no" value="${board.board_no}" type="text" readonly="readonly"/>
        </div>
        <div class="form-group">
            <label for="board_pw">비밀번호 확인 :</label>
            <input class="form-control" name="board_pw" id="board_pw" type="password"/>
        </div>    
        <div class="form-group">
            <label for="board_title">boardTitle :</label>
            <input class="form-control" value="${board.board_title}" name="board_title" id="board_title" type="text"/>
        </div>
        <div class="form-group">boardContent :
            <textarea class="form-control" id="board_content" name="board_content" rows="5" cols="50">${board.board_content}</textarea>
        </div>
        <div>
            <input class="btn btn-default" id="modifyButton" type="button" value="글수정"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/boardList">글목록</a>
        </div>
    </form>
</div>
</body>
</html>
