<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <!-- 게시판부분 -->
        <div class="container-fluid" style="width: 65%">
            <div class="row py-1">
                <div class="col">
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="/images/career.png" class="card-img-top" alt="..." style="width: 50px; height: 50px;">
                            <h5 class="card-title pt-2">경력</h5>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="/images/education.png" class="card-img-top" alt="..." style="width: 50px; height: 50px;">
                            <h5 class="card-title pt-2">교육</h5>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="/images/sector.png" class="card-img-top" alt="..." style="width: 50px; height: 50px;">
                            <h5 class="card-title pt-2">분야</h5>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="/images/position.png" class="card-img-top" alt="..." style="width: 50px; height: 50px;">
                            <h5 class="card-title pt-2">직무</h5>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="/images/tech.png" class="card-img-top" alt="..." style="width: 50px; height: 50px;">
                            <h5 class="card-title pt-2">기술스택</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>    
        <div class="container-fluid" style="width: 65%">
            <div class="row py-3">
                <div class="col">
                <select class="form-select" aria-label="Default select example">
                <option selected>신입/경력</option>
                <option value="1">신입</option>
                <option value="2">경력</option>
                <option value="3">무관</option>
                </select>
                </div>
                <div class="col">
                <select class="form-select" aria-label="Default select example">
                <option selected>학력사항</option>
                <option value="1">대졸 이상</option>
                <option value="2">고졸 이상</option>
                <option value="3">학력 무관</option>
                </select>
                </div>
                <div class="col">
                <select class="form-select" aria-label="Default select example">
                <option selected>분야</option>
                <option value="1">si</option>
                <option value="2">웹에이전시</option>
                <option value="3">인력소싱</option>
                <option value="3">대기업</option>
                <option value="3">스타트업</option>
                <option value="3">서비스</option>
                <option value="3">컨설팅</option>
                </select>
                </div>
                <div class="col">
                <select class="form-select" aria-label="Default select example">
                <option selected>직무</option>
                <option value="1">프론트엔드</option>
                <option value="2">백엔드</option>
                <option value="3">소프트웨어</option>
                <option value="3">안드로이드</option>
                <option value="3">IOS</option>
                <option value="3">시스템, 네트워크 관리자</option>
                <option value="3">머신러닝 엔지니어</option>
                <option value="3">데이터 엔지니어</option>
                <option value="3">빅데이터 엔지니어</option>
                <option value="3">보안 엔지니어</option>
                <option value="3">임베디드개발자</option>
                </select>
                </div>
                <div class="col">
                <select class="form-select" aria-label="Default select example">
                <option selected>기술스택</option>
                <option value="1">Java</option>
                <option value="2">Html</option>
                <option value="3">JavaScript</option>
                <option value="3">VueJS</option>
                <option value="3">CSS</option>
                <option value="3">Node.Js</option>
                <option value="3">React</option>
                <option value="3">ReactJS</option>
                <option value="3">Typescript</option>
                <option value="3">Zustand</option>
                <option value="3">AWS</option>
                </select>
                </div>
            </div>
            <div class="row justify-content-center align-items-center py-3" style="background-color: whitesmoke;">
                <div class="col-6 text-center">
                    <button type="submit" class="btn btn-primary" onclick="search()">선택한 조건으로 검색</button>
                </div>
            </div>
            <div class="row justify-content-end align-items-center py-3">
                <div class="col-4 text-center">
                    <input type="text" class="form-control" id="search" placeholder="검색어를 입력하세요">
                </div>
                <div class="col-auto text-end px-0">
                    <button type="submit" class="btn btn-primary" onclick="search()">검색</button>
                </div>
            </div>
        </div>
        <div class="container jm_container" style="width: 65%">
            <div class="mb-2 d-flex flex-row-reverse">
                <button type="button" id="saveForm" onclick="location.href = '/recruitment/saveForm'">채용공고쓰기</button>
            </div>
            <div class="row" id="emptyBox">
                <c:forEach items="${Posts}" var="post">
                    <div class="col-sm-3 mb-3">
                        <a href="/recruitment/detail/${post.id}" style="color: inherit; text-decoration: none;">
                            <div class="card jm_card">
                                <img src="${post.enterpriseLogo}" class="card-img-top jm_card_img_top">
                        </a>
                    </div>
                    <div class="card-body jm_card_body">
                        <div class="jm_company_name">
                            <c:choose>
                                <c:when test="${post.diffDays < 0}">
                                    <dt class="text-danger" style="font-size: smaller;">기간이 지났습니다</dt>
                                </c:when>
                                <c:otherwise>
                                    <dt style="font-size: smaller;">D-${post.diffDays}</dt>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="jm_company_name">${post.title}</div>
                        <div class="jm_company_title">${post.enterpriseName}</div>
                        <div class="jm_company_title">
                            <h6>서울, 부산</h6>
                        </div>
                        <div class="jm_company_title">
                            <h6>채용보상금 1,000,000원</h6>
                        </div>
                    </div>
            </div>
            </c:forEach>
        </div>

        <script>
            function search() {
                let data = {
                    searchString: $("#search").val()
                };
                $.ajax({
                    type: "post",
                    url: "/recruitment/search",
                    contentType: "application/json;charset=UTF-8",
                    data: JSON.stringify(data),
                    dataType: "json"
                })
                    .done((res) => {
                        console.log(res.data);
                        $("#emptyBox").empty();
                        for (let i = 0; i < res.data.length; i++) {
                            let el =
                                `<div class="col-sm-3 mb-3">
                                       <a href="/recruitment/detail/`+res.data[i].id+`" style="color: inherit; text-decoration: none;">
                                             <div class="card jm_card h-100">
                                                 <img src=`+ res.data[i].enterpriseLogo + ` class="card-img-top jm_card_img_top">
                                                 <div class="card-body jm_card_body">
                                                     <div class="jm_company_name">`+ res.data[i].title + `</div>
                                                     <div class="jm_company_title">`+ res.data[i].enterpriseName + `</div>
                                                 </div>
                                             </div>
                                         </a>
                                     </div>`
                            $("#emptyBox").append(el);
                        }

                        alert(res.msg);
                    })
                    .fail((err) => {
                        alert(err.responseJSON.msg);
                    })
            }
        </script>
        </div>
        <%@ include file="../layout/footer.jsp" %>