<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>化学药物（制剂）</title>
        <base href="<%=basePath%>">
        <meta charset="utf-8">
        <script src="js/vue.min.js" type="text/javascript" charset="utf-8"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="lib-master/theme-chalk/index.css"/>
        <link rel="stylesheet" type="text/css" href="u_css/footer.css"/>
        <link rel="stylesheet" type="text/css" href="u_css/message.css"/>
        <script src="u_js/date.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/jquery-3.6.0.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="lib-master/index.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript">
            function getMessage(m_mark) {
                console.log(m_mark);
                $.ajax({
                    url: "Message/getMessageBym_mark",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {'m_mark': JSON.stringify(m_mark)},
                    success: function (reps) {
                        console.log(reps);
                        app.messages = reps;
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }
        </script>
    </head>
    <body>
        <div id="app">
            <el-container>
                <el-header>
                    <div id="btn" class="btn">
                        <span>化学药物(制剂)</span>
                    </div>
                    <div id="header" onclick="window.location.href = './index.jsp'">庵东镇药物研发试测平台</div>
                    <div id="btn-7" class="btn-s">
                        <span onclick="">你好，${user.user_name}</span>
                    </div>
                    <div id="btn-6" class="btn-s">
                        <span onclick="window.location.href = './logout.jsp'">登出</span>
                    </div>
                </el-header>
                <el-main class="el-tabs">
                    <el-tabs type="border-card" @tab-click="messageClick">
                        <el-tab-pane label="药物公布">
                            <div id="messages">
                                <div v-for="message in messages" id="message">
                                    <div id="message-title">
                                        {{message.m_title}}
                                    </div>
                                    <div id="message-img">
                                        <img src="./img/药物1.jfif" height="100px">
                                    </div>
                                    <div id="message-1">
                                        <div id="message-summary">
                                            {{message.m_summary}}
                                        </div>
                                        <div id="message-type">
                                            {{message.m_type}}
                                        </div>
                                    </div>
                                    <div id="message-2">
                                        <div id="message-time">
                                            <span>时间：</span>
                                            {{message.m_time | dateFilter}}
                                        </div>
                                        <div class="clear"></div>
                                        <div id="message-read">
                                            <span>阅读数：</span>
                                            {{message.m_read}}
                                        </div>
                                        <div class="clear"></div>
                                        <div id="message-author">
                                            <span>作者：</span>
                                            {{message.m_author}}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </el-tab-pane>
                        <el-tab-pane label="药物查询">
                            <div style="margin-top: 15px;" id="d_find">
                                <el-input placeholder="请输入内容" v-model="input3" class="input-with-select">
                                    <el-select v-model="select" slot="prepend" placeholder="请选择">
                                        <el-option label="商品名" value="1"></el-option>
                                        <el-option label="通用名" value="2"></el-option>
                                        <el-option label="批准号" value="3"></el-option>
                                    </el-select>
                                    <el-button slot="append" icon="el-icon-search"></el-button>
                                </el-input>
                            </div>

                        </el-tab-pane>
                        <el-tab-pane label="药物对比">角色管理</el-tab-pane>
                        <el-tab-pane label="药物科普">定时任务补偿</el-tab-pane>
                        <el-tab-pane label="药物调查">定时任务补偿</el-tab-pane>
                        <el-backtop target=".el-tabs" bottom="100" style="background-color: #f2f5f6;
        box-shadow: 0 0 6px rgba(0,0,0, .12);"></el-backtop>
                    </el-tabs>
                </el-main>
                <el-footer> &copy; 2022 毕业设计 | Design by 201805020527王潘锋</el-footer>
            </el-container>
        </div>
        <script type="text/javascript">
            var app = new Vue({
                el: '#app',
                data() {
                    return {
                        messages: [],
                        input3: '',
                        select: '',
                    };
                },
                filters: {
                    dateFilter(value) {
                        var date = new Date(value);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
                        Y = date.getFullYear() + '-';
                        M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
                        D = date.getDate() + ' ';
                        h = date.getHours() + ':';
                        m = date.getMinutes() + ':';
                        s = date.getSeconds();
                        return Y + M + D + h + m + s;
                    },
                },
                methods: {
                    messageClick(tab, event) {
                        if (tab.index == 0)
                            getMessage(1);
                        console.log(tab, event);
                    },

                },
                created: function () {
                    getMessage(1);
                },
            })
        </script>
    </body>
</html>
