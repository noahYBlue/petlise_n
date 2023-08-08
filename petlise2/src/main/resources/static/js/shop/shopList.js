//로드 후 자동 css 실행 영역
const SearchType1 = $('#searchType1').val();
const SearchType2 = $('#searchType2').val();

if(SearchType1 == '' && SearchType2==''){
	$('#textTitle').text('전체상품');
}else if(SearchType1 != ''){
	if(SearchType1=='강아지'){
		$("#category_dog").toggleClass('active');
		if(SearchType2=='사료'){
			$("#category_dog>#D01").toggleClass('active');
		}else if(SearchType2=='간식'){
			$("#category_dog>#D02").toggleClass('active');
		}else if(SearchType2=='영양제'){
			$("#category_dog>#D03").toggleClass('active');
		}else if(SearchType2=='장난감'){
			$("#category_dog>#D04").toggleClass('active');
		}
	}else if(SearchType1 =='고양이'){
		$("#category_cat").toggleClass('active');
		if(SearchType2=='사료'){
			$("#category_cat>#C01").toggleClass('active');
		}else if(SearchType2=='간식'){
			$("#category_cat>#C02").toggleClass('active');
		}else if(SearchType2=='영양제'){
			$("#category_cat>#C03").toggleClass('active');
		}else if(SearchType2=='장난감'){
			$("#category_cat>#C04").toggleClass('active');
		}
	}
	
	if(SearchType2=='') {
		$('#textTitle').text(SearchType1+' 전체상품');
	}else{
		$('#textTitle').text(SearchType1+' - '+SearchType2);
	}
}

//라이스샵 홈버튼 (모든 조건 초기화)
$("#shopTitle").on('click', function() {
	location.href = location.pathname;
});

//결과 없을때 홈가기 버튼
$("#noresult>button").on('click', function() {
	location.href = location.pathname;
});

//동물카테고리 클릭버튼 (품절여부만 유지)
$(".title").on('click', function() {
	let type1 = $(this).children("span").text();
	
	const queryparamsPage = {
		page: 1,
		searchType1: type1, //동물카테고리
		searchType3: $('#issoldout').is(':checked')?'판매중':'전체' //품절여부
	}
	
	location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
});


//상품카테고리 클릭버튼 (품절여부만 유지)
$(".product").on('click', function() {
	let type1 = $(this).attr("id").substring(0,1);	
	let type2 = $(this).attr("id").substring(1);	
	
	if(type1 == "D"){
		type1 = "강아지";	
	}else if(type1 == "C"){
		type1 = "고양이";
	}
	
	if(type2 == "01"){
		type2 = "사료";	
	}else if(type2 == "02"){
		type2 = "간식";
	}else if(type2 == "03"){
		type2 = "영양제";
	}else if(type2 == "04"){
		type2 = "장난감";
	}
	const queryparamsPage = {
		page: 1,
		searchType1: type1, //동물카테고리
		searchType2: type2,  //상품카테고리
		searchType3: $('#issoldout').is(':checked')?'판매중':'전체'//품절여부
	}
	location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
});

//sort버튼(모든조건유지)
$(".filterbtn").on('click', function() {
	const queryparamsPage = {
		page: 1,
		searchType1: SearchType1,
		searchType2: SearchType2,
		searchType3: $('#issoldout').is(':checked')?'판매중':'전체',
		sortType:$(this).text(),
		keyword: $("#keyword").val()
	}
	location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
});

//품절상품제외 체크박스(모든조건유지)
$("#issoldout").on('click', function() {
	const queryparamsPage = {
		page: 1,
		searchType1: SearchType1,
		searchType2: SearchType2,
		searchType3: $('#issoldout').is(':checked')?'판매중':'전체',
		sortType:$("#sortType").val(),
		keyword: $("#keyword").val()
	}
	location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
});

//검색창 엔터키 이벤트
$("#keyword").on("keyup", function(key) {
	if (key.keyCode == 13) {
		$("#searchbtn").click();
	}
});

//검색 버튼
$("#searchbtn").on('click', function() {
	const queryparamsPage = {
		page: 1,
		searchType1: SearchType1,
		searchType2: SearchType2,
		searchType3: $('#issoldout').is(':checked')?'판매중':'전체',
		sortType:$("#sortType").val(),
		keyword: $("#keyword").val()
	}
	location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
});

// ----- 상세페이지 넘어가기 -----

$(".products").on('click',function(){
	location.href = '/shopdetail?product_id='+$(this).attr('id') ;
});

$(".products_soldout").on('click',function(){
	location.href = '/shopdetail?product_id='+$(this).attr('id') ;
});

// ----- 모달이벤트 -----
$(".modal_cancelbtn").on('click',function(){
	$(this).parents(".modal").css('display', 'none');
});

// ----- 페이징버튼 ----- (모든조건유지)
//숫자 페이징버튼 
$(".pageNumber").on('click', function() {
	const queryparamsPage = {
		page: $(this).text(),
		searchType1: SearchType1,
		searchType2: SearchType2,
		searchType3: $('#issoldout').is(':checked')?'판매중':'전체',
		sortType:$("#sortType").val(),
		keyword: $("#keyword").val()
	}
	location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
});

//첫페이지버튼 
$(".pagefirst").on('click', function() {
	const queryparamsPage = {
		page: 1,
		searchType1: SearchType1,
		searchType2: SearchType2,
		searchType3: $('#issoldout').is(':checked')?'판매중':'전체',
		sortType:$("#sortType").val(),
		keyword: $("#keyword").val()
	}
	location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
});

//이전페이지버튼
$(".prev").on('click', function() {
	const queryparamsPage = {
		page: $(this).attr("id"),
		searchType1: SearchType1,
		searchType2: SearchType2,
		searchType3: $('#issoldout').is(':checked')?'판매중':'전체',
		sortType:$("#sortType").val(),
		keyword: $("#keyword").val()
	}
	location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
});

//다음페이지버튼
$(".next").on('click', function() {
	const queryparamsPage = {
		page: $(this).attr("id"),
		searchType1: SearchType1,
		searchType2: SearchType2,
		searchType3: $('#issoldout').is(':checked')?'판매중':'전체',
		sortType:$("#sortType").val(),
		keyword: $("#keyword").val()
	}
	location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
});

//마지막페이지버튼
$(".pagelast").on('click', function() {
	const queryparamsPage = {
		page: $(this).attr("id"),
		searchType1: SearchType1,
		searchType2: SearchType2,
		searchType3: $('#issoldout').is(':checked')?'판매중':'전체',
		sortType:$("#sortType").val(),
		keyword: $("#keyword").val()
	}
	location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
});