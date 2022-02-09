<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

    <head>
        <base href="<%=basePath%>">
        <title>庵东镇药物研发试测平台账号登录</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="u_css/loginstyle.css" type="text/css" media="all"/>
        <link rel="icon" href="./img/logo.png"/>
    </head>

    <body>
        <!-- login form -->
        <section class="w3l-login">
            <div class="overlay">
                <div class="wrapper">
                    <div class="logo">
                        <a class="brand-logo" href="index.jsp">庵东镇药物研发试测平台账号登录</a>
                    </div>
                    <div class="form-section">
                        <h3>登录</h3>
                        <h6>欢迎使用该系统</h6>
                        <form action="login" method="post" class="signin-form">
                            <div class="form-input">
                                <input type="text" name="user_id" placeholder="用户名" required="" autofocus>
                            </div>
                            <div class="form-input">
                                <input type="password" name="password" placeholder="密码" required="">
                            </div>
                            <button type="submit" class="btn btn-primary theme-button mt-4">登录</button>
                            <button type="button" onclick="window.location.href = './Resign.jsp'" class="btn btn-primary theme-button mt-4">注册</button>
                        </form>
                    </div>
                </div>
            </div>
            <div id='stars'></div>
            <div id='stars2'></div>
            <div id='stars3'></div>

            <!-- copyright -->
            <div class="copy-right">
                <p>&copy; 2022 毕业设计 | Design by 201805020527王潘锋</p>
            </div>
            <!-- //copyright -->
        </section>

        <!-- /login form -->
    </body>

</html>
