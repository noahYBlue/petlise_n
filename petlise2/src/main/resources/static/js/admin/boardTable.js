const table = document.querySelectorAll('table');

table[0].innerHTML += `
  <thead>
    <tr ${title == '펫플레이스' ? 'class="petplace"' : ''}>
      ${title == '펫플레이스' ? '<th>카테고리</th>' : ''}
      <th>게시글 제목</th>
      <th>작성자</th>
      <th>댓글수</th>
      <th>좋아요수</th>
      <th>신고수</th>
      <th>등록일</th>
      <th>삭제여부</th>
    </tr>
  </thead>
  <tbody id="tbody"></tbody>
`;

table[1].innerHTML += `
  <thead>
    <tr>
      <th>신고구분</th>
      <th>게시글 제목</th>
      <th>작성자</th>
      <th>신고자</th>
      <th>신고일</th>
      <th>등록일</th>
      <th>삭제여부</th>
    </tr>
  </thead>
  <tbody id="reportBoardTbody"></tbody>
  `;

table[2].innerHTML += `
  <thead>
    <tr>
      <th>신고구분</th>
      <th>댓글 내용</th>
      <th>작성자</th>
      <th>신고자</th>
      <th>신고일</th>
      <th>등록일</th>
      <th>삭제여부</th>
    </tr>
  </thead>
  <tbody id="reportCommentTbody"></tbody>
`;
