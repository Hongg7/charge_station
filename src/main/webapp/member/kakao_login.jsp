<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 로그인</title>
</head>
<body>
    <a href="javascript:kakaoLogin();"><img src="${pageContext.request.contextPath}/resource/imgkakao_login_large_wide.png" style='height: 60px;'/></a>

    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        window.Kakao.init('45c1cd64aacc21cd28c22195c1f202be');

        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'profile_nickname, account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                    console.log(response) // 로그인 성공하면 받아오는 데이터
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                        url: '/v2/user/me',
                        success: (res) => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account.email);
                            
                            const form = document.createElement('form'); // form 태그 생성
                            form.setAttribute('method', 'post'); // 전송 방식 결정 (get or post)
                            form.setAttribute('action', 'socialinsert'); // 전송할 url 지정
                            
                            let social = document.createElement('input'); //<input>
                            social.setAttribute('name', 'email')
                            social.setAttribute('value', kakao_account.email)
                            

                            let social2 = document.createElement('input');
                            social2.setAttribute('name','member_id');
                            social2.setAttribute('value',kakao_account.email);
                            
                            let social3 = document.createElement('input');
                            social3.setAttribute('name','type');
                            social3.setAttribute('value','kakao');
                            
                            
                            form.appendChild(social);
                            form.appendChild(social2);
                            form.appendChild(social3);
                            
                            document.body.appendChild(form);
                            form.submit();
                        }
                    });
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
    </script>
</body>

</html>