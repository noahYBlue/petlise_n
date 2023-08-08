$('#dropdown').click(function() {
	$(this).attr('tabindex', 1).focus();
	$(this).toggleClass('active');
	$(this).find('.dropdown-menu').slideToggle(300);
});

$('#dropdown').focusout(function() {
	$(this).removeClass('active');
	$(this).find('.dropdown-menu').slideUp(300);
});

$('#dropdown .dropdown-menu li').click(function(e) {
	e.stopPropagation();
	let value = $(this).text();
	$(this).parents('.dropdown').find('span').text(value);
	$(this).parents('.dropdown').find('input').val(value);
	$(this).parents('.dropdown').find('.dropdown-menu').slideUp(300);
});

$('#dropdown2').off('click').on('click', function(e) {
	e.stopPropagation();
	$(this).attr('tabindex', 1).focus();
	$(this).toggleClass('active');
	$(this).find('.dropdown-menu').slideToggle(300);
});

$('#dropdown2').off('focusout').on('focusout', function() {
	$(this).removeClass('active');
	$(this).find('.dropdown-menu').slideUp(300);
});

$('#dropdown2 .dropdown-menu li').off('click').on('click', function(e) {
	e.stopPropagation();
	let value = $(this).text();
	$(this).parents('.dropdown').find('span').text(value);
	$(this).parents('.dropdown').find('input').val(value);
	$(this).parents('.dropdown-menu').slideUp(300);
	$(this).parents('.dropdown').removeClass('active');
});

$('#dropdown3').off('click').on('click', function(e) {
	e.stopPropagation();
	$(this).attr('tabindex', 1).focus();
	$(this).toggleClass('active');
	$(this).find('.dropdown-menu').slideToggle(300);
});

$('#dropdown3').off('focusout').on('focusout', function() {
	$(this).removeClass('active');
	$(this).find('.dropdown-menu').slideUp(300);
});

$('#dropdown3 .dropdown-menu li').off('click').on('click', function(e) {
	e.stopPropagation();
	let value = $(this).text();
	$(this).parents('.dropdown').find('span').text(value);
	$(this).parents('.dropdown').find('input').val(value);
	$(this).parents('.dropdown-menu').slideUp(300);
	$(this).parents('.dropdown').removeClass('active');
});

$('#dropdown4').off('click').on('click', function(e) {
	e.stopPropagation();
	$(this).attr('tabindex', 1).focus();
	$(this).toggleClass('active');
	$(this).find('.dropdown-menu').slideToggle(300);
});

$('#dropdown4').off('focusout').on('focusout', function() {
	$(this).removeClass('active');
	$(this).find('.dropdown-menu').slideUp(300);
});

$('#dropdown4 .dropdown-menu li').off('click').on('click', function(e) {
	e.stopPropagation();
	let value = $(this).text();
	$(this).parents('.dropdown').find('span').text(value);
	$(this).parents('.dropdown').find('input').val(value);
	$(this).parents('.dropdown-menu').slideUp(300);
	$(this).parents('.dropdown').removeClass('active');
});


