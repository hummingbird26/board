<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- bootstrap�� ����ϱ� ���� CDN�ּ� -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery�� ����ϱ����� CDN�ּ� -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
<script>
    $(document).ready(function(){
        $('#modifyButton').click(function(){
            if($('#board_pw').val().length <4) {
                alert('boardPw�� 4���̻� �̾�� �մϴ�');
                $('#board_pw').focus();
            } else if($('#board_title').val()=='') {
                alert('boardTitle�� �Է��ϼ���');
                $('#board_title').focus();
            } else if($('#board_content').val()=='') {
                alert('boardContent�� �Է��ϼ���');
                $('#board_content').focus();
            } else if($('#board_user').val()=='') {
                alert('boardUser�� �Է��ϼ���');
                $('#board_user').focus();
            } else {
                $('#modifyForm').submit();
            }
        });
    });
</script>
<title>BOARD MODIFY FORM(spring mvc ���)</title>
</head>
<body>
<div class="container">
    <h1>BOARD MODIFY FORM(spring mvc ���)</h1> 
    <form id="modifyForm" action="${pageContext.request.contextPath}/boardModify" method="post">
        <div class="form-group">boardNo :
            <input class="form-control" name="board_no" value="${board.board_no}" type="text" readonly="readonly"/>
        </div>
        <div class="form-group">
            <label for="board_pw">��й�ȣ Ȯ�� :</label>
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
            <input class="btn btn-default" id="modifyButton" type="button" value="�ۼ���"/>
            <input class="btn btn-default" type="reset" value="�ʱ�ȭ"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/boardList">�۸��</a>
        </div>
    </form>
</div>
</body>
</html>
