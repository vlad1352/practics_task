<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Вход в аккаунт</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css">
  <style>
    body {
      background: #2f363d;
    }
  </style>
</head>

<body>
<sec:authorize access="isAuthenticated()">
  <% response.sendRedirect("/"); %>
</sec:authorize>
<div align = "center">
  <form method="POST" action="/login">
    <div class="col-md-3 ml-md-auto text-center " style="margin-top:10%">
      <div class="card mb-4 rounded-2 shadow-sm border-primary" >
        <div class="card-header py-3" style="background-color: #6a737d;">
          <h4 style="color: #f6f8fa" class="my-0 fw-normal">Вход в систему</h4>
        </div>
        <div class="card-body" style="background-color: #6a737d;">
          <ul class="list-unstyled mt-3 mb-4">
            <label for="login_field" style="color: #f6f8fa">
              Номер пропуска
            </label>
            <input type="text" name="username" id="login_field" class="form-control input-block"
                   autofocus="true">
            <div class="position-relative">
              <label for="password" style="color: #f6f8fa">
                Пароль
              </label>
              <input type="password" name="password" id="password"
                     class="form-control form-control input-block">
              <h4 ><a href="/registration" style="color: #2188ff">Зарегистрироваться</a></h4>
            </div>
          </ul>
          <input type="submit" name="commit" value="Войти" class="btn btn-primary btn-block">
        </div>
      </div>
    </div>
  </form>
</div>

</body>
</html>

