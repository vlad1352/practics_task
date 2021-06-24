<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Добавление нового пользователя</title>
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

  <div align = "center">
    <form:form method="POST" modelAttribute="userForm">
      <div class="col-md-3 ml-md-auto text-center " style="margin-top:10%">
        <div class="card mb-4 rounded-2 shadow-sm border-primary" >
          <div class="card-body" style="background-color: #6a737d;">
            <ul class="list-unstyled mt-3 mb-4">
              <label style="color: #f6f8fa">
                Фамилия
              </label>
              <input type="text" name="surname" class="form-control input-block" autofocus="true"/>
              <label style="color: #f6f8fa">
                Имя
              </label>
              <input type="text" name="name" class="form-control input-block" autofocus="true"/>
              <label  style="color: #f6f8fa">
                Возраст
              </label>
              <input type="text" name="age" class="form-control input-block" autofocus="true"/>
              <label style="color: #f6f8fa">
                Должность
              </label>
              <input type="text" name="post" class="form-control input-block" autofocus="true"/>
            </ul>
            <button type="submit" name="commit" class="btn btn-primary btn-block">Добавить</button>

          </div>
        </div>
      </div>
    </form:form>
  </div>
</body>
</html>