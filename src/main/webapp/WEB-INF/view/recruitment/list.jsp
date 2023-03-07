<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <style>
            /* 제목 스타일링 */
            h1 {
                font-size: 2.5rem;
                font-weight: bold;
                color: #343a40;
            }

            .my-text-ellipsis {
                text-overflow: ellipsis;
                white-space: nowrap;
                overflow: hidden;
                max-width: 100%;
            }
        </style>
        <!-- 게시판부분 -->
        <div class="container-fluid" style="width: 65%">
            <div class="row py-1">
                <div class="col">
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="/images/career.png" class="card-img-top" alt="..."
                                style="width: 50px; height: 50px;">
                            <h5 class="card-title pt-2">경력</h5>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="/images/education.png" class="card-img-top" alt="..."
                                style="width: 50px; height: 50px;">
                            <h5 class="card-title pt-2">교육</h5>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="/images/sector.png" class="card-img-top" alt="..."
                                style="width: 50px; height: 50px;">
                            <h5 class="card-title pt-2">분야</h5>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="/images/position.png" class="card-img-top" alt="..."
                                style="width: 50px; height: 50px;">
                            <h5 class="card-title pt-2">직무</h5>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="/images/tech.png" class="card-img-top" alt="..."
                                style="width: 50px; height: 50px;">
                            <h5 class="card-title pt-2">기술스택</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid" style="width: 65%">
            <div class="row py-3">
                <div class="col">
                    <select id="career" class="form-select" aria-label="Default select example">
                        <option selected disabled>신입/경력</option>
                        <option value="신입">신입</option>
                        <option value="경력">경력</option>
                        <option value="무관">무관</option>
                    </select>
                </div>
                <div class="col">
                    <select id="education" class="form-select" aria-label="Default select example">
                        <option selected disabled>학력사항</option>
                        <option value="대졸이상">대졸이상</option>
                        <option value="고졸이상">고졸이상</option>
                        <option value="학력무관">학력무관</option>
                    </select>
                </div>
                <div class="col">
                    <select id="sector" class="form-select" aria-label="Default select example">
                        <option selected disabled>분야</option>
                        <option value="si">si</option>
                        <option value="웹에이전시">웹에이전시</option>
                        <option value="인력소싱">인력소싱</option>
                        <option value="대기업">대기업</option>
                        <option value="스타트업">스타트업</option>
                        <option value="서비스">서비스</option>
                        <option value="컨설팅">컨설팅</option>
                    </select>
                </div>
                <div class="col">
                    <select id="position" class="form-select" aria-label="Default select example">
                        <option selected disabled>직무</option>
                        <option value="프론트엔드">프론트엔드</option>
                        <option value="백엔드">백엔드</option>
                        <option value="소프트웨어">소프트웨어</option>
                        <option value="안드로이드">안드로이드</option>
                        <option value="IOS">IOS</option>
                        <option value="네트워크관리자">네트워크관리자</option>
                        <option value="머신러닝엔지니어">머신러닝엔지니어</option>
                        <option value="데이터엔지니어">데이터엔지니어</option>
                        <option value="빅데이터엔지니어">빅데이터엔지니어</option>
                        <option value="보안엔지니어">보안엔지니어</option>
                        <option value="임베디드개발자">임베디드개발자</option>
                    </select>
                </div>
                <div class="col">
                    <select id="skill" class="form-select" aria-label="Default select example">
                        <option selected disabled>기술스택</option>
                        <option value="1">Java</option>
                        <option value="2">Html</option>
                        <option value="3">JavaScript</option>
                        <option value="4">VueJS</option>
                        <option value="5">CSS</option>
                        <option value="6">Node.Js</option>
                        <option value="7">React</option>
                        <option value="8">ReactJS</option>
                        <option value="9">Typescript</option>
                        <option value="10">Zustand</option>
                        <option value="11">AWS</option>
                    </select>
                </div>
            </div>
            <div class="row justify-content-center align-items-center py-3" style="background-color: whitesmoke;">
                <div class="col-6 text-center">
                    <button type="submit" class="btn btn-secondary" onclick="reloadPage()">초기화</button>
                    <button type="submit" class="btn btn-primary" onclick="category()">선택한 조건으로 검색</button>
                </div>
            </div>
            <div class="row justify-content-end align-items-center py-3">
                <div class="col-4 text-center">
                    <input type="text" class="form-control" id="search" placeholder="제목이나 내용으로 검색이 가능합니다">
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
                        <div class="card-body jm_card_body "><br>
                            <div class="jm_company_name">
                                <div class="card-body">
                                    <c:choose>
                                        <c:when test="${post.diffDays < 0}">
                                            <dt class="badge rounded-pill text-bg-danger" style="font-size: 12px;">
                                                <b>기간이 지났습니다</b></dt>
                                        </c:when>
                                        <c:when test="${post.diffDays == 0}">
                                            <dt class="badge rounded-pill text-bg-warning" style="font-size: 12px;">
                                                <b>D-DAY</b></dt>
                                        </c:when>
                                        <c:when test="${post.diffDays > 0 && post.diffDays <= 7}">
                                            <dt class="badge rounded-pill text-bg-warning" style="font-size: 12px;">
                                                ${post.diffDays}일 남았습니다</dt>
                                        </c:when>
                                        <c:otherwise>
                                            <dt class="badge rounded-pill text-bg-success" style="font-size: 12px;">
                                                ${post.diffDays}일 남았습니다</dt>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="jm_company_name my-text-ellipsis">${post.title}</div>
                                    <div class="jm_company_title my-text-ellipsis">${post.enterpriseName}</div>
                                    <div class="jm_company_title my-text-ellipsis">
                                        <i class="bi-geo-alt"></i>${post.address}
                                    </div>
                                    <div class="jm_company_title my-text-ellipsis">
                                        <i class="bi bi-person-workspace"></i>${post.position}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
            </c:forEach>
        </div>

        <script>
            function reloadPage() {
                location.reload();
            }
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
                        $("#emptyBox").empty();
                        for (let i = 0; i < res.data.length; i++) {
                            if (res.data[i].diffDays < 0) {
                                let el =
                                    `<div class="col-sm-3 mb-3">
                                       <a href="/recruitment/detail/`+ res.data[i].id + `" style="color: inherit; text-decoration: none;">
                                             <div class="card jm_card">
                                                 <img src=`+ res.data[i].enterpriseLogo + ` class="card-img-top jm_card_img_top">
                                                </a>
                                                 <div class="card-body jm_card_body"><br>
                                                     <div class="jm_company_name">
                                                        <div class="card-body">
                                            <dt class="badge rounded-pill text-bg-danger" style="font-size: 12px;"><b>기간이 지났습니다</b></dt>
                                                            <div class="jm_company_name my-text-ellipsis">`
                                    + res.data[i].title +
                                    `</div >
                                                            <div class="jm_company_title my-text-ellipsis">`
                                    + res.data[i].enterpriseName +
                                    `</div >
                                                            <div class="jm_company_title my-text-ellipsis">
                                                                    <i class="bi-geo-alt"></i>`
                                    + res.data[i].address +
                                    `</div>
                                                            <div class="jm_company_title my-text-ellipsis">
                                                                    <i class="bi bi-person-workspace"></i>`
                                    + res.data[i].position +
                                    `</div>
                                                        </div>
                                                 </div >
                                             </div >
                                     </div > `
                                $("#emptyBox").append(el);
                            }
                            else if (res.data[i].diffDays == 0) {
                                let el =
                                    `<div class="col-sm-3 mb-3">
                                       <a href="/recruitment/detail/`+ res.data[i].id + `" style="color: inherit; text-decoration: none;">
                                             <div class="card jm_card">
                                                 <img src=`+ res.data[i].enterpriseLogo + ` class="card-img-top jm_card_img_top">
                                                </a>
                                                 <div class="card-body jm_card_body"><br>
                                                     <div class="jm_company_name">
                                                        <div class="card-body">
                                            <dt class="badge rounded-pill text-bg-warning" style="font-size: 12px;"><b>D-DAY</b></dt>
                                                            <div class="jm_company_name my-text-ellipsis">`
                                    + res.data[i].title +
                                    `</div >
                                                            <div class="jm_company_title my-text-ellipsis">`
                                    + res.data[i].enterpriseName +
                                    `</div >
                                                            <div class="jm_company_title my-text-ellipsis">
                                                                    <i class="bi-geo-alt"></i>`
                                    + res.data[i].address +
                                    `</div>
                                                            <div class="jm_company_title my-text-ellipsis">
                                                                    <i class="bi bi-person-workspace"></i>`
                                    + res.data[i].position +
                                    `</div>
                                                        </div>
                                                 </div >
                                             </div >
                                     </div > `
                                $("#emptyBox").append(el);
                            }
                            else if ((res.data[i].diffDays > 0) && (res.data[i].diffDays <= 7)) {
                                let el =
                                    `<div class="col-sm-3 mb-3">
                                       <a href="/recruitment/detail/`+ res.data[i].id + `" style="color: inherit; text-decoration: none;">
                                             <div class="card jm_card">
                                                 <img src=`+ res.data[i].enterpriseLogo + ` class="card-img-top jm_card_img_top">
                                                </a>
                                                 <div class="card-body jm_card_body"><br>
                                                     <div class="jm_company_name">
                                                        <div class="card-body">
                                            <dt class="badge rounded-pill text-bg-warning" style="font-size: 12px;">`+ res.data[i].diffDays + `일 남았습니다</dt>
                                                            <div class="jm_company_name my-text-ellipsis">`
                                    + res.data[i].title +
                                    `</div >
                                                            <div class="jm_company_title my-text-ellipsis">`
                                    + res.data[i].enterpriseName +
                                    `</div >
                                                            <div class="jm_company_title my-text-ellipsis">
                                                                    <i class="bi-geo-alt"></i>`
                                    + res.data[i].address +
                                    `</div>
                                                            <div class="jm_company_title my-text-ellipsis">
                                                                    <i class="bi bi-person-workspace"></i>`
                                    + res.data[i].position +
                                    `</div>
                                                        </div>
                                                 </div >
                                             </div >
                                     </div > `
                                $("#emptyBox").append(el);
                            } if (res.data[i].diffDays > 7) {
                                let el =
                                    `<div class="col-sm-3 mb-3">
                                       <a href="/recruitment/detail/`+ res.data[i].id + `" style="color: inherit; text-decoration: none;">
                                             <div class="card jm_card">
                                                 <img src=`+ res.data[i].enterpriseLogo + ` class="card-img-top jm_card_img_top">
                                                </a>
                                                 <div class="card-body jm_card_body"><br>
                                                     <div class="jm_company_name">
                                                        <div class="card-body">
                                            <dt class="badge rounded-pill text-bg-success" style="font-size: 12px;">`+ res.data[i].diffDays + `일 남았습니다</dt>
                                                            <div class="jm_company_name my-text-ellipsis">`
                                    + res.data[i].title +
                                    `</div >
                                                            <div class="jm_company_title my-text-ellipsis">`
                                    + res.data[i].enterpriseName +
                                    `</div >
                                                            <div class="jm_company_title my-text-ellipsis">
                                                                    <i class="bi-geo-alt"></i>`
                                    + res.data[i].address +
                                    `</div>
                                                            <div class="jm_company_title my-text-ellipsis">
                                                                    <i class="bi bi-person-workspace"></i>`
                                    + res.data[i].position +
                                    `</div>
                                                        </div>
                                                 </div >
                                             </div >
                                     </div > `
                                $("#emptyBox").append(el);
                            }
                        }
                        alert(res.msg);
                    })
                    .fail((err) => {
                        alert(err.responseJSON.msg);
                    })
            }

            function category() {
                let data = {
                    career: $("#career").val(),
                    education: $("#education").val(),
                    sector: $("#sector").val(),
                    position: $("#position").val(),
                    skill: $("#skill").val()
                };
                $.ajax({
                    type: "post",
                    url: "/recruitment/category",
                    contentType: "application/json;charset=UTF-8",
                    data: JSON.stringify(data),
                    dataType: "json"
                })
                    .done((res) => {
                        $("#emptyBox").empty();
                        for (let i = 0; i < res.data.length; i++) {
                            if (res.data[i].diffDays < 0) {
                                let el =
                                    `<div class="col-sm-3 mb-3">
                                       <a href="/recruitment/detail/`+ res.data[i].id + `" style="color: inherit; text-decoration: none;">
                                             <div class="card jm_card">
                                                 <img src=`+ res.data[i].enterpriseLogo + ` class="card-img-top jm_card_img_top">
                                                </a>
                                                 <div class="card-body jm_card_body"><br>
                                                     <div class="jm_company_name">
                                                        <div class="card-body">
                                            <dt class="badge rounded-pill text-bg-danger" style="font-size: 12px;"><b>기간이 지났습니다</b></dt>
                                                            <div class="jm_company_name my-text-ellipsis">`
                                    + res.data[i].title +
                                    `</div >
                                                            <div class="jm_company_title my-text-ellipsis">`
                                    + res.data[i].enterpriseName +
                                    `</div >
                                                            <div class="jm_company_title my-text-ellipsis">
                                                                    <i class="bi-geo-alt"></i>`
                                    + res.data[i].address +
                                    `</div>
                                                            <div class="jm_company_title my-text-ellipsis">
                                                                    <i class="bi bi-person-workspace"></i>`
                                    + res.data[i].position +
                                    `</div>
                                                        </div>
                                                 </div >
                                             </div >
                                     </div > `
                                $("#emptyBox").append(el);
                            }
                            else if (res.data[i].diffDays == 0) {
                                let el =
                                    `<div class="col-sm-3 mb-3">
                                       <a href="/recruitment/detail/`+ res.data[i].id + `" style="color: inherit; text-decoration: none;">
                                             <div class="card jm_card">
                                                 <img src=`+ res.data[i].enterpriseLogo + ` class="card-img-top jm_card_img_top">
                                                </a>
                                                 <div class="card-body jm_card_body"><br>
                                                     <div class="jm_company_name">
                                                        <div class="card-body">
                                            <dt class="badge rounded-pill text-bg-warning" style="font-size: 12px;"><b>D-DAY</b></dt>
                                                            <div class="jm_company_name my-text-ellipsis">`
                                    + res.data[i].title +
                                    `</div >
                                                            <div class="jm_company_title my-text-ellipsis">`
                                    + res.data[i].enterpriseName +
                                    `</div >
                                                            <div class="jm_company_title my-text-ellipsis">
                                                                    <i class="bi-geo-alt"></i>`
                                    + res.data[i].address +
                                    `</div>
                                                            <div class="jm_company_title my-text-ellipsis">
                                                                    <i class="bi bi-person-workspace"></i>`
                                    + res.data[i].position +
                                    `</div>
                                                        </div>
                                                 </div >
                                             </div >
                                     </div > `
                                $("#emptyBox").append(el);
                            }
                            else if ((res.data[i].diffDays > 0) && (res.data[i].diffDays <= 7)) {
                                let el =
                                    `<div class="col-sm-3 mb-3">
                                       <a href="/recruitment/detail/`+ res.data[i].id + `" style="color: inherit; text-decoration: none;">
                                             <div class="card jm_card">
                                                 <img src=`+ res.data[i].enterpriseLogo + ` class="card-img-top jm_card_img_top">
                                                </a>
                                                 <div class="card-body jm_card_body"><br>
                                                     <div class="jm_company_name">
                                                        <div class="card-body">
                                            <dt class="badge rounded-pill text-bg-warning" style="font-size: 12px;">`+ res.data[i].diffDays + `일 남았습니다</dt>
                                                            <div class="jm_company_name my-text-ellipsis">`
                                    + res.data[i].title +
                                    `</div >
                                                            <div class="jm_company_title my-text-ellipsis">`
                                    + res.data[i].enterpriseName +
                                    `</div >
                                                            <div class="jm_company_title my-text-ellipsis">
                                                                    <i class="bi-geo-alt"></i>`
                                    + res.data[i].address +
                                    `</div>
                                                            <div class="jm_company_title my-text-ellipsis">
                                                                    <i class="bi bi-person-workspace"></i>`
                                    + res.data[i].position +
                                    `</div>
                                                        </div>
                                                 </div >
                                             </div >
                                     </div > `
                                $("#emptyBox").append(el);
                            } if (res.data[i].diffDays > 7) {
                                let el =
                                    `<div class="col-sm-3 mb-3">
                                       <a href="/recruitment/detail/`+ res.data[i].id + `" style="color: inherit; text-decoration: none;">
                                             <div class="card jm_card">
                                                 <img src=`+ res.data[i].enterpriseLogo + ` class="card-img-top jm_card_img_top">
                                                </a>
                                                 <div class="card-body jm_card_body"><br>
                                                     <div class="jm_company_name">
                                                        <div class="card-body">
                                            <dt class="badge rounded-pill text-bg-success" style="font-size: 12px;">`+ res.data[i].diffDays + `일 남았습니다</dt>
                                                            <div class="jm_company_name my-text-ellipsis">`
                                    + res.data[i].title +
                                    `</div >
                                                            <div class="jm_company_title my-text-ellipsis">`
                                    + res.data[i].enterpriseName +
                                    `</div >
                                                            <div class="jm_company_title my-text-ellipsis">
                                                                    <i class="bi-geo-alt"></i>`
                                    + res.data[i].address +
                                    `</div>
                                                            <div class="jm_company_title my-text-ellipsis">
                                                                    <i class="bi bi-person-workspace"></i>`
                                    + res.data[i].position +
                                    `</div>
                                                        </div>
                                                 </div >
                                             </div >
                                     </div > `
                                $("#emptyBox").append(el);
                            }
                        }
                        alert(res.msg);
                    })
                    .fail((err) => {
                        alert(err.responseJSON.msg);
                    })
            }
        </script>
        </div><br><br><br>
        <%@ include file="../layout/footer.jsp" %>