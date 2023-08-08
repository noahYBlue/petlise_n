$(document).ready(function () {
  $('.editButton').on('click', function () {
    let password = $('#password').val();

    if (password.length !== 0) {
      let name =
        $('#nameInput').val().length == 0
          ? $('#nameText').text()
          : $('#nameInput').val();
      let newPassword = $('#newPassword').val();
      let checkNewPassword = $('#checkNewPassword').val();

      let post = $("input[name='address']")[0].value;
      let address1 = $("input[name='address']")[1].value;
      let address2 = $("input[name='address']")[2].value;
      let address = `${post},${address1},${address2}`;

      let imageValue = $('#imageValue').val();
      let profileImage = imageValue.length == 0 ? null : imageValue;

      let petType = $("input[name='pet_type']:checked").val();
      let petName = $('.petName').val();
      let petAge = $('.petAge').val();

      if (newPassword != checkNewPassword) {
        alert('비밀번호가 다릅니다.');
        return false;
      }

      $.ajax({
        url: '/updateuser',
        type: 'post',
        dataType: 'json',
        data: {
          name: name,
          password: password,
          new_password: newPassword,
          address: address,
          profile_image: profileImage,
          pet_type: petType,
          pet_name: petName,
          pet_age: petAge
        },
        success: function (data) {
          alert(data.response);
          location.reload();
        },
        error: function (error) {
          console.log(error);
        }
      });
    } else {
      alert('비밀번호를 입력해주세요');
    }
  });
});

function regPw() {
  const pwReg = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,12}$/;
  let pw = $('#newPassword').val();

  if (!pwReg.test(pw)) {
    $('#pwRequired').text('비밀번호는 영문과 숫자를 포함한 6~12자리 입니다.');
    $('#pwRequired').addClass('required');
    $('#checkPwRequired').text('비밀번호가 일치하지 않습니다.');
    $('#checkPwRequired').addClass('required');
  } else {
    $('#pwRequired').text('');
    $('#pwRequired').removeClass('required');
  }
  if (pw.length === 0) {
    $('#pwRequired').text('');
    $('#checkPwRequired').text('');
  }
}

function checkPw() {
  let pw = $('#newPassword').val();
  let checkpw = $('#checkNewPassword').val();

  if (pw !== checkpw) {
    $('#checkPwRequired').addClass('required');
  } else {
    $('#checkPwRequired').text('');
    $('#checkPwRequired').removeClass('required');
  }
}

function changeInput() {
  let name = document.getElementById('nameTextWrap');
  let nameInput = document.getElementById('nameInput');

  name.style.display = 'none';
  nameInput.style.display = 'block';
}
