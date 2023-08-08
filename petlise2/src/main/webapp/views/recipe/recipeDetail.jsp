<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" href="/images/favicon.ico" />
<link rel="apple-touch-icon" href="/images/favicon.ico" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/recipe/recipeDetail.css" />
<link rel="stylesheet" href="/css/recipe/recipePage.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
	rel="stylesheet" />
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<title>Pet LiSe</title>
</head>
<jsp:include page="../header.jsp" />
<body>
<script>
	//파라미터 값 가져오기
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	const recipe_id = urlParams.get('recipe_id');
	console.log(recipe_id);
</script>
	<input type="hidden" id="session_recipe_id"
		value="${sessionScope.recipe_id}" />
	<input type="hidden" id="session_user_id"
		value="${sessionScope.user_id}" />
	<div id="user_id" style="display: none;">${userInfo.user_id}</div>
	<div id="profile_image" style="display: none;">${userInfo.profile_image}</div>
	<div id="recipe_id" style="display: none;">${recipeDetail.recipe_id}</div>
	<input type="hidden" id="recipe_likes" value="${recipeDetail.likes}" />

	<div class="wrap">
		<div id="board_title">

			<div class="title_recipe">
				<div class="pet_icon">
					<c:choose>
						<c:when test="${recipeDetail.pet_category eq '강아지' }">
							<div class="dog_icon">
								<img src="/images/recipe/dog_icon.svg">
							</div>
						</c:when>
						<c:when test="${recipeDetail.pet_category eq '고양이' }">	
							<div class="cat_icon">
								<img src="/images/recipe/cat_icon.svg">
							</div>
						</c:when>
					</c:choose>	
				</div>
				<span>${recipeDetail.recipe_category}</span>
			</div>
		</div>

		<div class="idx_top" style="background-image: url(https://storage.googleapis.com/${recipeDetail.image});">
			<div class="main_top_category">${recipeDetail.main_category} |
				${recipeDetail.sub_category}</div>
			<div class="main_top_title">${recipeDetail.recipe_title}</div>
			<div class="main_bottom">
				<div class="main_top_writer">${userProfile.name}</div>
				<div class="main_top_date"><fmt:formatDate value="${recipeDetail.recipe_created_at}" pattern="yyyy.MM.dd" /></div>
				<div class="view_cnt" style="margin-left: 10px;">조회수 : ${recipeDetail.view_cnt}</div>
			</div>
		</div>
	</div>
	<div class="board_body">
		<div class="board_body_inside">
			<div class="post_actions">
				<button class="recipe_edit_btn" onclick="redirectToRecipeEdit()">
					<p>수정</p>
				</button>
				<button class="recipe_delete_btn">삭제</button>
			</div>
			<div class="contents" style="text-align: center;">
				<span>${recipeDetail.recipe_contents}</span>
			</div>
			<div id="post_like">
				<button id="like_btn">
					<img src="/images/recipe/heart.svg">
					<p id="recipe_likes_count">${recipeDetail.likes}</p>
					좋아요
				</button>
			</div>
		</div>
	</div>


	<div class="board_body_inside">
		<!-- 댓글작성 -->
		<div id="cmt_writing_box">
			<div style="margin-left: 15px;">
				<span>댓글</span>
				<span class="cmt_count">${recipeDetail.comments}</span>
			</div>
			<div class="cmt_write_input">
				<img src="/images/recipe/profile.svg">
				<textarea class="cmt_textarea" id="cmt_input"
					placeholder="이 곳에 댓글 내용을 입력해주세요."></textarea>
				<div class="character_count">0/1000</div>
			</div>
			<div class="cmt_write_input_bottom">
				<div class="cmt_actions">
					<label for="file1">
					<img id="fileimg1" src="/images/recipe/picture.svg" 
						style="margin-top: 5px; margin-left: 10px;"/>
					</label>
					<input type="file" id="file1" style="display:none;" />
					<input type="hidden" id="imageValue1" value="" />
					<button id="cmt_save">등록</button>
				</div>
			</div>
		</div>

		<!-- 댓글 목록 -->
		<div class="cmt_list">
			<c:forEach var="recipeComment" items="${recipeComment}" begin="0"
				end="9">
				<div class="cmt_unit">
					<div style="display: none;" class="comment_id">${recipeComment.comment_id}</div>
					<div style="display: none;">${recipeComment.recipe_id}</div>
					<div class="cmt_user">
						<img src="https://storage.googleapis.com/${recipeComment.profile_image}" 
							onerror="this.onerror=null; this.src='/images/recipe/profile.svg';"
							style="width: 35px; height: 35px; border-radius: 50%; border: solid 1px var(--light-sub); margin-right: 10px;"> 
						<span class="cmt_user_id" style="display:none;">${recipeComment.user_id}</span>
							<span class="cmt_user_name" style="margin-top: 5px;">${recipeComment.name}</span>
						<div class="cmt_btns" style="margin-top: 5px;">
							<button class="cmt_edit"
								onclick="cmtEdit('${recipeComment.comment_id}')">수정</button>
							<span>ㆍ</span>
							<button class="cmt_delete">삭제</button>
							<span class="cmt_date" style="font-size: 14px; margin-left: 5px;"><fmt:formatDate
									value="${recipeComment.comment_created_at}" pattern="yyyy.MM.dd" /></span>
						</div>
						<div class="cmt_util">
							<button class="cmt_like">
								<img src="/images/recipe/heart.svg">좋아요
							</button>
							<button class="cmt_siren">
								<img src="/images/recipe/siren.svg" class="icon_siren">신고
							</button>
						</div>
					</div>
					<div class="cmt_content_box"
						id="cmt_content_box_${recipeComment.comment_id}">
						<div style="display: flex; align-items: center;">
							<div class="cmt_img">
								<img src="https://storage.googleapis.com/${recipeComment.comment_image}"
									onerror="this.onerror=null; this.src='/images/recipe/picture.svg';"
									style="width: 50px; height: 50px; margin-right: 10px;">
							</div>
							<div class="cmt_contents" style="width:1300px;">${recipeComment.comment_contents}</div>
						</div>
						<div class="edit_mode" style="display: none;">
							<textarea class="edit_comment_content">${recipeComment.comment_contents}</textarea>
								<img src="${recipeComment.comment_image}" />
							<div class="edit_btns">
								<button onclick="saveChanges(${recipeComment.comment_id})">수정</button>
								<button onclick="cmtEdit(${recipeComment.comment_id})">취소</button>
							</div>
						</div>

					</div>
				</div>
			</c:forEach>
		</div>

	</div>

	<div class="blank_space"></div>

	<div class="page">
		<div class="pagination">
			<a href="#"><div class="precious"></div></a>
			<div class="number">
				<a href="#" aria-current="page">1</a> <a href="#">2</a> <a href="#">3</a>
				<a href="#">4</a> <a href="#">5</a> <a href="#">6</a> <a href="#">7</a>
				<a href="#">8</a> <a href="#">9</a> <a href="#">10</a>
			</div>
			<a href="#"><div class="next"></div></a>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
	<jsp:include page="../topButton.jsp" />	
</body>
<script>
//레시피 수정
function redirectToRecipeEdit() {
    window.location.href = "recipeedit?recipe_id=" + recipe_id;
}

//레시피 삭제
$(document).ready(function(){
    $('.recipe_delete_btn').click(function(){
    	
        $.ajax({
            url: '/deletemyrecipe',
            type: 'POST',
            dataType: 'JSON',
            data: { 
            	recipe_id: recipe_id,
            	user_id: "${sessionScope.user_id}"
            },
            success: function(response) {
            	location.href = "/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=건강식&searchType3=다이어트식";
            },
            error: function(xhr, status, error) {
            	alert("본인 이외에는 삭제가 불가합니다.");
                console.error(error);
            }
    	}); 
    });
});


//좋아요 수 업데이트(recipeLike)
$(document).ready(function() {
  var isLiked = false;

  $("#like_btn").on("click", function() {

    var user_id = $("#session_user_id").val();

    isLiked = !isLiked;
    
    if (isLiked) {
        $("#post_like button img").attr("src", "/images/recipe/heart_hit.svg");
      } else {
        $("#post_like button img").attr("src", "/images/recipe/heart.svg");
      }
    
 	var likes = Number(isLiked);
 	var recipe_likes = 0;
 	
 	if (likes === 0) {
 		  recipe_likes = -1;
 		} else if (likes === 1) {
 		  recipe_likes = 1;
 		}

    //좋아요 레코드 확인(recipeLike)
    $.ajax({
      type: "POST",
      url: "/checklike",
      contentType: "application/json",
      data: JSON.stringify({
        recipe_id: recipe_id,
        user_id: user_id
      }),
      success: function(response) {
        if (response.exists) {
          //레코드가 존재하면 좋아요 수 업데이트
          updateLike(recipe_id, user_id, isLiked, likes);
          recipeLike(recipe_id, user_id, likes);

        } else {
          //레코드가 존재하지 않으면 좋아요 수 삽입
          insertLike(recipe_id, user_id, isLiked, likes);
          recipeLike(recipe_id, user_id, likes);
        }
      },
      error: function() {
        console.error("좋아요 상태 체크 에러");
      }
    });
  });

  //좋아요 수 업데이트(recipeLike)
  function insertLike(recipe_id, user_id, isLiked, likes) {
    $.ajax({
      type: "POST",
      url: "/likecount",
      contentType: "application/json",
      dataType: "JSON",
      data: JSON.stringify({
        recipe_id: recipe_id,
        user_id: user_id,
        is_like: isLiked,
        likes: likes
      }),
      success: function(response) {
        console.log("좋아요 상태 변경");
        console.log("새로운 is_like 값: " + isLiked);
        console.log("좋아요 변화값: " + likes); 
        
        var recipeLikesCount = Number($("#recipe_likes_count").text());
        var newLikesCount = isLiked ? recipeLikesCount + 1 : recipeLikesCount - 1;
        $("#recipe_likes_count").text(newLikesCount);
      },
      error: function() {
        console.error("좋아요 상태 변경 에러");
      }
    });
  }

  //좋아요 수 수정(recipeLike)
  function updateLike(recipe_id, user_id, isLiked, likes) {
    $.ajax({
      type: "POST",
      url: "/updatelike",
      contentType: "application/json",
      dataType: "JSON",
      data: JSON.stringify({
        recipe_id: recipe_id,
        user_id: user_id,
        is_like: isLiked,
        likes: likes
      }),
      success: function(response) {
        console.log("좋아요 상태 업데이트");
        console.log("새로운 is_like 값: " + isLiked);
        console.log("좋아요 변화값: " + likes); 
        
        var recipeLikesCount = Number($("#recipe_likes_count").text());
        var newLikesCount = isLiked ? recipeLikesCount + 1 : recipeLikesCount - 1;
        $("#recipe_likes_count").text(newLikesCount);
      },
      error: function() {
        console.error("좋아요 상태 업데이트 에러");
      }
    });
  }
  
	//레시피 likes수 추가
	function recipeLike(recipe_id, user_id, likes) {
		var likes = Number(isLiked);
	 	var recipe_likes = 0;
		var original_likes = parseInt($("#recipe_likes").val(), 10);
	 	
	 	if (likes === 0) {
	 		  recipe_likes = 0;
	 		} else if (likes === 1) {
	 		  recipe_likes = 1;
	 		}
		
	  $.ajax({
	    type: "POST",
	    url: "/recipelike",
	    contentType: "application/json",
	    dataType: "JSON",
	    data: JSON.stringify({
	      recipe_id: recipe_id,
	      user_id: user_id,
	      likes: Number(original_likes) + Number(recipe_likes)
	    }),
	    success: function(response) {
    	  $("#recipe_likes_count").text(response.likes);	
	      console.log("------------------------");
	    },
	    error: function() {
	      console.error("좋아요 수 업데이트 에러");
	    }
	  });
	}	  
  
});

//댓글 파일 업로드
$("#file").change(function() {
	const file = document.getElementById("file1");
	const url = file.files[0];

	if (!url) {
		alert("파일이 없습니다");
		return;
	}

	const maxSize = 5 * 1024 * 1024;
	const fileSize = url.size;

	if (fileSize > maxSize) {
		alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.");
		$(this).val('');
		return false;
	}

	let formData = new FormData();
	formData.append("image", url)

	$.ajax({
		url: "/api/image-upload",
		type: "post",
		data: formData,
		enctype: 'multipart/form-data',
		contentType: false,
		processData: false,
		success: function(url) {
			$("#fileimg1").attr("src", 'https://storage.googleapis.com/${url}');
			$("#imageValue1").val(url);
		},
		error: function(error) {
			console.log(error);
		}
	})
});

//댓글작성	
$("#cmt_save").on("click", function() {

	$.ajax({
		type : "POST",
		url : "/writerecipecomment",
		contentType : "application/json",
		dataType : "JSON",
		data : JSON.stringify({
			recipe_id : $("#recipe_id").text(),
			user_id : $("#user_id").text(),
			comment_image: $("#imageValue1").val(),
			comment_contents : $("#cmt_input").val()
		}),
		success : function(response) {
			location.href = "/recipedetail?recipe_id=" + recipe_id;
		},
		error : function() {
			console.error("댓글작성실패");
		}
	});
});


//댓글 삭제
$(document).ready(function(){
    $('.cmt_delete').click(function(){
        var comment_id = $(this).closest('.cmt_unit').find('.comment_id').text();
        $.ajax({
            url: '/deleterecipecomment',
            type: 'POST',
            data: { 
            	comment_id: comment_id,
            	user_id: "${sessionScope.user_id}"
            },
            success: function(response) {
                location.href = "/recipedetail?recipe_id=" + recipe_id;
            },
            error: function(xhr, status, error) {
            	alert("본인 이외에는 삭제가 불가합니다.");
                console.error(error);
            }
    	}); 
    });
});

//댓글 편집모드 실행
function cmtEdit(comment_id) {
  const cmtContentBox = document.getElementById(`cmt_content_box_${comment_id}`);
  const cmtContentsElement = cmtContentBox.querySelector('.cmt_contents');
  const editMode = cmtContentBox.querySelector('.edit_mode');
  const editCommentContent = editMode.querySelector('.edit_comment_content');

  // 이미 수정 모드인 경우 취소 버튼을 누를 때 원래 내용을 보여줌
  if (editMode.style.display === 'block') {
    cmtContentsElement.style.display = 'block';
    editMode.style.display = 'none';
  } else {
    const cmtContents = cmtContentsElement.textContent;
    editCommentContent.value = cmtContents;

    cmtContentsElement.style.display = 'none';
    editMode.style.display = 'block';
  }
}

 //댓글 수정부분 저장
 function saveChanges(comment_id) {
   const editedContent = document.getElementById(`cmt_content_box_${comment_id}`).querySelector('.edit_comment_content').value;
   const recipe_id = $("#recipe_id").text();
   const user_id = $("#user_id").text();
   const editedImage = document.querySelector(`#cmt_content_box_${comment_id} .edit_comment_image`);
   const editContents = $(".edit_comment_content").val();
	
   const comment_image = editedImage ? editedImage.value : null;
   
   $.ajax({
	    url: "/editcomment",
	    type: "POST",
		contentType : "application/json",
		dataType : "JSON",
		data : JSON.stringify({
			recipe_id : recipe_id,
			user_id : user_id,
			comment_image: comment_image,
			comment_contents : editContents
		}),
		success : function(response) {
			console.log("댓글수정성공");
		},
		error : function() {
			console.error("댓글수정실패");
		}
   });

   document.getElementById(`cmt_content_box_${comment_id}`).querySelector('.cmt_contents').textContent = editedContent;
   document.getElementById(`cmt_content_box_${comment_id}`).querySelector('.edit_mode').style.display = 'none';
   document.getElementById(`cmt_content_box_${comment_id}`).querySelector('.cmt_contents').style.display = 'block';
 }

//댓글 입력 글자수
$(document).ready(function() {

	var cmtInput = $("#cmt_input");
	var characterCount = $(".character_count");

	cmtInput.on("input", function() {
		var currentLength = cmtInput.val().length;
		var maxLength = 1000;

		characterCount.text(currentLength + "/" + maxLength);
	});
});
</script>
</html>