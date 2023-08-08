<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/board/boardWrite.css">
    <link rel="stylesheet" href="/css/style.css" />  
        <link rel="stylesheet" href="/css/board/petplaceWrite.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

            <link
      href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
      rel="stylesheet"
    /><link rel="stylesheet" href="/css/editor.css" />
    <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
    
    <title>자유게시판 등록</title>
      
</head>
<header>
	<jsp:include page="../header.jsp" />
</header>
<body>
    <div id="container">
     

        <div class="board_title">
        <a href="/boardMain">자유게시판 등록</a>
		</div>
		<p>제목</p>
     
        <div class="write_title">
    	<input type="text" placeholder="제목" name="board_title"
			size="80%"  maxlength="50"	style="font-size: 24px;" value="${board.board_title}" />
			        </div>
  
          
          
  



<div class="editorWrap">
				<div id="editor">${board.board_contents}</div>
				<button class="writeButton" onclick="return edit()">등록하기</button>
			</div>
        </div>
     <footer>
	<div>

		<jsp:include page="../footer.jsp" />
	</div>
	</footer>
    <script src="/js/board/editBoard.js"></script>
 <script src="/js/editor.js"></script>



</body>
</html>