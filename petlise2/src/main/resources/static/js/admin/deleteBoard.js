const modal = document.getElementById('modal');

function clickModal(event) {
  modal.classList.add('active');
  let id = event.id;
  modal.innerHTML = `
	<label class="modalBackdrop" onclick="cancel()"></label>
	<div class="modalContent">
		<h3>정말로 게시물을 삭제 하시겠습니까?</h3>
		<p>삭제한 게시물은 되돌릴 수 없습니다.</p>
		<div class="buttonWrap">
		  <button class="btn delete" id="${id}" onclick="deleteBoard(this)">삭제</button>
		  <button class="btn cancel" onclick="cancel()">취소</button>
		</div>
	</div>
	`;
}

function clickCommentModal(event) {
  modal.classList.add('active');
  let id = event.id;
  modal.innerHTML = `
	<label class="modalBackdrop" onclick="cancel()"></label>
	<div class="modalContent" style="padding-top: 52px;">
		<h3>정말로 댓글을 삭제 하시겠습니까?</h3>
		<p>삭제한 댓글은 되돌릴 수 없으며</p><p>관련된 댓글 신고와 같이 삭제됩니다.</p>
		<div class="buttonWrap" style="margin-top: 30px;">
		  <button class="btn delete" id="${id}" onclick="deleteComment(this)">삭제</button>
		  <button class="btn cancel" onclick="cancel()">취소</button>
		</div>
	</div>
	`;
}

const today = new Date();
function deleteBoard(event) {
	$.ajax({
		url: url = `/admin/${title == "자유게시판" ? 'deleteboard' : 'deletepetplace'}`,
		type: 'post',
		data: {
			deleted_at: today,
			board_id: event.id
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
function deleteComment(event) {
	$.ajax({
		url: `/admin/${title == "자유게시판" ? 'updatecommentdeleted' : 'updatepetplacecommentdeleted'}`,
		type: 'post',
		data: {
			deleted_at: today,
			comment_id: event.id
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
