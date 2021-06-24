<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org">
<head>
  <title>Главная страница</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css">
  <style>
    body {
      background: #2f363d;
    }
  </style>
</head>
<body>

  <header>
    <div class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 border-bottom">
      <a style="color: #f6f8fa" href="https://mnpz.by/" class="d-flex align-items-center  text-decoration-none">
        <span class="fs-4">ОАО МНПЗ</span>
      </a>
      <nav class="d-inline-flex mt-2 mt-md-0 ms-md-auto">

        <label class="me-4 py-2  text-decoration-none" style="color: #f6f8fa">${pageContext.request.userPrincipal.name}</label>
        <sec:authorize access="!isAuthenticated()">
           <a class="me-3 py-2  text-decoration-none" style="color: #f6f8fa" href="/login">Войти</a>
           <a class="me-3 py-2  text-decoration-none" style="color: #f6f8fa" href="/registration">Зарегистрироваться</a>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
          <a class="me-3 py-2  text-decoration-none" style="color: #f6f8fa" href="/office">Личный кабинет</a>
          <a class="me-3 py-2  text-decoration-none" style="color: #f6f8fa" href="/logout">Выйти</a>
        </sec:authorize>
      </nav>
    </div>
  </header>


</body>
</html>