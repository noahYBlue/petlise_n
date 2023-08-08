document.getElementById('dropdown').innerHTML += `
  <div class="select">
    <span>동물 카테고리 선택</span>
  </div>
  <input type="hidden" id="pet_type" />
  <ul class="dropdown-menu">
    <li>강아지</li>
    <li>고양이</li>
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

    $('#smallCategory').css('display', 'block');
    $('#dropdown2 .dropdown-menu').html(`
      <li>사료</li>
      <li>간식</li>
      <li>영양제</li>
      <li>장난감</li>
    `);

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
