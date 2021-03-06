<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
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
        <link rel="stylesheet" type="text/css" href="u_css/firstform.css"/>
        <link rel="stylesheet" type="text/css" href="lib-master/theme-chalk/index.css"/>
        <script src="js/jquery-3.6.0.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="lib-master/index.js" type="text/javascript" charset="utf-8"></script>
        <link rel="icon" href="./img/logo.png"/>
        <script type="text/javascript">
            function submit() {
                $.ajax({
                    url: 'user/firstForm',
                    dataType: "text",
                    contentType: 'application/json;charset=UTF-8',
                    /* data: {'user': JSON.stringify(this.app.user)},*/
                    data: {'user': this.app.user},
                    success: function (resp) {
                        alert(resp);
                        window.location.href = "./Information.jsp";
                    },
                    error: function (resp) {
                        alert("error");
                    }
                });
            }
        </script>
    </head>
    <body>
        <div id="app">
            <div id="header">
                <nav class="navbar navbar-default" id="header-nav1">
                    <div class="container-fluid">
                        <img src="./img/logo.png" style="height: 50px;float: left;margin-right: 20px;">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="index.jsp">??????</a>
                        </div>
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <p class="navbar-text">???????????????????????????</p>
                            <ul class="nav navbar-nav navbar-right">
                                <li><a style="color: #0066CC;">?????????????????????????????????</a></li>
                                <li><a href="#">????????????</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="form">
                <el-form ref="form" :model="user" label-width="120px" label-position="left" :rules="rules">
                    <el-form-item label="??????????????????" prop="user_name">
                        <el-input v-model="user.user_name"></el-input>
                    </el-form-item>
                    <el-form-item label="????????????" prop="user_age">
                        <el-input v-model="user.user_age"></el-input>
                    </el-form-item>
                    <el-form-item label="????????????" prop="user_sex">
                        <el-radio-group v-model="user.user_sex">
                            <el-radio label="???"></el-radio>
                            <el-radio label="???"></el-radio>
                        </el-radio-group>
                    </el-form-item>
                    <el-form-item label="???????????????" prop="birthday">
                        <el-date-picker v-model="user.birthday" type="date" value-format="yyyy-MM-dd"
                                        placeholder="????????????">
                        </el-date-picker>
                    </el-form-item>
                    <el-form-item label="?????????????????????" prop="document_type">
                        <el-select v-model="user.document_type" placeholder="?????????????????????">
                            <el-option label="?????????????????????" value="1"></el-option>
                            <el-option label="??????????????????????????????" value="2"></el-option>
                            <el-option label="????????????????????????" value="3"></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="?????????" prop="identification_number">
                        <el-input v-model="user.identification_number"></el-input>
                    </el-form-item>
                    <el-form-item label="????????????" prop="phone_number">
                        <el-input v-model="user.phone_number"></el-input>
                    </el-form-item>
                    <el-form-item prop="email" label="??????" :rules="[
					      { required: true, message: '?????????????????????', trigger: 'blur' },
					      { type: 'email', message: '??????????????????????????????', trigger: ['blur', 'change'] }
					    ]">
                        <el-input v-model="user.email"></el-input>
                    </el-form-item>
                    <el-form-item label="????????????" prop="address">
                        <el-input type="textarea" v-model="user.address"></el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="submitForm('form')">??????</el-button>
                        <el-button @click="resetForm('form')">??????</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </div>
    </body>
    <script type="text/javascript">
        var app = new Vue({
            el: '#app',
            data() {
                return {
                    user: {
                        user_name: '',
                        user_age: '',
                        user_sex: '',
                        birthday: '',
                        document_type: '',
                        identification_number: '',
                        phone_number: '',
                        email: '',
                        address: '',
                    },
                    rules: {
                        user_name: [{
                            required: true,
                            message: '?????????????????????',
                            trigger: 'blur'
                        },],
                        user_age: [{
                            required: true,
                            message: '???????????????',
                            trigger: 'blur'
                        },
                            {
                                min: 1,
                                max: 3,
                                message: '????????????0-100',
                                trigger: 'blur'
                            }
                        ],
                        user_sex: [{
                            required: true,
                            message: '???????????????',
                            trigger: 'change'
                        }],
                        birthday: [{
                            required: true,
                            message: '???????????????',
                            trigger: 'change'
                        }],
                        document_type: [{
                            required: true,
                            message: '?????????????????????',
                            trigger: 'change'
                        }],
                        identification_number: [{
                            required: true,
                            message: '??????????????????',
                            trigger: 'change'
                        }],
                        phone_number: [{
                            required: true,
                            message: '?????????????????????',
                            trigger: 'change'
                        }],
                        address: [{
                            required: true,
                            message: '?????????????????????',
                            trigger: 'change'
                        }],
                    }
                }
            },
            methods: {
                submitForm(formName) {
                    this.$refs[formName].validate((valid) => {
                        if (valid) {
                            console.log(this.user.valueOf());
                            submit();
                        } else {
                            console.log(this.user.valueOf());
                            submit();
                            return false;
                        }
                    });
                },
                resetForm(formName) {
                    this.$refs[formName].resetFields();
                }
            }
        })
    </script>
</html>

