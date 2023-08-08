let param = document.location.href.split('id=');

function addComment() {
  const content = document.getElementById('content').value;

  $.ajax({
    url: `/createcomment`,
    type: 'post',
    data: {
      id: param[1],
      content: content
    },
    success: function (data) {
      alert('댓글 등록이 완료되었습니다.');
      location.reload();
    },
    error: function (error) {
      console.log(error);
    }
  });
}
function deleteComment(id) {
  const ok = window.confirm('삭제하시겠습니까?');

  if (ok) {
    $.ajax({
      url: `/deletecomment`,
      type: 'post',
      data: {
        id: id
      },
      success: function () {
        alert('삭제되었습니다.');
        location.reload();
      },
      error: function (error) {
        console.log(error);
      }
    });
  }
}

function moveToEditBtn() {
  location.href = `/getqna?id=${param[1]}`;
}

function deleteQnA() {
  const ok = window.confirm('삭제하시겠습니까?');

  if (ok) {
    $.ajax({
      url: `/deleteqna`,
      type: 'post',
      data: {
        id: param[1]
      },
      success: function () {
        alert('삭제되었습니다.');
        location.href = `/qna`;
      },
      error: function (error) {
        console.log(error);
      }
    });
  }
}
