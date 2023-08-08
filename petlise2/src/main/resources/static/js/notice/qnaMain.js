let page = 1;

$(document).ready(function () {
  const searchInput = document.getElementById('searchInput');
  let keyword = searchInput.value;

  ajaxData(keyword, page);

});

function ajaxData(keyword, page) {

    $.ajax({
      url: `/qna`,
      type: 'post',
      data: {
		  keyword: keyword,
		  page: page
	  },
      dataType: 'json',
      async: false,
      success: function (data) {
        let dataTable = data;
        let tbody = document.getElementById('tbody');
        let totalCount = dataTable.length != 0 ? dataTable[0].count : 0;
        
        pagination(page, totalCount);

        tbody.innerHTML = dataTable
          .map(el => `
          	<div onclick="location.href='qnadetail?id=${el?.notice_id}'">
              <p>${el?.category}</p>
              <p>${el?.title}</p>
              <p>${el?.name}</p>
              <p>${el?.view_count == undefined ? 0 : el?.view_count}</p>
              <p>${getDate(el?.created_at)}</p>
            </div>`
          ).join('');
      },
      error: function (error) {
        console.log(error);
      }
    });
  
}
