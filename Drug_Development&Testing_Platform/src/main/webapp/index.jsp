<%--<%@ page import="com.WPF.domain.User" %>
<%@ page import="com.WPF.domain.Enterprise" %>--%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
    /*Enterprise enterprise = (Enterprise) request.getSession().getAttribute("enterprise");*/
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
                <div id="index">
                    <span>庵东镇药物研发试测平台</span>
                </div>
                <div id="btn-1" class="btn">
                    <span onclick="window.location.href='./Chemical_reagent.jsp'">化学药物(制剂)</span>
                </div>
                <div id="btn-2" class="btn">
                    <span onclick="window.location.href='./Biological_products.jsp'">生物制品</span>
                </div>
                <div id="btn-3" class="btn">
                    <span onclick="window.location.href='./New_vaccine.jsp'">新型疫苗</span>
                </div>
                <div id="btn-4" class="btn">
                    <span onclick="window.location.href='./Targeted_drugs.jsp'">靶向药物</span>
                </div>
                <div id="btn-5" class="btn">
                    <span onclick="window.location.href='./Chronic_disease.jsp'">慢性病防止药物</span>
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
                methods: {},
                created: function () {

                }
            })
        </script>
    </body>
</html>