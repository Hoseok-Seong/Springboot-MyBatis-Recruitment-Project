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

        <div class="container-fluid pt-3" style="width: 65%">
            <div class="d-flex justify-content-between align-items-center">
                <h1 class="mt-4 ms-5">채용정보</h1>
                <div class="input-group" style="width: 50%;">
                    <input type="text" class="form-control" id="search" placeholder="검색어를 입력하세요">
                    <div class="input-group-append me-5">
                        <button type="button" id="searchButton" onclick="search()">검색</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container jm_container mt-5" style="width: 65%">
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
                    <div class="card-body jm_card_body"><br>
                        <div class="jm_company_name my-text-ellipsis">${post.title}</div>
                        <div class="jm_company_title my-text-ellipsis">${post.enterpriseName}</div>
                        <div class="jm_company_title my-text-ellipsis">
                            <i class="bi-geo-alt"></i>서울, 부산
                        </div>
                        <div class="jm_company_title my-text-ellipsis">
                            <i class="bi-currency-dollar"></i> 채용보상금 1,000,000원</p>
                        </div>
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
        </div><br><br><br>
        <%@ include file="../layout/footer.jsp" %>