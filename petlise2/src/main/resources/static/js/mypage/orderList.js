//주문취소 버튼
function cancelOrder(order_id) {
    $.ajax({
      type: 'POST',
      url: '/cancelorder', 
      data: {
        order_id: order_id 
      },
      success: function(response) {
        location.href = "/orderlist";
      },
      error: function(error) {
        console.error(error);
      }
    });
  }