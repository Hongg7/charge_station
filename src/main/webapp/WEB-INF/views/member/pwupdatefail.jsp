<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script>
    alert("<%= request.getAttribute("fail") %>\n비밀번호 변경 실패");
    location.href = "mypage";
</script>