<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Личный кабинет</title>
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
            <a class="me-3 py-2  text-decoration-none" style="color: #f6f8fa" href="/office">Личный кабинет</a>
            <label class="me-4 py-2  text-decoration-none"
                   style="color: #f6f8fa">${pageContext.request.userPrincipal.name}</label>
            <sec:authorize access="!isAuthenticated()">
                <a class="me-3 py-2  text-decoration-none" style="color: #f6f8fa" href="/login">Войти</a>
                <a class="me-3 py-2  text-decoration-none" style="color: #f6f8fa" href="/registration">Зарегистрироваться</a>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <a class="me-3 py-2  text-decoration-none" style="color: #f6f8fa" href="/logout">Выйти</a>
            </sec:authorize>
        </nav>
    </div>
</header>

<div>
    <sec:authorize access="hasRole('ROLE_USER')">
        <a class="btn btn-warning" href="office/${pageContext.request.userPrincipal.name}/addKpp">Пройти через кпп</a>
        <table class="me-4 py-2  text-decoration-none" style="color: #f6f8fa">
            <thead>
            <th>ID</th>
            <th>Имя</th>
            <th>Фамилия</th>
            <th>Возраст</th>
            <th>Должность</th>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <th>Пройденные КПП</th>
                <th>Время прихода</th>
                <th>Время ухода</th>
            </sec:authorize>
            </thead>
            <c:forEach items="${users}" var="user">

                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.surname}</td>
                    <td>${user.age}</td>
                    <td>${user.post}</td>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <td>
                            <c:forEach items="${user.kpps}" var="kpp">${kpp.name}; </c:forEach>
                        </td>
                        <td>${user.timeIn}</td>
                        <td>${user.timeOut}</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/office" method="post">
                                <input type="hidden" name="userId" value="${user.id}"/>
                                <input type="hidden" name="action" value="deleteU"/>
                                <button class="btn btn-warning" type="submit">Удалить</button>
                            </form>
                            <a class="btn btn-warning" href="office/${user.id}/editUser">Изменить</a>
                        </td>
                    </sec:authorize>

                </tr>
            </c:forEach>

        </table>
    </sec:authorize>

    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <table class="me-4 py-2  text-decoration-none" style="color: #f6f8fa">
            <thead>
            <th>ID</th>
            <th>Номер пропуска</th>
            <th>Пароль</th>
            <th>Роли</th>
            <th>Имя</th>
            <th>Фамилия</th>
            <th>Возраст</th>
            <th>Должность</th>


            </thead>
            <c:forEach items="${allUsers}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td>
                        <c:forEach items="${user.roles}" var="role">${role.name}; </c:forEach>
                    </td>
                    <td>${user.userDetails.name}</td>
                    <td>${user.userDetails.surname}</td>
                    <td>${user.userDetails.age}</td>
                    <td>${user.userDetails.post}</td>
                    <td>
                        <form action="${pageContext.request.contextPath}/office" method="post">
                            <input type="hidden" name="userId" value="${user.id}"/>
                            <input type="hidden" name="action" value="delete"/>
                            <button class="btn btn-warning" type="submit">Удалить</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>


        <a class="me-3 py-2  text-decoration-none text-center" style="color: #f6f8fa" href="/office/add-user">Добавить
            пользователя</a><br>
    </sec:authorize>
    <a class="me-3 py-2  text-decoration-none text-center" style="color: #f6f8fa" href="/">Главная</a>


</div>
</body>
</html>