<%@ page import="com.WPF.domain.Enterprise" %>
<%@ page import="com.WPF.domain.UserGrade" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
    Enterprise enterprise = (Enterprise) session.getAttribute("enterprise");
    UserGrade userGrade = (UserGrade) session.getAttribute("userGrade");

%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>公司管理员模块</title>
        <base href="<%=basePath%>">
        <meta charset="utf-8">
        <script src="js/vue.min.js" type="text/javascript" charset="utf-8"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="lib-master/theme-chalk/index.css"/>
        <link rel="stylesheet" type="text/css" href="u_css/footer.css"/>
        <link rel="stylesheet" type="text/css" href="u_css/Enterprise.css"/>
        <script src="js/jquery-3.6.0.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="lib-master/index.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript">
            function addEnterprise() {
                $.ajax({
                    url: "Admin/addResearcher",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"addResearcher": JSON.stringify(this.app.addResearcher)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Enterprise.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function getEnterpriseList() {
                $.ajax({
                    url: "Admin/getResearcherList",
                    contentType: 'application/json;charset=UTF-8',
                    success: function (reps) {
                        console.log(reps)
                        app.researcherList = reps;
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function deleteEnterprise(e_id) {
                $.ajax({
                    url: "Admin/deleteEnterprise",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"e_id": JSON.stringify(e_id)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Admin.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function updateEnterprise() {
                $.ajax({
                    url: "Admin/updateEnterprise",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"updateEnterprise": JSON.stringify(this.app.updateEnterprise)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Admin.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }
        </script>
    </head>
    <body>
        <div class="param" id="e_id">${enterprise.e_id}</div>
        <div id="app">
            <el-container>
                <el-header>
                    <div id="header" onclick="window.location.href = './index.jsp'">庵东镇药物研发试测平台</div>
                    <div id="btn-6" class="btn-s">
                        <span onclick="window.location.href = './logout.jsp'">登出</span>
                    </div>
                </el-header>
                <el-container>
                    <el-aside style="width: 250px">
                        <el-row class="tac">
                            <el-col>
                                <el-menu
                                        default-active="1"
                                        class="el-menu-vertical-demo"
                                        @open="handleOpen"
                                        @close="handleClose"
                                        @select="select">
                                    <el-menu-item index="1">
                                        <i class="el-icon-menu"></i>
                                        <span slot="title">研究员管理</span>
                                    </el-menu-item>
                                    <el-menu-item index="2">
                                        <i class="el-icon-document"></i>
                                        <span slot="title">药物申请管理</span>
                                    </el-menu-item>
                                    <el-menu-item index="3">
                                        <i class="el-icon-setting"></i>
                                        <span slot="title">志愿者分配管理</span>
                                    </el-menu-item>
                                    <el-menu-item index="4">
                                        <i class="el-icon-setting"></i>
                                        <span slot="title">更新药物研发进度</span>
                                    </el-menu-item>
                                </el-menu>
                            </el-col>
                        </el-row>
                    </el-aside>
                    <el-container>
                        <el-main>
                            <div v-if="index==1">
                                <div id="addResearcher">
                                    <el-form ref="addResearcher" :model="addResearcher" label-width="100px">
                                        <el-row :gutter="30">
                                            <el-col :span="5">
                                                <div class="grid-content bg-purple">
                                                    <el-form-item label="员工编号:">
                                                        <el-input v-model="addResearcher.e_id"></el-input>
                                                    </el-form-item>
                                                </div>
                                            </el-col>
                                            <el-col :span="5">
                                                <div class="grid-content bg-purple">
                                                    <el-form-item label="员工姓名:">
                                                        <el-input v-model="addResearcher.e_name"></el-input>
                                                    </el-form-item>
                                                </div>
                                            </el-col>
                                            <el-col :span="5">
                                                <div class="grid-content bg-purple">
                                                    <el-form-item label="员工密码:">
                                                        <el-input v-model="addResearcher.e_password"></el-input>
                                                    </el-form-item>
                                                </div>
                                            </el-col>
                                            <el-col :span="5">
                                                <div class="grid-content bg-purple">
                                                    <el-form-item label="研究方向:">
                                                        <el-select v-model="addResearcher.ra_d_type" placeholder="请选择">
                                                            <el-option
                                                                    v-for="item in options"
                                                                    :key="item.value"
                                                                    :label="item.label"
                                                                    :value="item.value">
                                                            </el-option>
                                                        </el-select>
                                                    </el-form-item>
                                                </div>
                                            </el-col>
                                            <el-col :span="4">
                                                <div class="grid-content bg-purple">
                                                    <el-form-item>
                                                        <el-button type="primary" @click="onSubmit">立即创建</el-button>
                                                    </el-form-item>
                                                </div>
                                            </el-col>
                                        </el-row>
                                    </el-form>
                                </div>
                                <div id="researcherList">
                                    <el-table
                                            :data="researcherList"
                                            border
                                            style="width: 100%">
                                        <el-table-column
                                                fixed
                                                prop="e_id"
                                                label="公司编号"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="e_name"
                                                label="公司名称"
                                                width="300">
                                        </el-table-column>
                                        <el-table-column
                                                prop="e_password"
                                                label="公司密码"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="e_phone"
                                                label="公司电话"
                                                width="220">
                                        </el-table-column>
                                        <el-table-column
                                                prop="e_email"
                                                label="公司邮箱"
                                                width="300">
                                        </el-table-column>
                                        <el-table-column
                                                prop="e_address"
                                                label="公司地址"
                                                width="300">
                                        </el-table-column>
                                        <el-table-column
                                                label="操作"
                                                width="100">
                                            <template slot-scope="scope">
                                                <el-button @click="handleClick1(scope.row)" type="text" size="small">删除
                                                </el-button>
                                                <el-button @click="handleClick2(scope.row)" type="text" size="small">
                                                    编辑
                                                </el-button>
                                            </template>
                                        </el-table-column>
                                    </el-table>
                                    <el-drawer
                                            title="编辑信息"
                                            :visible.sync="drawer"
                                            :direction="direction">
                                        <div id="updateEnterprise">
                                            <el-form :label-position="labelPosition" label-width="100px"
                                                     :model="updateEnterprise">
                                                <el-form-item label="公司编号">
                                                    <el-input v-model="updateEnterprise.e_id" disabled></el-input>
                                                </el-form-item>
                                                <el-form-item label="公司名称">
                                                    <el-input v-model="updateEnterprise.e_name"></el-input>
                                                </el-form-item>
                                                <el-form-item label="公司密码">
                                                    <el-input v-model="updateEnterprise.e_password"></el-input>
                                                </el-form-item>
                                                <el-form-item label="公司电话">
                                                    <el-input v-model="updateEnterprise.e_phone"></el-input>
                                                </el-form-item>
                                                <el-form-item label="公司邮箱">
                                                    <el-input v-model="updateEnterprise.e_email"></el-input>
                                                </el-form-item>
                                                <el-form-item label="公司地址">
                                                    <el-input v-model="updateEnterprise.e_address"></el-input>
                                                </el-form-item>
                                                <el-button type="primary" @click="updateEnterprise()">修改信息</el-button>
                                            </el-form>
                                        </div>
                                    </el-drawer>
                                </div>
                            </div>
                            <div v-if="index==3">

                            </div>
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
                        options: [{
                            value: '1',
                            label: '化学药物(制剂)'
                        }, {
                            value: '2',
                            label: '生物制品'
                        }, {
                            value: '3',
                            label: '新型疫苗'
                        }, {
                            value: '4',
                            label: '靶向药物'
                        }, {
                            value: '5',
                            label: '慢性病防止药物'
                        }],
                        value: '',
                        direction: 'rtl',
                        drawer: false,
                        activeName: 'second',
                        index: '1',
                        labelPosition: 'left',
                        recruitList: {
                            rl_title: '',
                            rl_user_name: '',
                            rl_user_sex: '',

                        },
                        addResearcher: {
                            ra_id: '',
                            ra_name: '',
                            ra_password: '',
                            ra_e_id: document.getElementById("e_id").textContent,
                            ra_d_type: '',

                        },
                        researcherList: [{
                            ra_id: '',
                            ra_name: '',
                            ra_password: '',
                            ra_e_id: '',
                            ra_d_type: '',
                        },],
                        updateEnterprise: {
                            e_id: '',
                            e_name: '',
                            e_password: '',
                            e_phone: '',
                            e_email: '',
                            e_address: ''
                        },
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
                    handleClick1(row) {
                        deleteEnterprise(row.e_id);
                    },
                    handleClick2(row) {
                        this.drawer = 'true';
                        this.updateEnterprise = row

                    },
                    select(index, indexPath) {
                        app.index = index;
                    },
                    onSubmit() {
                        addEnterprise();
                    },
                },
                created: function () {
                    /*getEnterpriseList();*/
                }
            })
        </script>
    </body>
</html>
