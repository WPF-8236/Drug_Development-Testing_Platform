<%--<%@ page import="com.WPF.domain.User" %>
<%@ page import="com.WPF.domain.Enterprise" %>--%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
    /*session.setAttribute("user", "1234");*/
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <base href="<%=basePath%>">
        <meta charset="utf-8">
        <script src="js/vue.min.js" type="text/javascript" charset="utf-8"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="lib-master/theme-chalk/index.css"/>
        <link rel="stylesheet" type="text/css" href="u_css/footer.css"/>
        <link rel="stylesheet" type="text/css" href="u_css/index.css"/>
        <script src="js/jquery-3.6.0.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="lib-master/index.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript">

        </script>
        <title>庵东镇药物研发试测平台</title>
    </head>
    <body>
        <div id="app">
            <div id="wallper">
                <%
                    if (session.getAttribute("user") == null) {
                %>
                <div id="btn-8" class="btn-s">
                    <span onclick="window.location.href = './Resign.jsp'">注册</span>
                </div>
                <div id="btn-6" class="btn-s">
                    <span onclick="window.location.href = './Login.jsp'">登录</span>
                </div>
                <%
                } else {
                %>
                <div id="btn-7" class="btn-s">
                    <span onclick="">你好，${user.user_name}</span>
                </div>
                <div id="btn-6" class="btn-s">
                    <span onclick="window.location.href = './logout.jsp'">登出</span>
                </div>
                <%
                    }
                %>
                <div id="index">
                    <span>庵东镇药物研发试测平台</span>
                </div>
                <div id="btn-1" class="btn">
                    <span onclick="app.isUser(1);">化学药物(制剂)</span>
                </div>
                <div id="btn-2" class="btn">
                    <span onclick="app.isUser(2);">生物制品</span>
                </div>
                <div id="btn-3" class="btn">
                    <span onclick="app.isUser(3);">新型疫苗</span>
                </div>
                <div id="btn-4" class="btn">
                    <span onclick="app.isUser(4);">靶向药物</span>
                </div>
                <div id="btn-5" class="btn">
                    <span onclick="app.isUser(5);">慢性病防止药物</span>
                </div>
            </div>

            <div class="clear"></div>

            <div id="footer">
                <div class="copy-right">
                    <p>&copy; 2022 毕业设计 | Design by 201805020527王潘锋</p>
                </div>
            </div>
        </div>
        <script type="text/javascript">
        </script>
        <script type="text/javascript">
            var app = new Vue({
                el: '#app',
                data() {
                    return {};
                },
                methods: {
                    isUser(id) {
                        <%
                       if (session.getAttribute("user") == null){
                           %>
                        alert("请登录");
                        window.location.href = './Login.jsp';
                        <%
                        }else {
                       %>
                        switch (id) {
                            case 1:
                                window.location.href = './Chemical_reagent.jsp';
                                break;
                            case 2:
                                window.location.href = './Biological_products.jsp';
                                break;
                            case 3:
                                window.location.href = './New_vaccine.jsp';
                                break;
                            case 4:
                                window.location.href = './Targeted_drugs.jsp';
                                break;
                            case 5:
                                window.location.href = './Chronic_disease.jsp';
                                break;
                        }
                        <%
                        }
                        %>
                    },
                },
                created: function () {

                }
            })
        </script>
    </body>
</html>