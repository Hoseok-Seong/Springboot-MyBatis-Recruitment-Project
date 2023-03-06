<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="../layout/header.jsp" %>
    <div class="container" style="width: 65%">
      <div class="container-fluid pt-4 ps-0" style="height: 500px;">
        <br>
        <br>
        <h1><input type="text" name="title" id="title" style="border: none;" placeholder="제목"></h1>
        <br>
        <br>
        <br>
        <div>생년월일</div>
        <hr class="md-0">
        <div class="form-floating mb-3">
          <input type="date" name="birthdate" id="birthdate" min="1900-01-01" required />
        </div>
        <br>
        <br>
        <div>주소</div>
        <hr class="md-0">
        <div class="form-floating mb-3">
          <input type="text" name="address" id="address" class="form-control" id="floatingInputValue">
          <label for="floatingInput">주소를 입력해주세요 예시: 부산광역시 부산진구 양정동 상세주소</label>
        </div>
        <br>
        <br>
      </div>
      <br>
      <br>
      <div>간단 소개글</div>
      <hr class="md-0">
      <div style="background-color: aliceblue">
        <p>&nbsp;&nbsp;• 본인의 업무 경험을 기반으로 핵심역량과 업무 스킬을 간단히 작성해주세요. </p>
        <p>&nbsp;&nbsp;• 3~5줄로 요약하여 작성하는 것을 추천합니다! </p>
      </div>
      <div class="form-floating">
        <textarea class="form-control" name="content" id="content" style="height: 100px"></textarea>
      </div>
      <br>
      <div class="mt-5">경력</div>
      <hr class="md-0">
      <div style="background-color: aliceblue">
        <p>&nbsp;&nbsp;• 본인의 업무 경력을 간단히 작성해주세요. </p>
        <p>&nbsp;&nbsp;• 3~5줄로 요약하여 작성하는 것을 추천합니다! </p>
      </div>
      <div class="form-floating">
        <textarea class="form-control" name="career" id="career" style="height: 100px"></textarea>
      </div>
      <br>
      <div class="mt-5">학력</div>
      <hr class="md-0">
      <div style="background-color: aliceblue">
        <p>&nbsp;&nbsp;• 본인의 학력을 최신순으로 간단히 작성해주세요. </p>
        <p>&nbsp;&nbsp;• 3~5줄로 요약하여 작성하는 것을 추천합니다! </p>
      </div>
      <div class="form-floating">
        <textarea class="form-control" name="education" id="education" style="height: 100px"></textarea>
      </div>
      <br>
      <div class="mt-5">스킬</div>
      <hr class="md-0">
      <div style="background-color: aliceblue">
        <p>&nbsp;&nbsp;• 본인의 업무 스킬을 간단히 작성해주세요. </p>
        <p>&nbsp;&nbsp;• 3~5줄로 요약하여 작성하는 것을 추천합니다! </p>
      </div>
      <div class="form-floating">
        <textarea class="form-control" name="skill" id="skill" style="height: 100px"></textarea>
      </div>
      <br>
      <div class="mt-5">수상 및 기타</div>
      <hr class="md-0">
      <div style="background-color: aliceblue">
        <p>&nbsp;&nbsp;• 본인의 수상 경력을 간단히 작성해주세요. </p>
        <p>&nbsp;&nbsp;• 3~5줄로 요약하여 작성하는 것을 추천합니다! </p>
      </div>
      <div class="form-floating">
        <textarea class="form-control" name="award" id="award" style="height: 100px"></textarea>
      </div>
      <br>
      <div class="mt-5">외국어</div>
      <hr class="md-0">
      <div style="background-color: aliceblue">
        <p>&nbsp;&nbsp;• 본인의 외국어 스킬을 간단히 작성해주세요. </p>
        <p>&nbsp;&nbsp;• 3~5줄로 요약하여 작성하는 것을 추천합니다! </p>
      </div>
      <div class="form-floating">
        <textarea class="form-control" name="language" id="language" style="height: 100px"></textarea>
      </div>
      <br>
      <div class="mt-5">링크</div>
      <hr class="md-0">
      <div style="background-color: aliceblue">
        <p>&nbsp;&nbsp;• 깃헙, 노션으로 작성한 포트폴리오, 구글 드라이브 파일 등 업무 성과를 보여줄 수 있는 링크가 있다면 작성해주세요.</p>
      </div>
      <div class="form-floating">
        <textarea class="form-control" name="link" id="link" style="height: 100px"></textarea>
      </div>
      <br>
      <div style="height: 80px;" class="justify-content-center">
        <script>
          function save(result) {
            // 1. 값 받아오기
            let data = {
              title: $("#title").val(),
              content: $("#content").val(),
              career: $("#career").val(),
              education: $("#education").val(),
              skill: $("#skill").val(),
              award: $("#award").val(),
              language: $("#language").val(),
              link: $("#link").val(),
              file: $("#file").val(),
              birthdate: $("#birthdate").val(),
              address: $("#address").val(),
              finish: result
            };

            $.ajax({
              type: "post",
              url: "/resume",
              data: JSON.stringify(data),
              headers: {
                "Content-Type": "application/json; charset=utf-8"
              },
              dataType: "json" // default : 응답의 MIMETYPE으로 유추함.
            }).done((res) => { //20x일 때
              alert(res.msg);
              location.href = "/resumeList";
            }).fail((err) => { // 40x, 50x 일 때
              alert(err.responseJSON.msg);
            });
          };
        </script>
        <br>
        <button onclick="save(false)" name="finish" value="false" type="button" class="btn btn-secondary btn-lg ms-3"
          style="float:right;">임시저장</button>
        <button onclick="save(true)" name="finish" value="true" type="button" class="btn btn-primary btn-lg"
          style="float:right;">작성완료</button>
      </div>
    </div>
    <br>
    </body>

    </html>