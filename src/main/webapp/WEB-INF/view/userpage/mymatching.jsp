<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <div class="container-fluid" style="width: 65%">
            <br>
            <div class="row pt-3">
                <div class="col-3">
                    <nav class="navbar navbar-expand-lg bg-white">
                        <div class="container-fluid">
                            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                                <div class="navbar-nav">
                                    <h3>
                                        <strong>
                                            <a class="nav-link active" aria-current="page">프로필</a>
                                        </strong>
                                    </h3>
                                </div>
                            </div>
                        </div>
                    </nav>
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="/images/user.png" class="card-img-top" alt="..."
                                style="width: 100px; height: 100px;">
                            <h5 class="card-title pt-2">${principal.name}</h5>
                            <h5 class="card-title pt-2">${principal.email}</h5>
                            <h5 class="card-title pt-2">${principal.contact}</h5>
                            <br>
                            <h3>나의 매칭기업 :
                                <c:out value="${fn:length(userMatching)}" />
                            </h3>
                            <br>
                            <button class="btn btn-outline-info btn-lg" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                나의 기술스택
                            </button>
                            <br>
                            <c:forEach items="${userSkillDtos}" var="userSkillDto">
                                <div class="collapse" id="collapseExample">
                                    <ul class="list-group">
                                        <li class="list-group-item">${skillMap[userSkillDto.skill]}</li>
                                    </ul>
                                </div>
                            </c:forEach>
                            <br>
                            <button type="button" class="btn btn-outline-info btn-lg"
                                onclick="window.location.href = '/recruitment/list';">채용공고 보러가기
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-9 mb-2">
                    <nav class="navbar navbar-expand-lg bg-light">
                        <div class="container-fluid">
                            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                                <div class="navbar-nav">
                                    <h3>
                                        <a class="nav-link" href="/myapply">지원현황</a>
                                    </h3>
                                    <h3>
                                        <a class="nav-link active" aria-current="page" href="/mymatching">추천서비스</a>
                                    </h3>
                                    <h3>
                                        <a class="nav-link" href="/mybookmark">북마크</a>
                                    </h3>
                                </div>
                            </div>
                        </div>
                    </nav>
                    <div class="card">
                        <div class="card-body">
                            <table class="table table-hover">
                                <br>
                                <h3><img src="images/company.png" alt="">회원님의 기술스택과 일치하는 기업입니다</h3>
                                <br>
                                <thead class="table-light">
                                    <tr>
                                        <th scope="col">기업명</th>
                                        <th scope="col">공고</th>
                                        <th scope="col">분야</th>
                                        <th scope="col">마감</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${userMatching}" var="user">
                                        <tr>
                                            <td scope="col">${user.enterpriseName}
                                            </td>
                                            <td scope="col"><a href="/recruitment/detail/${user.recruitmentId}"
                                                    style="color: inherit; text-decoration: none;">${user.title}</a>
                                            </td>
                                            <td scope="col">${user.sector}
                                            </td>
                                            <c:choose>
                                                <c:when test="${Posts[user.recruitmentId-1].diffDays < 0}">
                                                    <td scope="col">
                                                        기간 만료
                                                    </td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td scope="col">D-${Posts[user.recruitmentId-1].diffDays}
                                                    </td>
                                                </c:otherwise>
                                            </c:choose>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <%@ include file="../layout/footer.jsp" %>