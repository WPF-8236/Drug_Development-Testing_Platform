<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <base href="<%=basePath%>">
        <meta charset="utf-8">
        <title>【潘锋酒店】酒店预订,酒店价格查询,宾馆住宿推荐,网上订酒店</title>
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
                            <a class="navbar-brand" href="index.jsp">首页</a>
                        </div>
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <p class="navbar-text">志愿者申请补充信息</p>
                            <ul class="nav navbar-nav navbar-right">
                                <li><a style="color: #0066CC;">你好，新用户请完善信息</a></li>
                                <li><a href="#">客服中心</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="form">
                <el-form ref="form" :model="user" label-width="120px" label-position="left" :rules="rules">
                    <el-form-item label="用户真实姓名" prop="user_name">
                        <el-input v-model="user.user_name"></el-input>
                    </el-form-item>
                    <el-form-item label="用户年龄" prop="user_age">
                        <el-input v-model="user.user_age"></el-input>
                    </el-form-item>
                    <el-form-item label="用户性别" prop="user_sex">
                        <el-radio-group v-model="user.user_sex">
                            <el-radio label="男"></el-radio>
                            <el-radio label="女"></el-radio>
                        </el-radio-group>
                    </el-form-item>
                    <el-form-item label="出生年月日" prop="birthday">
                        <el-date-picker v-model="user.birthday" type="date" value-format="yyyy-MM-dd"
                                        placeholder="选择日期">
                        </el-date-picker>
                    </el-form-item>
                    <el-form-item label="选择身份证类型" prop="document_type">
                        <el-select v-model="user.document_type" placeholder="选择身份证类型">
                            <el-option label="中国居民身份证" value="1"></el-option>
                            <el-option label="外国人永久居留身份证" value="2"></el-option>
                            <el-option label="港澳台居民居住证" value="3"></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="证件号" prop="identification_number">
                        <el-input v-model="user.identification_number"></el-input>
                    </el-form-item>
                    <el-form-item label="联系号码" prop="phone_number">
                        <el-input v-model="user.phone_number"></el-input>
                    </el-form-item>
                    <el-form-item prop="email" label="邮箱" :rules="[
					      { required: true, message: '请输入邮箱地址', trigger: 'blur' },
					      { type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change'] }
					    ]">
                        <el-input v-model="user.email"></el-input>
                    </el-form-item>
                    <el-form-item label="详细地址" prop="address">
                        <el-input type="textarea" v-model="user.address"></el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="submitForm('form')">注册</el-button>
                        <el-button @click="resetForm('form')">重置</el-button>
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
                            message: '请输入真实姓名',
                            trigger: 'blur'
                        },],
                        user_age: [{
                            required: true,
                            message: '请输入年龄',
                            trigger: 'blur'
                        },
                            {
                                min: 1,
                                max: 3,
                                message: '年龄区间0-100',
                                trigger: 'blur'
                            }
                        ],
                        user_sex: [{
                            required: true,
                            message: '请选择性别',
                            trigger: 'change'
                        }],
                        birthday: [{
                            required: true,
                            message: '请选择生日',
                            trigger: 'change'
                        }],
                        document_type: [{
                            required: true,
                            message: '选择身份证类型',
                            trigger: 'change'
                        }],
                        identification_number: [{
                            required: true,
                            message: '请输入证件号',
                            trigger: 'change'
                        }],
                        phone_number: [{
                            required: true,
                            message: '请输入联系号码',
                            trigger: 'change'
                        }],
                        address: [{
                            required: true,
                            message: '请输入详细地址',
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

