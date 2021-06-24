<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Регистрация</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css">
  <style>
    body {
      background: #2f363d;
    }
  </style>
</head>

<body>
<div align = "center">
  <form:form method="POST" modelAttribute="userForm">
    <div class="col-md-3 ml-md-auto text-center " style="margin-top:10%">
      <div class="card mb-4 rounded-2 shadow-sm border-primary" >
        <div class="card-header py-3" style="background-color: #6a737d;">
          <h4 style="color: #f6f8fa" class="my-0 fw-normal">Регистрация</h4>
        </div>
        <div class="card-body" style="background-color: #6a737d;">
          <ul class="list-unstyled mt-3 mb-4">
              <label for="login_field" style="color: #f6f8fa">
                  Фамилия
              </label>
             <input type="text" name="surname" class="form-control input-block" autofocus="true"/>
            <label for="login_field" style="color: #f6f8fa">
              Номер пропуска
            </label>
            <form:input type="text" path="username" id="login_field" class="form-control input-block"
                        autofocus="true"></form:input>
            <form:errors path="username"></form:errors> ${usernameError}
            <div class="position-relative">
              <label for="password" style="color: #f6f8fa">
                Пароль
              </label>
              <form:input type="password" path="password" id="password"
                          class="form-control form-control input-block"></form:input>
            </div>
            <div class="position-relative">
              <label for="password" style="color: #f6f8fa">
                Подтвердите пароль
              </label>
              <form:input type="password" path="passwordConfirm" id="passwordConfirm"
                          class="form-control form-control input-block"></form:input>
              <form:errors path="password"></form:errors> ${passwordError}

            </div>
          </ul>
          <h4 ><a href="/" style="color: #2188ff">Отмена</a></h4>
          <button type="submit" name="commit" class="btn btn-primary btn-block">Зарегистрироваться</button>

        </div>
      </div>
    </div>
  </form:form>
</div>

</body>
</html>
