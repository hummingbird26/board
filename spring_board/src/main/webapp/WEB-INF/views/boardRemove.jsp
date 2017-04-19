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
                alert('boardPw는 4자이상 이어야 합니다');
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
            <!-- boardPw와 함께 boardNo값도 숨겨서(hidden값으로) 넘김 -->
            <input name="boardNo" value="${board.board_no }" type="hidden"/>
            <div>비밀번호확인 :</div>
            <div><input id="boardPw" name="boardPw" type="password"></div>
            <div>
                <input id="removeButton" type="button" value="삭제"/>
                <input type="reset" value="초기화"/>
            </div>
        </form>
</body>
</html>