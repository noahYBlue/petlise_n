const table = document.getElementsByClassName('table');

table[0].innerHTML += `
  <thead>
    <tr>
      <th>구분</th>
      <th>제목</th>
      <th>작성자</th>
      <th>날짜</th>
      <th>조회수</th>
      <th>수정</th>
      <th>삭제</th>
    </tr>
  </thead>
  <tbody id="tbody"></tbody>
  `;

table[1].innerHTML += `
  <thead>
    <tr>
      <th>구분</th>
      <th>제목</th>
      <th>작성자</th>
      <th>날짜</th>
      <th>조회수</th>
      <th>수정</th>
      <th>삭제</th>
    </tr>
  </thead>
  <tbody id="eventTbody"></tbody>
 `;

table[2].innerHTML += `
  <thead>
    <tr>
      <th>구분</th>
      <th>제목</th>
      <th>작성자</th>
      <th>날짜</th>
      <th>조회수</th>
      <th>좋아요</th>
      <th>삭제</th>
    </tr>
  </thead>
  <tbody id="qnaTbody"></tbody>
 `;

table[3].innerHTML += `
  <thead class="family">
    <tr>
      <th>구분</th>
      <th>아이사진</th>
      <th>품종</th>
      <th>성별</th>
      <th>나이</th>
      <th>색상</th>
      <th>몸무게</th>
      <th>상태</th>
    </tr>
  </thead>
  <tbody id="familyTbody"></tbody>
 `;
