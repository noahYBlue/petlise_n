function edit() {
    let comment_contents = document.getElementsByName('comment_contents')[0].value;
    let board_id = document.getElementsByName('board_id')[0].value;
    let user_id = document.getElementsByName('user_id')[0].value;

    if (comment_contents === '') {
        alert('댓글을 입력해주세요.');
        return false;
    }

    let formData = new FormData();
    formData.append("comment_contents", comment_contents);
    formData.append("user_id", user_id);
    formData.append("board_id", board_id);

    $.ajax({
        url: "boardCommentform",
        type: "post",
        data: formData,
        contentType: false,
        processData: false,
        success: function (data) {
        
        alert('등록이 완료되었습니다.');
        // Refresh the page
       location.reload();
    
    
},
        error: function (xhr, status, error) {
           if (user_id == 'null') {
						alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.');
						window.location.href = '/signin'; // 로그인 페이지로 이동/ Redirect to the login page
            } else {
                alert('등록이 실패했습니다.');
            }
        }
    });
}
