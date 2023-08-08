
		function movePage(page) {
			const url = new URL(window.location.href);
			const queryParams = new URLSearchParams(url.search);
			queryParams.set('page', page || 1);
			place_id: "${petplaceInfo.place_id}"

			url.search = queryParams.toString();
			window.location.href = url.toString();
		}

		// 숫자 페이징 버튼
		$(".pageNumber").on('click', function() {
			const page = $(this).text();

			movePage(page);
		});

		// 첫 페이지 버튼
		$(".pagefirst").on('click', function() {

			movePage(1);
		});

		// 이전 페이지 버튼
		$(".prev").on('click', function() {
			const page = $(this).attr("id");

			movePage(page);
		});

		// 다음 페이지 버튼
		$(".next").on('click', function() {
			const page = $(this).attr("id");

			movePage(page);
		});

		// 마지막 페이지 버튼
		$(".pagelast").on('click', function() {
			const page = $(this).attr("id");

			movePage(page);
		});

		// 카테고리 값 가져오기

		// 검색창 엔터키 이벤트
		$("#keyword").on("keyup", function(key) {
			if (key.keyCode == 13) {
				$("#searchbtn").click();
			}
		});

		// 검색 버튼
		$("#searchbtn").on(
				'click',
				function() {
					const queryParams = {
						page : 1,
						keyword : $("#keyword").val()
					};
					location.href = location.pathname + '?'
							+ new URLSearchParams(queryParams).toString();
				});
