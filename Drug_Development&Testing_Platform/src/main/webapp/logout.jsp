<%--
  Created by IntelliJ IDEA.
  User: jiou_
  Date: 2021/5/4
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <%
            session.removeAttribute("user");
			session.removeAttribute("enterprise");
			session.removeAttribute("researcher");
            response.setHeader("refresh", "0.1;url=./index.jsp");
        %>
    </body>
</html>
