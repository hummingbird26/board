<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
    $(document).ready(function(){
        $('#removeButton').click(function(){
            if($('#boardPw').val().length <4) {
                alert('boardPw�� 4���̻� �̾�� �մϴ�');
                $('#boardPw').focus();
            } else {
                $('#removeForm').submit();
            }
        });
    });
</script>
<title>BOARD REMOVE FORM</title>
</head>
<body>

        <form id="removeForm" action="${pageContext.request.contextPath}/boardRemove" method="post">
            <!-- boardPw�� �Բ� boardNo���� ���ܼ�(hidden������) �ѱ� -->
            <input name="boardNo" value="${board.board_no }" type="hidden"/>
            <div>��й�ȣȮ�� :</div>
            <div><input id="boardPw" name="boardPw" type="password"></div>
            <div>
                <input id="removeButton" type="button" value="����"/>
                <input type="reset" value="�ʱ�ȭ"/>
            </div>
        </form>
</body>
</html>