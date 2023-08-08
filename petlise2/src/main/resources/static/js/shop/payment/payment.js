//천단위 콤마표시
	$(document).ready(function() {

	  $('.product_price, .price_total').each(function() {
	    var $priceElement = $(this);
	    var priceText = $priceElement.text();
	    var priceNumber = parseInt(priceText, 10);
	    var formattedPrice = numberWithCommas(priceNumber);
	    $priceElement.html('<img src="/images/mypage/coin2.svg" id="point_Icon">' + formattedPrice);
	  });
	});
	
	function numberWithCommas(number) {
	  return number.toLocaleString();
	}
	
//회원 정보 동일 버튼
	$(document).ready(function() {
	
	  $('#address_CheckBox').click(function() {
	    if ($(this).is(':checked')) {
	      
	      var memberAddress = $('#member_Address').text();
	      var addressParts = memberAddress.split(', ');
	      
	      $('#sample6_postcode').val(addressParts[0]);
	      $('#sample6_address').val(addressParts[1]);
	      $('#sample6_detailAddress').val(addressParts[2]);
	    } else {
	      
	      $('#sample6_postcode').val('');
	      $('#sample6_address').val('');
	      $('#sample6_detailAddress').val('');
	    }
	  });
	});


//상품 전체 Point 계산
	var productPrices = document.getElementsByClassName("product_price");
	var productQuantities = document.getElementsByClassName("product_quantity");
	var calcTotalPoint = 0;
	
	for (var i = 0; i < productPrices.length; i++) {
	  var price = parseFloat(productPrices[i].innerText);
	  var quantity = parseFloat(productQuantities[i].innerText);
      var subTotal = price * quantity;
	  calcTotalPoint += subTotal;
	}
	
	var formattedTotalPoint = calcTotalPoint.toLocaleString();
	var totalPoint = document.getElementById("totalPoint");
	totalPoint.innerText = formattedTotalPoint;

// 총 결제 Point 계산
	calcTotalPayment = calcTotalPoint + 3000;
	
	var formattedTotalPayment = calcTotalPayment.toLocaleString();
	var totalPayment = document.getElementById("totalPayment");
	totalPayment.innerText = formattedTotalPayment;


// 잔여 Point 계산
  var userPointValue = document.getElementById("userPoint").textContent.replace(/,/g, "");
  var userPoint = parseInt(userPointValue);
  var calcChange = userPoint - calcTotalPayment;

  var formattedChange = calcChange.toLocaleString();
  var change = document.getElementById("change");
  change.innerText = formattedChange;


	var user_id = $('#member_User_Id').text();
// 결제하기 버튼
$('#order_Btn').click(function() {
    if ($('#check_Delivery').is(':checked') && $('#check_Order').is(':checked')) {
        let inputName = $('#input_Name').val();
        let inputPhone = $('#input_Phone').val();

        // 이름 확인
        if (inputName.trim() === '') {
            alert('이름을 입력하세요.');
            return false;
        }

        // 전화번호 확인
        if (inputPhone.trim() === '') {
            alert('전화번호를 입력하세요.');
            return false;
        }
        
        // 주소 확인
        if ($('#sample6_postcode').val().trim() === '' || $('#sample6_address').val().trim() === '') {
            alert('배송지를 입력하세요.');
            return false;
        }
        
        // 포인트 금액 확인
        if (calcChange < 0) {
            alert('보유 포인트가 부족합니다.');
            return false;
        }

        if (confirm("결제를 진행하시겠습니까?")) {
            // 구매자 정보 저장
            $.ajax({
                url: '/saveorderinfo',
                type: 'POST',
                dataType: 'json',
                data: {
                    user_id: user_id,
                    name: $('#input_Name').val(),
                    phone: $('#input_Phone').val(),
                    address: $('#sample6_postcode').val() + ", "
                        + $('#sample6_address').val() + ", "
                        + $('#sample6_detailAddress').val(),
                    require: $('#input_Require').val(),
                    available_point: userPointValue,
                    total_product: calcTotalPoint,
                    total_payment: calcTotalPoint + 3000,
                    status: "주문완료"
                },
                success: function(response) {
                    orderConfirm(user_id);
                },
                error: function(xhr, status, error) {
                    console.log("구매자 정보 저장 에러:", error);
                }
            });
        } else {
            console.log("결제가 취소되었습니다.");
        }
    } else {
        alert("배송 및 주문정보를 확인해주세요.");
        return false;
    }
});

// 주문번호 부여
function orderConfirm(user_id) {
    $.ajax({
        url: '/orderconfirm',
        type: 'POST',
        dataType: 'json',
        data: {
            user_id: user_id
        },
        success: function(response) {
            // 주문번호 확인 성공
            deleteCart(user_id); // 주문완료 후 장바구니 비우기
        },
        error: function(xhr, status, error) {
            console.log("주문번호 저장 에러:", error);
        }
    });
}

// 장바구니 비우기 함수
function deleteCart(user_id) {
    $.ajax({
        url: '/deletecart',
        type: 'POST',
        data: {
            user_id: user_id
        },
        success: function(response) {
            // 장바구니 비우기 성공
            updateSales(); // 판매량 업데이트
        },
        error: function(xhr, status, error) {
            console.log("장바구니 비우기 에러:", error);
        }
    });
}

// 판매량/재고 업데이트 함수
function updateSales() {
    var product_ids = [];
    $('.product_id').each(function() {
        var product_id = parseInt($(this).text());
        product_ids.push(product_id);
    });
    
    var product_sales = [];
    $('.product_quantity').each(function() {
        var product_sale = parseInt($(this).text());
        product_sales.push(product_sale);
    });

    $.ajax({
        url: '/updatesales',
        type: 'POST',
        dataType: 'json',
        traditional: true,
        data: {
            product_ids: product_ids,
            product_sales: product_sales
        },
        success: function(response) {
        	updatePointPayment(user_id);
        },
        error: function(xhr, status, error) {
            console.log("판매량 업데이트 에러:", error);
        }
    });
}

//포인트 업데이트 함수
function updatePointPayment(user_id){
	var point = calcChange;
	
	$.ajax({
	    url: '/updatepointpayment',
	    type: 'POST',
	    dataType: 'json',
	    data: {
	        user_id: user_id,
	        point: point
	    },
	    success: function(response) {
	        location.href = "/orderend";
	    },
	    error: function(xhr, status, error) {
	        console.log("포인트 업데이트 에러:", error);
	    }
	});
}
