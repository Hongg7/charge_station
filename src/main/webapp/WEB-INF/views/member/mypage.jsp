<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.multi.tayotayo.member.MemberVO"%>
<%@page import="com.multi.tayotayo.member.MemberDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Page</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 0;
}

header {
	background-color: #333;
	color: #fff;
	padding: 20px;
	text-align: center;
}

section {
	max-width: 800px;
	margin: 20px auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 590px;
}

h1 {
	color: #333;
}

p {
	line-height: 1.6;
	color: #555;
}

footer {
	background-color: #333;
	color: #fff;
	text-align: center;
	padding: 10px;
	position: fixed;
	bottom: 0;
	width: 100%;
}

.tt {
	margin-bottom: 5px;
	margin-left: 5px;
}
</style>
</head>
<body>





	<jsp:include page="/header.jsp"></jsp:include>
	<h1 style="text-align: center; margin-top: 15px; margin-bottom: 20px;">MyPage</h1>
	<section>
		<h2>기본 정보</h2>
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label"
				style="margin-top: 10px;">ID: </label> <label
				for="exampleFormControlInput1" class="form-label">${result.member_id}</label>
		</div>
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">이름</label>
			<button class="btn btn-outline-primary tt" data-bs-toggle="modal"
				data-bs-target="#nameModal">수정</button>
			<input type="text" class="form-control" id="exampleFormControlInput1"
				placeholder="-" value="${result.name}" disabled>
		</div>

		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">닉네임</label>
			<button class="btn btn-outline-primary tt" data-bs-toggle="modal"
				data-bs-target="#nicknameModal">수정</button>
			<input type="text" class="form-control" id="exampleFormControlInput1"
				placeholder="-" value="${result.nickname}" disabled>
		</div>

	</section>



	<section>
		<h2>연락처 정보</h2>
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">이메일</label>
			<button class="btn btn-outline-primary tt" data-bs-toggle="modal"
				data-bs-target="#emailModal">수정</button>
			<input type="email" class="form-control"
				id="exampleFormControlInput1" placeholder="-"
				value="${result.email}" disabled>
		</div>

		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">휴대전화</label>
			<button class="btn btn-outline-primary tt" data-bs-toggle="modal"
				data-bs-target="#telModal">수정</button>
			<input type="tel" class="form-control" id="exampleFormControlInput1"
				placeholder="-" value="${result.tel}" disabled>
		</div>
	</section>

	<section>
		<h2>개인 정보</h2>

		<div class="mb-3">
			<button class="btn btn-outline-primary" data-bs-toggle="modal"
				data-bs-target="#pwModal">비밀번호 변경</button>
		</div>
	</section>
	<section>
		<h2>내 게시글</h2>
		<div class="mb-3">
			<jsp:include page="myreviewlist.jsp"></jsp:include>
		</div>
	</section>

	<section>
		<h2>내 댓글</h2>
		<div class="mb-3">
			<jsp:include page="myreplylist.jsp"></jsp:include>
		</div>
	</section>

	<div style="text-align: center;">
		<button type="button" class="btn btn-outline-danger"
			style="margin-right: 480px; margin-top: 10px;" data-bs-toggle="modal"
			data-bs-target="#deleteModal">계정탈퇴</button>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="modal fade" id="nameModal" tabindex="-1"
		aria-labelledby="nameModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="nameModalLabel">이름 변경</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="nameupdate" method="post" accept-charset="utf-8">
					<div class="modal-body">

						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">이름</label> <input
								type="hidden" class="form-control" id="member_id"
								value="${result.member_id}" name="member_id"> <input
								type="text" class="form-control" id="nametext"
								value="${result.name}" name="name">
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary">변경하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<div class="modal fade" id="nicknameModal" tabindex="-1"
		aria-labelledby="nicknameModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="nicknameModalLabel">닉네임 변경</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="nicknameupdate" method="post" accept-charset="utf-8">
					<div class="modal-body">

						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">닉네임</label> <input
								type="hidden" class="form-control" id="member_id"
								value="${result.member_id}" name="member_id"> <input
								type="text" class="form-control" id="recipient-name"
								value="${result.nickname}" name="nickname">
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary">변경하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<div class="modal fade" id="emailModal" tabindex="-1"
		aria-labelledby="emailModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="emailModalLabel">이메일 변경</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="emailupdate" method="post" accept-charset="utf-8">
					<div class="modal-body">

						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">이메일</label> <input
								type="hidden" class="form-control" id="member_id"
								value="${result.member_id}" name="member_id"> <input
								type="text" class="form-control" id="recipient-name"
								value="${result.email}" name="email">
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary">변경하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>



	<div class="modal fade" id="telModal" tabindex="-1"
		aria-labelledby="telModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="telModalLabel">휴대전화 변경</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="telupdate" method="post" accept-charset="utf-8">
					<div class="modal-body">

						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">휴대전화</label> <input
								type="hidden" class="form-control" id="member_id"
								value="${result.member_id}" name="member_id"> <input
								type="text" class="form-control" id="recipient-name"
								value="${result.tel}" name="tel">
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary">변경하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>




	<div class="modal fade" id="pwModal" tabindex="-1"
		aria-labelledby="pwModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="pwModalLabel">비밀번호 변경</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="pwupdate" method="post" accept-charset="utf-8">
					<div class="modal-body">
						<input type="hidden" class="form-control" id="member_id"
							value="${result.member_id}" name="member_id">

						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">현재
								비밀번호</label> <input type="text" class="form-control" id="recipient-name"
								name="pw">
						</div>

						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">새 비밀번호</label>

							<input type="text" class="form-control" id="recipient-name"
								name="pw_1">
						</div>

						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">새 비밀번호
								확인</label> <input type="text" class="form-control" id="recipient-name"
								name="pw_2">
						</div>



					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary">변경하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="modal" tabindex="-1" id="deleteModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">계정탈퇴</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="delete" method="post" accept-charset="utf-8">
					<div class="modal-body">
						<p>
							계정을 탈퇴하시겠습니까?<br> 탈퇴한 계정은 복구가 불가능 합니다.
						</p>
						<input type="hidden" class="form-control" id="member_id"
							value="${result.member_id}" name="member_id">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">삭제</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<footer> &copy; 2024 tayotayo </footer>

</body>
</html>