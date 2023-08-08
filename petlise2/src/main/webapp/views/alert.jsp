<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="/images/favicon.ico" />
    <link rel="apple-touch-icon" href="/images/favicon.ico" />
    <title>Pet LiSe</title>
  </head>
  <script>
  	let msg = "<c:out value='${msg}' />";
  	let url = "<c:out value='${url}' />";
  	
  	alert(msg);
  	location.href = url;
  </script>
</html>
