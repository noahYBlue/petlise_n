var page = 1;

$(document).ready(function () {
  const searchInput = document.getElementById('searchInput');

  let keyword = searchInput.value;

  ajaxData(keyword, page);
});

function ajaxData(keyword, page) {
  let formData = new FormData();
  formData.set('keyword', keyword);
  formData.set('page', page);

  $.ajax({
    url: `/admin/usermanagement`,
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
          <tr>
            <td>${el.name}</td>
            <td>${el.email}</td>
            <td>${el.address.split(",").join(" ")}</td>
            <td><span id="${el?.user_id}" onclick="clickModal('${el?.user_id}','${el?.point}')">${el.point ? el.point.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") : 0}</span></td>
            <td>${getDate(el.created_at)}</td>
            <td>${el.deleted_at ? getDate(el.deleted_at) : '0000. 00. 00'}</td>
          </tr>`
        ).join('');
    },
    error: function (error) {
      console.log(error);
    }
  });
}
