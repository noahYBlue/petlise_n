const modal = document.getElementById('modal');

function cancel() {
  modal.classList.remove('active');
  modal.innerHTML = ''; // 모달 내용 초기화
}

function clickModal(event) {
  modal.classList.add('active');
  let id = event.target.id;
  let seq = event.target.getAttribute('data-placeid');
  modal.innerHTML = `
	<div class="modalBackdrop" onclick="cancel()"></div>
	<div class="modalContent">
		<h3>정말로 게시물을 삭제 하시겠습니까?</h3>
		<p>삭제한 게시물은 되돌릴 수 없습니다.</p>
		<br>
		<hr>
		<div class="buttonWrap">
		  
		  <button style="font: var(--button14);" class="btn delete" id="${id}" data-placeid="${seq}" onclick="deleteBoard(event)">삭제</button>
		  <button style="font: var(--button14);" class="btn cancel" onclick="cancel()">취소</button>
		</div>
	</div>
	`;
}

function clickCommentModal(event) {
  modal.classList.add('active');
  let id = event.target.id;
   let comment_id = event.target.getAttribute('data-placeid');
  modal.innerHTML = `
	<div class="modalBackdrop" onclick="cancel()"></div>
	<div class="modalContent">
		<h3>정말로 댓글을 삭제 하시겠습니까?</h3>
		<p>삭제한 댓글은 되돌릴 수 없습니다.</p>
		<div class="buttonWrap">
		  <button class="btn delete" id="${id}" data-placeid="${comment_id}" onclick="deleteComment(event)">삭제</button>
		  <button class="btn cancel" onclick="cancel()">취소</button>
		</div>
	</div>
	`;
}

function deleteBoard(event) {
  let seq = event.target.getAttribute('data-placeid');
  $.ajax({
    url: `/petplaceDelete`,
    type: 'post',
    data: {
      seq: seq
    },
    success: function() {
      alert("삭제되었습니다.");
      // petplaceMain 페이지로 이동
      window.location.href = "/petplaceMain";
    },
    error: function(error) {
      console.log(error);
    }
  });
}

function deleteComment(event) {
	  let comment_id = event.target.getAttribute('data-placeid');
  $.ajax({
    url: `/deletecomment`,
    type: 'post',
    data: {
     comment_id: comment_id
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
modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal")) {
        modal.style.display = "none"
    }
});

document.onkeydown = function(event) {
  if (event.key === "Escape") {
    cancel(); // ESC 키를 누르면 모달을 닫음
  }
};