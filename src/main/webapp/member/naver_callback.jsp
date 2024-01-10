<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>

<body>

	<script type="text/javascript">
		var naver_id_login = new naver_id_login("OrBv0eSYId4RE2chxvPo",
				"http://localhost:9999/tayotayo/member/naver_callback.jsp");

		/*
		// 접근 토큰 값 출력
		alert(naver_id_login.oauthParams.access_token);
		 */

		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
			let email = naver_id_login.getProfileData('email');
			let nickname = naver_id_login.getProfileData('nickname');
			let id = naver_id_login.getProfileData('id');
			let name = naver_id_login.getProfileData('name');
			/*
			 alert('이메일: ' + email);
			 alert('닉네임: ' + nickname);
			 alert('전화번호: ' + mobile);
			 alert('아이디: ' + id);
			 alert('이름: ' + name);
			 */
			 
			// location.href='insert?email='+email+'&member_id='+id+'&name='+name+'&nickname='+nickname+'&tel='+mobile;
			const form = document.createElement('form'); // form 태그 생성
			form.setAttribute('method', 'post'); // 전송 방식 결정 (get or post)
			form.setAttribute('action', 'socialinsert'); // 전송할 url 지정

			let social = document.createElement('input'); //<input>
			social.setAttribute('name', 'id');
			social.setAttribute('value', id);

			let social2 = document.createElement('input');
			social2.setAttribute('name', 'type');
			social2.setAttribute('value', 'naver');

			form.appendChild(social);
			form.appendChild(social2);

			document.body.appendChild(form);
			form.submit();

			var social_id = document.getElementById("social_id");

			social.value = id;
			console.log(social_id.value);
			//window.close();
			opener.parent.fn_reload();

		}
	</script>
</body>
</html>