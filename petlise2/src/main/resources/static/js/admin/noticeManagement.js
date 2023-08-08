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
  let category;

  if (select_category == '공지사항') category = '공지';
  else category = select_category;

  const editBtn = document.getElementById('edit');
  if (category == '공지' || category == '이벤트') {
    editBtn.innerHTML = `<a href="/admin/createnotice" class="editButton">등록</a>`;

    let formData = new FormData();
    formData.set('category', category);
    formData.set('keyword', keyword);
    formData.set('page', page);

    $.ajax({
      url: `/admin/noticemanagement`,
      type: 'post',
      data: formData,
      contentType: false,
      processData: false,
      dataType: 'json',
      async: false,
      success: function (data) {
        let dataTable = data;
        let tbody = document.getElementById(
          category == '공지' ? 'tbody' : 'eventTbody'
        );
        let totalCount = dataTable.length != 0 ? dataTable[0].count : 0;
        pagination(page, totalCount);

        tbody.innerHTML = dataTable
          .map(
            el => `
          	<tr>
              <td>${el?.category}</td>
              <td id="${el?.notice_id}">${el?.title}</td>
              <td>${el?.name}</td>
              <td>${getDate(el?.created_at)}</td>
              <td>${el?.view_count == undefined ? 0 : el?.view_count}</td>
              <td><a href="/admin/getnotice?id=${
                el?.notice_id
              }">수정</span></td>
              <td><span id="${
                el?.notice_id
              }" onclick="clickModal(this)">삭제</span></td>
            </tr>`
          )
          .join('');
      },
      error: function (error) {
        console.log(error);
      }
    });
  } else if (category == '문의사항') {
    editBtn.style.display = 'none';

    $.ajax({
      url: `/admin/qnamanagement`,
      type: 'post',
      data: {
        keyword: keyword,
        page: page
      },
      dataType: 'json',
      async: false,
      success: function (data) {
        let dataTable = data;
        let tbody = document.getElementById('qnaTbody');
        let totalCount = dataTable.length != 0 ? dataTable[0].count : 0;
        pagination(page, totalCount);

        tbody.innerHTML = dataTable
          .map(
            el => `
          	<tr>
              <td>${el?.category}</td>
              <td><span onclick="location.href='/qnadetail?id=${
                el?.notice_id
              }'">${el?.title}</span></td>
              <td>${el?.name}</td>
              <td>${getDate(el?.created_at)}</td>
              <td>${el?.view_count == undefined ? 0 : el?.view_count}</td>
              <td>${el?.like == undefined ? 0 : el?.like}</td>
              <td><span id="${
                el?.notice_id
              }" onclick="clickModal(this)">삭제</span></td>
            </tr>`
          )
          .join('');
      },
      error: function (error) {
        console.log(error);
      }
    });
  } else {
    const inputWrap = document.getElementsByClassName('inputWrap');
    inputWrap[0].style.display = 'none';
    editBtn.style.display = 'none';

    var xhr = new XMLHttpRequest();
    var url =
      'http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic';
    var queryParams =
      '?' +
      encodeURIComponent('serviceKey') +
      '=' +
      '5kTczAnUCFz4l%2BW%2BMvfc2YntVC36c4UOTxbpLzEPG1N1DQ5qStpMlahJjdq71by6HZo3ez8kwe1kFCs3TBlNWw%3D%3D';
    queryParams +=
      '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10');
    queryParams +=
      '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent(page);
    queryParams +=
      '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('json');
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
      if (this.readyState == 4) {
        let response = JSON.parse(this.responseText).response.body;
        let item = response.items.item;
        let totalCount = response.totalCount / 1.5;

        pagination(page, totalCount);

        let tbody = document.getElementById('familyTbody');
        tbody.innerHTML = item
          .map(
            el => `
          	<tr>
              <td>${el?.kindCd.split('] ')[0]}]</td>
              <td><img src="${el?.popfile}" /></td>
              <td>${el?.kindCd.split('] ')[1]}</td>
              <td>${el?.sexCd == 'M' ? '수컷' : '암컷'}</td>
              <td>${el?.age}</td>
              <td>${el?.colorCd}</td>
              <td>${el?.weight}</td>
              <td>${el?.processState}</td>
            </tr>`
          )
          .join('');
      }
    };

    xhr.send('');
  }
}
