<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <style>
            * {
                font-weight: normal;
            }
        </style>

        <div class="container my-3" style="width: 65%">

            <form enctype="multipart/form-data">

                <div class="form-group pb-3">
                    <input type="text" class="form-control form-control-lg" placeholder="제목을 입력해주세요" name="title"
                        id="title" vlaue="제목">
                </div>

                <div class="d-flex justify-content-between pb-3">
                    <div class="border border-end-0 border-start-0 pt-3" style="width: 47%;">
                        <div class="input-group mb-3">
                            <span class="input-group-text">경력</span>
                            <select class="form-select" aria-label="Default select example" name="career" id="career">
                                <option selected>Open this select menu</option>
                                <option value="무관">무관</option>
                                <option value="신입">신입</option>
                                <option value="경력">경력</option>
                            </select>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text">학력</span>
                            <select class="form-select" aria-label="Default select example" name="education" id="education">
                                <option selected>Open this select menu</option>
                                <option value="학력무관">학력무관</option>
                                <option value="고졸이상">고졸이상</option>
                                <option value="대졸이상">대졸이상</option>
                            </select>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text">기업형태</span>
                            <select class="form-select" aria-label="Default select example" name="sector" id="sector">
                                <option selected>Open this select menu</option>
                                <option value="Si">Si</option>
                                <option value="웹에이전시">웹에이전시</option>
                                <option value="인력소싱">인력소싱</option>
                                <option value="대기업">대기업</option>
                                <option value="스타트업">스타트업</option>
                                <option value="서비스">서비스</option>
                                <option value="컨설팅">컨설팅</option>
                            </select>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                            <div style="width: 100%;">
                                <span class="input-group-text">기술스택</span>
                            </div>
                        </div>
                        <div class="d-flex justify-content-between">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input" name="skill" value="1">Java
                                </label>
                                <br>
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input" name="skill" value="2">HTML
                                </label>
                                <br>
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input" name="skill" value="3">JavaScript
                                </label>
                                <br>
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input" name="skill" value="4">VueJS
                                </label>
                                <br>
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input" name="skill" value="5">CSS
                                </label>
                                <br>
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input" name="skill" value="6">Node.js
                                </label>
                                <br>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input" name="skill" value="7">React
                                </label>
                                <br>
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input" name="skill" value="8">ReactJS
                                </label>
                                <br>
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input" name="skill" value="9">Typescript
                                </label>
                                <br>
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input" name="skill" value="10">Zustand
                                </label>
                                <br>
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input" name="skill" value="11">AWS
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="border border-end-0 border-start-0 pt-3" style=" width: 47%;">
                        <div class="input-group mb-3">
                            <span class="input-group-text">급여</span>
                            <input type="text" class="form-control" list="pay_list" placeholder="급여를 입력해주세요" name="pay"
                                id="pay" vlaue="면접 후 결정">
                            <datalist id="pay_list">
                                <option value="면접 후 결정">
                                <option value="@@만원">
                            </datalist>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text">근무지역</span>
                            <input type="text" class="form-control" list="address_list" placeholder="근무지역을 입력해주세요"
                                name="address" id="address" vlaue="전국">
                            <datalist id="address_list">
                                <option value="전국">
                                <option value="부산">
                            </datalist>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text">희망포지션</span>
                            <select class="form-select" aria-label="Default select example" name="position"
                                id="position">
                                <option selected>Open this select menu</option>
                                <option value="프론트엔드">프론트엔드</option>
                                <option value="백엔드">백엔드</option>
                                <option value="소프트웨어">소프트웨어</option>
                                <option value="안드로이드">안드로이드</option>
                                <option value="IOS">IOS</option>
                                <option value="시스템,네트워크관리자">시스템,네트워크관리자</option>
                                <option value="머신러닝엔지니어">머신러닝엔지니어</option>
                                <option value="데이터엔지니어">데이터엔지니어</option>
                                <option value="빅데이터엔지니어">빅데이터엔지니어</option>
                                <option value="보안엔지니어">보안엔지니어</option>
                                <option value="임베디드개발자">임베디드개발자</option>
                            </select>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text">채용공고 마감기한</span>
                            <input type="date" class="form-control" name="deadline" id="deadline" min="2000-01-01" required />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <textarea class="form-control summernote" rows="5" id="content" name="content"></textarea>
                </div>

                <div class="input-group mb-3">
                    <label class="input-group-text" for="logo">
                        로고사진
                    </label>
                    <input type="file" class="form-control" id="enterpriseLogo" name="enterpriseLogo">
                </div>

                <div class="d-flex justify-content-center">
                    <button onclick="save()" type="button" class="btn btn-primary">글쓰기완료</button>
                </div>
            </form>
        </div>

        <script>

            function save() {
                // FormData 객체 생성
                var formData = new FormData();

                // input 요소에서 값을 가져와서 FormData 객체에 추가
                formData.append('title', $('#title').val());
                formData.append('content', $('#content').val());
                formData.append('career', $('#career').val());
                formData.append('education', $('#education').val());
                formData.append('pay', $('#pay').val());
                formData.append('sector', $('#sector').val());
                formData.append('position', $('#position').val());
                formData.append('address', $('#address').val());

                // 체크된 기술스택 값을 배열로 가져와서 FormData 객체에 추가
                var skill = $('input[name="skill"]:checked').map(function () {
                    return $(this).val();
                }).get();
                formData.append('skill', skill);

                var enterpriseLogoFile = $('#enterpriseLogo')[0].files[0];
                if (enterpriseLogoFile) {
                    // 파일 유형 체크
                    if (!enterpriseLogoFile.type.startsWith('image/')) {
                        alert('이미지 파일만 업로드 가능합니다.');
                        return;
                    }
                    formData.append('enterpriseLogo', enterpriseLogoFile);
                } else {
                    // 
                    alert('파일을 선택해주세요.');
                    return;
                }
                formData.append('deadline', $('#deadline').val());

                $.ajax({
                    type: 'post',
                    url: '/recruitment',
                    data: formData,
                    contentType: false, // 필수 : x-www-form-urlencoded로 파싱되는 것을 방지
                    processData: false, // 필수: contentType을 false로 줬을 때 QueryString 자동 설정됨. 해제
                    dataType: "json"
                }).done((res) => { // 20X 일때
                    alert(res.msg);
                    location.href = "/";
                }).fail((err) => { // 40X, 50X 일때
                    alert(err.responseJSON.msg);
                });
            }
        </script>

        <script>
            $('.summernote').summernote({
                tabsize: 2,
                height: 400,
                disableDragAndDrop: true,
            });
            $('.summernote').summernote(
                'code', '주요업무 <br>• 미리 작성된 내용입니다. <br>• 미리 작성된 내용입니다. <br>• 미리 작성된 내용입니다. <br><br>자격요건 <br>• 미리 작성된 내용입니다. <br>• 미리 작성된 내용입니다. <br>• 미리 작성된 내용입니다. <br>• 미리 작성된 내용입니다. <br><br>우대사항 <br>• 미리 작성된 내용입니다. <br>• 미리 작성된 내용입니다. <br>• 미리 작성된 내용입니다. <br>• 미리 작성된 내용입니다. <br><br>혜택 및 복지 <br>• 미리 작성된 내용입니다. <br>• 미리 작성된 내용입니다. <br>• 미리 작성된 내용입니다. <br>• 미리 작성된 내용입니다. <br>'
            );
            
        </script>

        <%@ include file="../layout/footer.jsp" %>