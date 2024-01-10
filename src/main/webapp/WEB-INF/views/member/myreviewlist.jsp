<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body class="sb-nav-fixed">
	<main class="mt-5 pt-5">
	<div class="container-fluid px-4">
 
		<div class="card mb-4">
			<div class="card-header">
				<a class="btn btn-primary float-end" href="register"> <!-- <i class="fas fa-table me-1"></i> -->
					<i class="fas fa-edit"></i> 글 작성
				</a>
			</div>
			<div class="card-body">
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>좋아요</th>
							<th>시간</th>
							<th>충전소번호</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${result2}" var="board">
							<tr>
								<td>${board.r_num}</td>
								<td><a href="get?bno=${board.r_num} ">${board.r_title}</a></td>
								<td>${board.r_writer}</td>
								<td>${board.r_like}</td>
								<td>${board.r_time}</td>
								<td>${board.r_statId}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</main>

</body>
</html>