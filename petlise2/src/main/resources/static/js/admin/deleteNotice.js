const modal = document.getElementById('modal');
let select_category = $('.isOn').children('a').text();
  
function clickModal(event) {
  modal.classList.add('active');
  let id = event.id;
  modal.innerHTML = `
	<label class="modalBackdrop" onclick="cancel()"></label>
	<div class="modalContent" style="padding-top: 50px;">
		<h3>정말로 ${select_category}을(를) 삭제 하시겠습니까?</h3>
		<p>삭제한 게시글은 되돌릴 수 없습니다.</p>
		<div class="buttonWrap" style="margin-top: 27px;">
		  <button class="btn delete" id="${id}" onclick="deleteNotice(this)">삭제</button>
		  <button class="btn cancel" onclick="cancel()">취소</button>
		</div>
	</div>
	`;
}

function deleteNotice(event) {
	$.ajax({
		url: `/admin/${select_category == '문의사항' ? 'deleteqna' : 'deletenotice'}`,
		type: 'post',
		data: {
			notice_id: event.id
		},
		success: function() {
			alert("삭제되었습니다.")
			location.reload();
		},
		error: function(error) {
			console.log(error);
		}
	})
}


function cancel() {
  modal.classList.remove('active');
}
