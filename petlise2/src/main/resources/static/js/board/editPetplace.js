

function edit() {
    let title = document.getElementsByName('title')[0].value;
    let category = document.getElementsByName('category')[0].value;
    let petplace_address0 = document.getElementsByName('petplace_address0')[0].value;
    let petplace_address1 = document.getElementsByName('petplace_address1')[0].value;
    let petplace_address2 = document.getElementsByName('petplace_address2')[0].value;
   
    let full_address = petplace_address0 +"," + petplace_address1 + "," + petplace_address2;
   
    let petplace_contents = quill.root.innerHTML;

    
    if (title === '') {
        alert('제목을 입력해주세요.');
        return false;
    }

    if (category.length === 0) {
        alert('카테고리를 선택해주세요.');
        return false;
    }

    if (petplace_address0.length === 0) {
        alert('우편번호를 입력해주세요.');
        return false;
    }
if (petplace_address1.length === 0) {
        alert('주소를 입력해주세요.');
        return false;
    }
if (petplace_address2.length === 0) {
        alert('상세주소를 입력해주세요.');
        return false;
    }

  

    if (petplace_contents === '<p><br></p>') {
        alert('내용을 입력해주세요.');
        return false;
    }

    let formData = new FormData();
    formData.append("title", title);
    formData.append("category", category);
    formData.append("petplace_address", full_address);
    formData.append("petplace_contents", petplace_contents);
  
    

     $.ajax({
        url: "petplaceWriteform",
        type: "post",
        data: formData,
        contentType: false,
        processData: false,
        success: function (data) {
          var seq = data;

            if (seq) {
                // 서버 응답으로부터 받은 seq를 이용하여 리다이렉션합니다.
                 alert('등록이 완료되었습니다.');
                window.location.href = "/getpetplace?seq=" + seq;
            } else {
                alert('죄송합니다. 잠시후 다시 시도 해 주세요.');
                // 만약 서버 응답에서 seq가 없다면 경고 메시지만 표시할 수 있습니다.
            }
        },
        error: function (xhr, status, error) {
            alert('등록이 실패했습니다.');
        }
    });
}




