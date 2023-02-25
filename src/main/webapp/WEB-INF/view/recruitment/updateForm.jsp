<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <style>
            * {
                font-weight: normal;
            }
        </style>

        <div class="container my-3">

            <form enctype="multipart/form-data">

                <div class="form-group pb-3">
                    <input type="text" class="form-control form-control-lg" placeholder="제목을 입력해주세요" name="title"
                        id="title" value="${recruitment.title}">
                </div>

                <div class="d-flex justify-content-between pb-3">
                    <div class="border border-end-0 border-start-0 pt-3" style="width: 47%;">
                        <div class="input-group mb-3">
                            <span class="input-group-text">경력</span>
                            <input type="text" class="form-control" list="career_list" placeholder="경력을 입력해주세요" name="career"
                                id="career" value="${recruitment.career}">
                            <datalist id="career_list">
                                <option value="신입">
                                <option value="경력">
                                <option value="무관">
                            </datalist>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text">학력</span>
                            <input type="text" class="form-control" list="education_list" placeholder="학력을 입력해주세요"
                                name="education" id="education" value="${recruitment.education}">
                            <datalist id="education_list">
                                <option value="학력무관">
                                <option value="고졸">
                                <option value="초대졸">
                                <option value="대졸">
                            </datalist>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text">기업형태</span>
                            <%-- 선택되어있었던 값이 수정할때 미리 선택되어있게 value값에 조건을 걸음 --%>
                            <select class="form-select" aria-label="Default select example" name="sector" id="sector">
                                <option value="Si" ${recruitment.sector == 'Si' ? 'selected' : ''}>Si</option>
                                <option value="웹에이전시" ${recruitment.sector == '웹에이전시' ? 'selected' : ''}>웹에이전시</option>
                                <option value="인력소싱" ${recruitment.sector == '인력소싱' ? 'selected' : ''}>인력소싱</option>
                                <option value="대기업" ${recruitment.sector == '대기업' ? 'selected' : ''}>대기업</option>
                                <option value="스타트업" ${recruitment.sector == '스타트업' ? 'selected' : ''}>스타트업</option>
                                <option value="서비스" ${recruitment.sector == '서비스' ? 'selected' : ''}>서비스</option>
                                <option value="컨설팅" ${recruitment.sector == '컨설팅' ? 'selected' : ''}>컨설팅</option>
                            </select>
                        </div>


                    </div>

                    <div class="border border-end-0 border-start-0 pt-3" style=" width: 47%;">
                        <div class="input-group mb-3">
                            <span class="input-group-text">급여</span>
                            <input type="text" class="form-control" list="pay_list" placeholder="급여를 입력해주세요" name="pay"
                                id="pay" vlaue="면접 후 결정" value="${recruitment.pay}">
                            <datalist id="pay_list">
                                <option value="면접 후 결정">
                                <option value="@@만원">
                            </datalist>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text">근무지역</span>
                            <input type="text" class="form-control" list="address_list" placeholder="근무지역을 입력해주세요"
                                name="address" id="address" value="${recruitment.address}">
                            <datalist id="address_list">
                                <option value="전국">
                                <option value="부산">
                            </datalist>
                        </div>
                        <div class="input-group mb-3">
                        <span class="input-group-text">희망포지션</span>
                        <select class="form-select" aria-label="Default select example" name="position" id="position">
                            <option value="프론트엔드" ${recruitment.position == '프론트엔드' ? 'selected' : ''}>프론트엔드</option>
                            <option value="백엔드" ${recruitment.position == '백엔드' ? 'selected' : ''}>백엔드</option>
                            <option value="소프트웨어" ${recruitment.position == '소프트웨어' ? 'selected' : ''}>소프트웨어</option>
                            <option value="안드로이드" ${recruitment.position == '안드로이드' ? 'selected' : ''}>안드로이드</option>
                            <option value="IOS" ${recruitment.position == 'IOS' ? 'selected' : ''}>IOS</option>
                            <option value="시스템, 네트워크 관리자" ${recruitment.position == '시스템, 네트워크 관리자' ? 'selected' : ''}>시스템, 네트워크 관리자</option>
                            <option value="머신러닝 엔지니어" ${recruitment.position == '머신러닝 엔지니어' ? 'selected' : ''}>머신러닝 엔지니어</option>
                            <option value="데이터 엔지니어" ${recruitment.position == '데이터 엔지니어' ? 'selected' : ''}>데이터 엔지니어</option>
                            <option value="빅데이터 엔지니어" ${recruitment.position == '빅데이터 엔지니어' ? 'selected' : ''}>빅데이터 엔지니어</option>
                            <option value="보안 엔지니어" ${recruitment.position == '보안 엔지니어' ? 'selected' : ''}>보안 엔지니어</option>
                            <option value="임베디드개발자" ${recruitment.position == '임베디드개발자' ? 'selected' : ''}>임베디드개발자</option>
                        </select>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <textarea class="form-control summernote" rows="5" id="content" name="content">${recruitment.content}</textarea>
                </div>

                <div class="input-group mb-3">
                    <label class="input-group-text" for="logo">
                        로고사진
                    </label>
                    <input type="file" class="form-control" id="enterpriseLogo" name="enterpriseLogo">
                </div>

                <div class="d-flex justify-content-center">
                    <button onclick="updateById(${recruitment.id})" type="button" class="btn btn-primary">글수정완료</button>
                </div>
            </form>
        </div>

        <script>

            function updateById(id) {
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

                var enterpriseLogoFile = $('#enterpriseLogo')[0].files[0];
                if (enterpriseLogoFile) {
                    // 파일 유형 체크
                    if (!enterpriseLogoFile.type.startsWith('image/')) {
                        alert('이미지 파일만 업로드 가능합니다.');
                        return;
                    }
                    formData.append('enterpriseLogo', enterpriseLogoFile);
                } else {
                    alert('파일을 선택해주세요.');
                    return;
                }

                $.ajax({
                    type: 'put',
                    url: '/recruitment/'+id,
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
                height: 400
            });
        </script>

        <%@ include file="../layout/footer.jsp" %>