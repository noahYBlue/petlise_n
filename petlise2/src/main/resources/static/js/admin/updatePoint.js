const modal = document.getElementById('modal');
let select_category = $('.isOn').children('a').text();
  
function clickModal(id, point) {
  modal.classList.add('active');

  modal.innerHTML = `
	<label class="modalBackdrop" onclick="cancel()"></label>
	<div class="modalContent" style="padding-top: 50px;">
		<h3>추가하실 포인트를 입력해 주세요.</h3>
		<input type="number" id="pointInput" />
		<div class="buttonWrap" style="margin-top: 25px;">
		  <button class="btn delete" onclick="addPoint('${id}','${point}')">수정</button>
		  <button class="btn cancel" onclick="cancel()">취소</button>
		</div>
	</div>
	`;
}

function addPoint(id, point) {
	const addPoint = document.getElementById('pointInput').value.replace(",", "");
	const replacePoint = Number(addPoint) <= 0 ? 0 : Number(point) + Number(addPoint)
	$.ajax({
		url: `/admin/updatepoint`,
		type: 'post',
		data: {
			point: replacePoint,
			id: id
		},
		success: function() {
			alert("수정되었습니다.")
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
