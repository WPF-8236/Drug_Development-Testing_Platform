<%@ page import="com.WPF.domain.UserGrade" %>
<%@ page import="com.WPF.domain.User" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
    User user = (User) session.getAttribute("user");
    UserGrade userGrade = (UserGrade) session.getAttribute("userGrade");
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
        <link rel="stylesheet" type="text/css" href="u_css/PC.css"/>
        <script src="js/jquery-3.6.0.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="lib-master/index.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript">

        </script>
    </head>
    <body>
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
                                        @select="selectMue"
                                >
                                    <el-menu-item index="1">
                                        <i class="el-icon-menu"></i>
                                        <span slot="title">个人信息</span>
                                    </el-menu-item>
                                    <el-menu-item index="2">
                                        <i class="el-icon-document"></i>
                                        <span slot="title">志愿者资格申请</span>
                                    </el-menu-item>
                                    <el-menu-item index="3">
                                        <i class="el-icon-document"></i>
                                        <span slot="title">志愿者药物试测资格申请</span>
                                    </el-menu-item>
                                    <el-menu-item index="4">
                                        <i class="el-icon-document"></i>
                                        <span slot="title">志愿者身体报告查看</span>
                                    </el-menu-item>
                                    <el-menu-item index="5">
                                        <i class="el-icon-setting"></i>
                                        <span slot="title">志愿者身体情况反馈</span>
                                    </el-menu-item>
                                    <el-menu-item index="6">
                                        <i class="el-icon-setting"></i>
                                        <span slot="title">受试药物报告管理</span>
                                    </el-menu-item>
                                </el-menu>
                            </el-col>
                        </el-row>
                    </el-aside>
                    <el-container>
                        <el-main>
                            <div id="body-information" v-if="selectid==1">
                                <div id="body-information-header">
                                    <%
                                        if (user.getImg() == null) {
                                    %>
                                    <el-button type="text" @click="dialogFormVisible = true">
                                        <img src="./img/logo.png" class="img-circle">
                                    </el-button>
                                    <el-dialog title="上传头像" :visible.sync="dialogFormVisible">
                                        <form action="user/fileupload" method="post" enctype="multipart/form-data">
                                            选择文件：<input type="file" name="upload"><br>
                                            <input type="submit" value="上传">
                                        </form>
                                    </el-dialog>
                                    <%
                                    } else {
                                    %>
                                    <el-button type="text" @click="dialogFormVisible = true">
                                        <img src=${sessionScope.user.img} class="img-circle">
                                    </el-button>
                                    <el-dialog title="上传头像" :visible.sync="dialogFormVisible">
                                        <form action="user/fileupload" method="post" enctype="multipart/form-data">
                                            选择文件：<input type="file" name="upload"><br>
                                            <input type="submit" value="上传">
                                        </form>
                                    </el-dialog>
                                    <%
                                        }
                                    %>
                                </div>
                                <el-divider style="color: #0000FF;">
                                    <p class="navbar-text">个人中心</p>
                                </el-divider>
                                <div id="body-information-body">
                                    <el-collapse id="el" v-model="activeNames">
                                        <el-collapse-item id="el-1" title="基本信息 Essential-Information" name="1">
                                            <el-row :gutter="20">
                                                <el-col :span="6">
                                                    <div>
                                                        <span class="span-text">用户名：</span>
                                                        <span class="span-text-result">
                                                            ${sessionScope.user.user_id}
                                                        </span>
                                                    </div>
                                                </el-col>
                                                <el-col :span="6">
                                                    <span class="span-text">年龄：</span>
                                                    <span class="span-text-result">
                                                        ${sessionScope.user.user_age}
                                                    </span>
                                                </el-col>
                                                <el-col :span="6">
                                                    <span class="span-text">性别：</span>
                                                    <span class="span-text-result">
                                            <%
                                                int i = user.getUser_sex();
                                                if (i == 0) {
                                            %>
                                            男
                                            <%
                                            } else {
                                            %>
                                            女
                                            <%
                                                }
                                            %>
										</span>
                                                </el-col>
                                                <el-col :span="6">
                                                    <span class="span-text">生日：</span>
                                                    <span class="span-text-result">
                                                        ${sessionScope.user.birthday}
                                                    </span>
                                                </el-col>
                                            </el-row>
                                            <div style="margin-top: 50px;">
                                                <el-divider></el-divider>
                                            </div>
                                        </el-collapse-item>
                                        <el-collapse-item id="el-2" title="详细信息 Detailed-Information" name="2">
                                            <el-row :gutter="20">
                                                <el-col :span="5">
                                                    <div>
                                                        <el-tooltip class="item" effect="dark"
                                                                    content=${sessionScope.user.password}
                                                                            placement="top-start">
                                                            <span class="span-text">密码：</span>
                                                        </el-tooltip>
                                                        <span class="span-text-result">
                                                <el-popover placement="right" width="400" trigger="click">
                                                    <el-form :model="passwordForm" status-icon :rules="passwordRules"
                                                             ref="passwordForm"
                                                             label-width="100px" class="demo-ruleForm">
                                                        <el-form-item label="密码" prop="pass">
                                                            <el-input type="password" v-model="passwordForm.pass"
                                                                      autocomplete="off"></el-input>
                                                        </el-form-item>
                                                        <el-form-item label="确认密码" prop="checkPass">
                                                            <el-input type="password" v-model="passwordForm.checkPass"
                                                                      autocomplete="off"></el-input>
                                                        </el-form-item>
                                                        <el-form-item>
                                                            <el-button type="primary"
                                                                       @click="submitForm('passwordForm')">提交</el-button>
                                                            <el-button @click="resetForm('passwordForm')">重置</el-button>
                                                        </el-form-item>
                                                    </el-form>
                                                    <el-button slot="reference" type="success">修改密码</el-button>
                                                </el-popover>
											</span>
                                                    </div>
                                                </el-col>
                                                <el-col :span="6">
                                                    <span class="span-text">手机号：</span>
                                                    <span class="span-text-result">
                                                        ${sessionScope.user.phone_number}
                                                    </span>
                                                </el-col>
                                                <el-col :span="8">
                                                    <span class="span-text">邮箱：</span>
                                                    <span class="span-text-result">
                                                        ${sessionScope.user.email}
                                                    </span>
                                                </el-col>
                                                <el-col :span="5">
                                                    <el-tooltip class="item" effect="dark"
                                                                content=${sessionScope.user.address}
                                                                        placement="top-start">
                                                        <span class="span-text">地址：</span>
                                                    </el-tooltip>
                                                    <span class="span-text-result">
											<el-popover placement="right" width="400" trigger="click">
                                                    <el-form :model="addressForm" :rules="addressRules"
                                                             ref="addressForm" label-width="100px"
                                                             class="demo-ruleForm">
                                                        <el-form-item label="地址" prop="address">
                                                            <el-input type="textarea"
                                                                      v-model="addressForm.address"></el-input>
                                                        </el-form-item>
                                                        <el-form-item>
                                                            <el-button type="primary"
                                                                       @click="submitAddress('addressForm')">修改</el-button>
                                                            <el-button @click="resetForm('addressForm')">重置</el-button>
                                                        </el-form-item>
                                                    </el-form>
                                                    <el-button slot="reference" type="success">修改地址</el-button>
                                                </el-popover>
										</span>
                                                </el-col>
                                            </el-row>
                                            <div style="margin-top: 50px;">
                                                <el-divider></el-divider>
                                            </div>
                                        </el-collapse-item>
                                        <el-collapse-item id="el-3" title="隐私信息 Privacy-Information" name="3">
                                            <el-row :gutter="20">
                                                <el-col :span="5">
                                                    <div>
                                                        <span class="span-text">真实姓名：</span>
                                                        <span class="span-text-result">
                                                            ${sessionScope.user.user_name}
                                                        </span>
                                                    </div>
                                                </el-col>
                                                <el-col :span="10">
                                                    <span class="span-text">证件类型：</span>
                                                    <span class="span-text-result">
											<%
                                                i = user.getDocument_type();
                                                if (i == 1) {
                                            %>
                                            中国居民身份证
                                            <%
                                            } else if (i == 2) {
                                            %>
                                            外国人永久居留身份证
                                             <%
                                             } else {
                                             %>
                                            港澳台居民居住证
                                            <%
                                                }
                                            %>
										</span>
                                                </el-col>
                                                <el-col :span="8">
                                                    <span class="span-text">证件号：</span>
                                                    <span class="span-text-result">
                                                        ${sessionScope.user.identification_number}
                                                    </span>
                                                </el-col>
                                            </el-row>
                                            <div style="margin-top: 50px;">
                                                <el-divider></el-divider>
                                            </div>
                                        </el-collapse-item>
                                        <el-collapse-item id="el-4" title="管理信息 Management-Information" name="4">
                                            <center>
                                                <el-row :gutter="20">
                                                    <el-col :span="8">
                                                        <a href="Modify_basic_information.jsp">
                                                            <el-button type="danger">修改基本信息
                                                            </el-button>
                                                        </a>
                                                    </el-col>
                                                    <el-col :span="8">
                                                        <a href="Modify_detailed_information.jsp">
                                                            <el-button type="danger">修改详细信息
                                                            </el-button>
                                                        </a>
                                                    </el-col>
                                                    <el-col :span="8">
                                                        <a href="Modify_privacy_information.jsp">
                                                            <el-button type="danger">修改隐私信息
                                                            </el-button>
                                                        </a>
                                                    </el-col>
                                                </el-row>
                                            </center>
                                            <div style="margin-top: 50px;">
                                                <el-divider>
                                                    <el-button type="danger" icon="el-icon-warning" circle></el-button>
                                                </el-divider>
                                            </div>
                                        </el-collapse-item>
                                    </el-collapse>
                                </div>
                            </div>
                            <div v-if="selectid==2">
                                志愿者申请
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
            function submit() {
                $.ajax({
                    url: 'user/updatePassword',
                    dataType: "text",
                    contentType: 'application/json;charset=UTF-8',
                    /* data: {'user': JSON.stringify(this.app.user)},*/
                    data: {'pass': this.app.passwordForm.pass},
                    success: function (resp) {
                        alert(resp);
                        window.location.href = "./Login.jsp";
                    },
                    error: function () {
                        alert("error");
                    }
                });
            }

            function submitAddress() {
                $.ajax({
                    url: 'user/updateAddress',
                    dataType: "text",
                    contentType: 'application/json;charset=UTF-8',
                    /* data: {'user': JSON.stringify(this.app.user)},*/
                    data: {'address': this.app.addressForm.address},
                    success: function (resp) {
                        alert(resp);
                    },
                    error: function () {
                        alert("error");
                    }
                });
            }
        </script>
        <script type="text/javascript">
            var app = new Vue({
                el: '#app',
                data() {
                    var validatePass = (rule, value, callback) => {
                        if (value === '') {
                            callback(new Error('请输入密码'));
                        } else {
                            if (this.passwordForm.checkPass !== '') {
                                this.$refs.passwordForm.validateField('checkPass');
                            }
                            callback();
                        }
                    };
                    var validatePass2 = (rule, value, callback) => {
                        if (value === '') {
                            callback(new Error('请再次输入密码'));
                        } else if (value !== this.passwordForm.pass) {
                            callback(new Error('两次输入密码不一致!'));
                        } else {
                            callback();
                        }
                    };
                    return {
                        selectid: '1',
                        dialogFormVisible: false,
                        activeNames: ['1', '2', '3', '4'],
                        passwordForm: {
                            pass: '',
                            checkPass: '',

                        },
                        passwordRules: {
                            pass: [
                                {validator: validatePass, trigger: 'blur'}
                            ],
                            checkPass: [
                                {validator: validatePass2, trigger: 'blur'}
                            ],


                        },
                        addressForm: {
                            address: '',
                        },
                        addressRules: {
                            address: [
                                {required: true, message: '请填写地址', trigger: 'blur'}
                            ]
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
                    selectMue(key, keyPath) {
                        console.log(key, keyPath);
                        this.selectid = key;
                    },
                    submitForm(formName) {
                        this.$refs[formName].validate((valid) => {
                            if (valid) {
                                submit();
                            } else {
                                return false;
                            }
                        });
                    },
                    submitAddress(formName) {
                        this.$refs[formName].validate((valid) => {
                            if (valid) {
                                submitAddress();
                            } else {
                                return false;
                            }
                        });
                    },
                    resetForm(formName) {
                        this.$refs[formName].resetFields();
                    }

                },
                created: function () {

                }
            })
        </script>
    </body>
</html>
