const petChoose = document.querySelector('.pet_choose');
  const radioInputs = petChoose.querySelectorAll('input[type="radio"]');

  radioInputs.forEach(input => {
    input.addEventListener('change', () => {
      const selectedValue = petChoose.querySelector('input[type="radio"]:checked').value;
      console.log('Selected pet:', selectedValue);
    });
  });


document.getElementById('dropdown').innerHTML += `
  <div class="select">
    <span>카테고리 선택</span>
  </div>
  <input type="hidden" id="main_category" name="main_category"/>
  <ul class="dropdown-menu">
    <li>건강식</li>
    <li>일반식</li>
    <li>간식</li>
    <li>기타</li>
  </ul>
`;

$('#dropdown').click(function () {
  $(this).attr('tabindex', 1).focus();
  $(this).toggleClass('active');
  $(this).find('.dropdown-menu').slideToggle(300);
});

$('#dropdown').focusout(function () {
  $(this).removeClass('active');
  $(this).find('.dropdown-menu').slideUp(300);
});

$('#dropdown .dropdown-menu li').click(function (e) {
  e.stopPropagation();
  let value = $(this).text();
  $(this).parents('.dropdown').find('span').text(value);
  $(this).parents('.dropdown').find('input').val(value);
  $(this).parents('.dropdown').find('.dropdown-menu').slideUp(300);

  if (value === '건강식') {
    $('#smallCategory').css('display', 'block');
    $('#dropdown2 .dropdown-menu').html(`
      <li>다이어트식</li>
      <li>병원식</li>      
      <li>영양식</li>
    `);
  } else  if (value === '일반식') {
    $('#smallCategory').css('display', 'block');
    $('#dropdown2 .dropdown-menu').html(`
      <li>습식</li>
      <li>건식</li>      
    `);
  } else if (value === '간식') {
    $('#smallCategory').css('display', 'block');
    $('#dropdown2 .dropdown-menu').html(`
      <li>건조간식</li>      
      <li>화식간식</li>  
    `);
  } else {
    $('#smallCategory').css('display', 'none');
    $('#dropdown2 .dropdown-menu').html('');
  }

  $('#dropdown2').off('click').on('click', function (e) {
    e.stopPropagation();
    $(this).attr('tabindex', 1).focus();
    $(this).toggleClass('active');
    $(this).find('.dropdown-menu').slideToggle(300);
  });

  $('#dropdown2').off('focusout').on('focusout', function () {
    $(this).removeClass('active');
    $(this).find('.dropdown-menu').slideUp(300);
  });

  $('#dropdown2 .dropdown-menu li').off('click').on('click', function (e) {
    e.stopPropagation();
    let value = $(this).text();
    $(this).parents('.dropdown').find('span').text(value);
    $(this).parents('.dropdown').find('input').val(value);
    $(this).parents('.dropdown-menu').slideUp(300);
    $(this).parents('.dropdown').removeClass('active');
  });
});
