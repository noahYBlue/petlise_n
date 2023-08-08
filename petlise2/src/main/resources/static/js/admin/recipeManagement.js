let page = 1;

$(document).ready(function () {
  const searchInput = document.getElementById('searchInput');

  let keyword = searchInput.value;

  ajaxData(keyword, page);

  $('.btn').click(function () {
    keyword = searchInput.value;
    page = 1;

    ajaxData(keyword, page);
  });
});

function ajaxData(keyword, page) {
  let select_category = $('.isOn').children('a').text();
  let main_category = `${select_category == '전체' || select_category == '이달의 레시피' ? '' : select_category}`;
  let recipe_of_the_month = `${select_category == '이달의 레시피' ? true : false}`;

  let formData = new FormData();
  formData.set('recipe_category', recipe_category);
  formData.set('pet_category', pet_category);
  formData.set('main_category', main_category);
  formData.set('keyword', keyword);
  formData.set('recipe_of_the_month', recipe_of_the_month);
  formData.set('page', page);

  $.ajax({
    url: `/admin/${recipe_category == '전문가레시피'
        ? 'expertrecipemanagement'
        : 'myrecipemanagement'}`,
    type: 'post',
    data: formData,
    contentType: false,
    processData: false,
    dataType: 'json',
    async: false,
    success: function (data) {
      let dataTable = data;
      let tbody = document.querySelector('tbody');
      let totalCount = dataTable.length != 0 ? dataTable[0].count : 0;
      pagination(page, totalCount);
      tbody.innerHTML = dataTable
        .map(el => `
          	<tr ${recipe_category == '전문가레시피'? `class="expert"` : ``}>
              <td><input type="checkbox" id="${el?.recipe_id}" onclick="addCheck(this)" ${el?.recipe_of_the_month == true ? 'checked' : ''} ></td>
              <td>${el?.main_category}${el?.main_category == '기타' ? '' : ` [${el?.sub_category}]`}</td>
              <td><a href="/recipedetail?recipe_id=${el?.recipe_id}">${el?.recipe_title}</a></td>
              <td>${el?.name}</td>
              <td>${getDate(el?.recipe_created_at)}</td>
              ${recipe_category == '전문가레시피'
              ? `<td><a href="/admin/${pet_category == '강아지' 
              	? 'getexpertrecipe' 
              	: 'getexpertrecipe-cat'}?id=${el?.recipe_id}">수정</a></td>` 
              : ""}
              <td><span id="${el?.recipe_id}" onclick="clickModal(this)">삭제</span></td>
            </tr>`
        ).join('');
    },
    error: function (error) {
      console.log(error);
    }
  });
}
