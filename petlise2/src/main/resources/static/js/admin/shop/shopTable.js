const table = document.getElementsByClassName('table');

for (let i = 0; i < table.length; i++) {
  table[i].innerHTML += `
  <thead>
    <tr>
      <th>카테고리</th>
      <th>상품코드</th>
      <th>상품명</th>
      <th>상품재고</th>
      <th>금액</th>
      <th>등록일</th>
      <th>수정</th>
      <th>삭제여부</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>사료</td>
      <td>D01_001</td>
      <td>레시피 제목인듯 아닌듯 맞는듯 함 레시피 제목인듯 아닌듯 맞는듯 함 레시피 제목인듯 아닌듯 맞는듯 함</td>
      <td>100</td>
      <td>10,000p</td>
      <td>2022.02.22</td>
      <td>수정</td>
      <td>삭제</td>
    </tr>
  </tbody>
  `;
}
