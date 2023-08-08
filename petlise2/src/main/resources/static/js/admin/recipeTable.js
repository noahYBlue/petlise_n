const table = document.getElementsByClassName('table');

for (let i = 0; i < table.length; i++) {
  table[i].innerHTML += `
  <thead>
    <tr ${recipe_category == '전문가레시피' ? `class="expert"` : ``}>
      <th>이달 여부</th>
      <th>카테고리</th>
      <th>제목</th>
      <th>작성자</th>
      <th>등록일</th>
      ${recipe_category == '전문가레시피' ? `<th>수정</th>` : ""}
      <th>삭제</th>
    </tr>
  </thead>
  <tbody></tbody>
  `;
}
