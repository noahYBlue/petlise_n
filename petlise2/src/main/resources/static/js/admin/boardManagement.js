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
  let category = $('.isOn').children('a').text();

  if (category == '게시글 전체') {
    $.ajax({
      url: `/admin/${title == "자유게시판" ? "boardmanagement" : "petplacemanagement"}`,
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
          .map(
            el => `
          	<tr ${title == "펫플레이스" ? 'class="petplace"':""}>
              ${title == "펫플레이스" ? `<td>${el?.category}</td>` : ""}
              <td id="${el?.board_id}">${el?.title}</td>
              <td>${el?.name}</td>
              <td>${el?.comment_count}</td>
              <td>${el?.like_count}</td>
              <td>${el?.report_count}</td>
              <td>${getDate(el?.created_at)}</td>
              <td><span id="${el?.board_id}" onclick="clickModal(this)">삭제</span></td>
            </tr>`
          )
          .join('');
      },
      error: function (error) {
        console.log(error);
      }
    });
  } else if (category == '게시글 신고') {
    $.ajax({
      url: `/admin/${title == "자유게시판" ? "boardreport" : "petplacereport"}`,
      type: 'post',
      data: {
        keyword: keyword,
        page: page
      },
      dataType: 'json',
      async: false,
      success: function (data) {
        let dataTable = data;
        let tbody = document.getElementById('reportBoardTbody');
        let totalCount = dataTable.length != 0 ? dataTable[0].count : 0;
        pagination(page, totalCount);
        tbody.innerHTML = dataTable
          .map(
            el => `
          	<tr>
              <td>${el?.report_type}</td>
              <td id="${el?.board_id}">${el?.title}</td>
              <td>${el?.writer}</td>
              <td>${el?.reporter}</td>
              <td>${getDate(el?.report_date)}</td>
              <td>${getDate(el?.created_at)}</td>
              <td><span id="${el?.board_id}" onclick="clickModal(this)">삭제</span></td>
            </tr>`
          )
          .join('');
      },
      error: function (error) {
        console.log(error);
      }
    });
  } else if (category == '댓글 신고') {
    $.ajax({
      url: `/admin/${title == "자유게시판" ? "commentreport" : "petplacecommentreport"}`,
      type: 'post',
      data: {
        keyword: keyword,
        page: page
      },
      dataType: 'json',
      async: false,
      success: function (data) {
        let dataTable = data;
        let tbody = document.getElementById('reportCommentTbody');
        let totalCount = dataTable.length != 0 ? dataTable[0].count : 0;
        pagination(page, totalCount);
        tbody.innerHTML = dataTable?.map(
            el => `
          	<tr>
              <td>${el?.report_type}</td>
              <td id="${el?.board_id}">${el?.comment_contents}</td>
              <td>${el?.comment_writer}</td>
              <td>${el?.comment_reporter}</td>
              <td>${getDate(el?.report_date)}</td>
              <td>${getDate(el?.comment_created_at)}</td>
              <td><span id="${el?.comment_id}" onclick="clickCommentModal(this)">삭제</span></td>
            </tr>`
          )
          .join('');
      },
      error: function (error) {
        console.log(error);
      }
    });
  }
}
