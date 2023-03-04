<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
    <style>

/* 제목 스타일링 */
h1 {
  font-size: 2.5rem;
  font-weight: bold;
  color: #343a40;
}

/* 카드 스타일링 */
.jm_container {
  background-color: white;
  border-radius: 0.5rem;
  padding: 2rem;
  box-shadow: 0px 5px 10px #ced4da;
}

.jm_card {
  height: 430px;
  border-radius: 0.5rem;
  box-shadow: 0px 5px 10px #ced4da;
  overflow: hidden;
  transition: transform 0.3s ease;
}

/* 카드 움직이는 친구 */
.jm_card:hover {
  transform: translateY(-10px);
}

/* 크기가 다 같다면 진짜 이쁘게 만들어 주는 친구 */
/* .jm_card_img_top {
  height: 10rem;
  object-fit: cover;
} */


.jm_company_name {
  font-size: 1.2rem;
  font-weight: bold;
  margin-bottom: 0.5rem;
}

.jm_company_title {
  font-size: 1rem;
  margin-bottom: 0.2rem;
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
                <option value="Java">Java</option>
                <option value="Html">Html</option>
                <option value="JavaScript">JavaScript</option>
                <option value="VueJS">VueJS</option>
                <option value="CSS">CSS</option>
                <option value="Node.Js">Node.Js</option>
                <option value="React">React</option>
                <option value="ReactJS">ReactJS</option>
                <option value="Typescript">Typescript</option>
                <option value="Zustand">Zustand</option>
                <option value="AWS">AWS</option>
                </select>
                </div>
            </div>
            <div class="row justify-content-center align-items-center py-3" style="background-color: whitesmoke;">
                <div class="col-6 text-center">
                    <button type="submit" class="btn btn-primary" onclick="category()">선택한 조건으로 검색</button>
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
                    <div class="card-body jm_card_body"><br>
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
                        <div class="jm_company_name my-text-ellipsis">${post.title}</div>
                        <div class="jm_company_title my-text-ellipsis">${post.enterpriseName}</div>
                        <div class="jm_company_title my-text-ellipsis">
                            <i class="bi-geo-alt"></i>서울, 부산

                        </div>
                        <div class="jm_company_title my-text-ellipsis">
                            <i class="bi-currency-dollar"></i> 채용보상금 1,000,000원</p>
                        </div>
                    </div>
                        <%-- <c:choose>
                        <c:when test="${bookmarks != null}">
                        <img id="image1" src="/images/북마크블랙.png" onclick="deleteBookmark('${post.enterpriseId}',this)">
                        </c:when>
                        
                        <c:otherwise>
                        <img id="image1" src="/images/북마크화이트.png" onclick="bookmark('${post.enterpriseId}',this)">
                        </c:otherwise>
                        </c:choose> --%>
                        <c:choose>
                        <c:when test="${bookmarks == null}">
                        <i id="bookmark" class="fa-regular fa-bookmark my-xl my-cursor" value="" onclick="bookmarkOrCancle()"></i>
                        </c:when>
                        
                        <c:otherwise>
                       <i id="bookmark" class="fa-solid fa-bookmark my-xl my-cursor" value="${bookmarks.id}" onclick="bookmarkOrCancle()"> </i> 
                        </c:otherwise>
                        </c:choose>
                 </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

      <script>
    // location reload 사용하면 간단하게 해결이 가능하다.
        function bookmarkOrCancle() {
            let id = $("#bookmark").attr("value");
            let enterpriseId = $("#staticBackdrop${post.id}");
            console.log(id);
            console.log(enterpriseId);
            if (id == "") {
               
                // 좋아요로 통신 요청 (POST)
                let data = {
                    enterpriseId : enterpriseId
                }
                $.ajax({
                    type: "post",
                    url: "/bookmark",
                    data: JSON.stringify(data),
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json"
                }).done((res) => {
                    $("#bookmark").attr("value",res.data);
                    $("#bookmark").addClass("fa-solid");
                    $("#bookmark").removeClass("fa-regular");
                }).fail((err) => {
                    
                });
                } else {
                
                // 좋아요 취소로 통신 요청 (DELETE)
                
                $.ajax({
                    type: "delete",
                    url: "/bookmark/"+id,
                    dataType: "json"
                }).done((res) => {
                    $("#bookmark").attr("value","");
                    $("#bookmark").removeClass("fa-solid");
                    $("#bookmark").addClass("fa-regular");
                }).fail((err) => {
                    alert(err.msg);
                    console.log(err);
                });
            }
        }
   
                    
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

            function category() {
                console.log($("#career").val())
                console.log($("#education").val())
                console.log($("#sector").val())
                console.log($("#position").val())
                console.log($("#skill").val())
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
        </div><br><br><br>
        <%@ include file="../layout/footer.jsp" %>