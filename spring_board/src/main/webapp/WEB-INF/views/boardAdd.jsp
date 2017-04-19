<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- bootstrap�� ����ϱ� ���� CDN�ּ� -->
<!-- git Test1 -->
<!-- git Test23 -->

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery�� ����ϱ����� CDN�ּ� -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript�ҽ��� ����ϱ� ���� CDN�ּ� -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
<script>
    $(document).ready(function(){
    //    alert('jquery test');
    /* �Է��� ��ȿ�� ���� �䱸����
        1. ��� ���� ���� �Ǵ� "" ���ڴ� �ԷµǸ� �ȵȴ�.
        2. ��й�ȣ�� 4���̻� �Է��Ͽ��� �Ѵ�.
    */
        $('#addButton').click(function(){
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
                $('#addForm').submit();
            }
        });
    });
</script>
<title>BOARD ADD(��2 ���)</title>
</head>
<body>
<div class="container">
    <h1>BOARD ADD(��2 ���)</h1>
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
            <input class="btn btn-default" id="addButton" type="button" value="���Է�"/>
            <input class="btn btn-default" type="reset" value="�ʱ�ȭ"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/boardList">�۸��</a>
        </div>
    </form>
</div>
</body>
</html>