<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>管理员模块</title>
        <base href="<%=basePath%>">
        <meta charset="utf-8">
        <script src="js/vue.min.js" type="text/javascript" charset="utf-8"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="lib-master/theme-chalk/index.css"/>
        <link rel="stylesheet" type="text/css" href="u_css/footer.css"/>
        <link rel="stylesheet" type="text/css" href="u_css/Admin.css"/>
        <script src="js/jquery-3.6.0.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="lib-master/index.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript">

        </script>
    </head>
    <body>
        <div id="app">
            <el-container>
                <el-header>Header</el-header>
                <el-container>
                    <el-aside style="width: 250px">
                        <el-row class="tac">
                            <el-col>
                                <el-menu
                                        default-active="2"
                                        class="el-menu-vertical-demo"
                                        @open="handleOpen"
                                        @close="handleClose">
                                    <el-submenu index="1">
                                        <template slot="title">
                                            <i class="el-icon-location"></i>
                                            <span>导航一</span>
                                        </template>
                                        <el-menu-item-group>
                                            <template slot="title">分组一</template>
                                            <el-menu-item index="1-1">选项1</el-menu-item>
                                            <el-menu-item index="1-2">选项2</el-menu-item>
                                        </el-menu-item-group>
                                        <el-menu-item-group title="分组2">
                                            <el-menu-item index="1-3">选项3</el-menu-item>
                                        </el-menu-item-group>
                                        <el-submenu index="1-4">
                                            <template slot="title">选项4</template>
                                            <el-menu-item index="1-4-1">选项1</el-menu-item>
                                        </el-submenu>
                                    </el-submenu>
                                    <el-menu-item index="2">
                                        <i class="el-icon-menu"></i>
                                        <span slot="title">导航二</span>
                                    </el-menu-item>
                                    <el-menu-item index="3" disabled>
                                        <i class="el-icon-document"></i>
                                        <span slot="title">导航三</span>
                                    </el-menu-item>
                                    <el-menu-item index="4">
                                        <i class="el-icon-setting"></i>
                                        <span slot="title">导航四</span>
                                    </el-menu-item>
                                </el-menu>
                            </el-col>
                        </el-row>
                    </el-aside>
                    <el-container>
                        <el-main>

                            <template>
                                <el-tabs v-model="activeName" @tab-click="handleClick">
                                    <el-tab-pane label="用户管理" name="first">用户管理</el-tab-pane>
                                    <el-tab-pane label="配置管理" name="second">配置管理</el-tab-pane>
                                    <el-tab-pane label="角色管理" name="third">角色管理</el-tab-pane>
                                    <el-tab-pane label="定时任务补偿" name="fourth">定时任务补偿</el-tab-pane>
                                </el-tabs>
                            </template>
                            main
                        </el-main>
                        <el-footer>
                            &copy; 2022 毕业设计 | Design by 201805020527王潘锋
                        </el-footer>
                    </el-container>
                </el-container>
            </el-container>
            <div class="clear"></div>

        </div>
        <script type="text/javascript">
        </script>
        <script type="text/javascript">
            var app = new Vue({
                el: '#app',
                data() {
                    return {
                        activeName: 'second',
                    };
                },
                methods: {
                    handleOpen(key, keyPath) {
                        console.log(key, keyPath);
                    },
                    handleClose(key, keyPath) {
                        console.log(key, keyPath);
                    },
                    handleClick(tab, event) {
                        console.log(tab, event);
                    },
                },
                created: function () {

                }
            })
        </script>
    </body>
</html>
