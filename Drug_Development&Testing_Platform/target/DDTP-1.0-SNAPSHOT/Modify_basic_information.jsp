<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <base href="<%=basePath%>">
        <meta charset="utf-8">
        <title>Modify basic information</title>
        <script src="js/vue.min.js" type="text/javascript" charset="utf-8"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="lib-master/theme-chalk/index.css"/>
        <script src="js/jquery-3.6.0.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="lib-master/index.js" type="text/javascript" charset="utf-8"></script>
        <link rel="icon" href="./img/logo.png"/>

        <script type="text/javascript">
            function submit() {
                $.ajax({
                    url: 'user/updateModifyBasicInformation.do',
                    dataType: "json",
                    contentType: 'application/json;charset=UTF-8',
                    data: {'user': JSON.stringify(this.app.user)},
                    /*data: {'user': this.app.user},*/
                    success: function (resp) {
                        alert(resp.valueOf());
                        window.location.href = "/FinalPractice/Personal_Center_information.jsp";
                    },
                    error: function (resp) {
                        alert("error");
                    }
                });
            }
        </script>
    </head>
    <body>
        <div id="app" style="margin-right: auto;margin-left: auto;width: 500px;">
            <el-form :label-position="labelPosition" label-width="80px" :model="user" ref="user">
                <el-form-item label="用户名" prop="user_id">
                    <el-input v-model="user.user_id"></el-input>
                </el-form-item>
                <el-form-item label="年龄" prop="user_age">
                    <el-input v-model="user.user_age"></el-input>
                </el-form-item>
                <el-form-item label="用户性别" prop="user_sex">
                    <el-radio-group v-model="user.user_sex">
                        <el-radio label="0">男</el-radio>
                        <el-radio label="1">女</el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item label="出生年月日" prop="birthday">
                    <el-date-picker v-model="user.birthday" type="date" value-format="yyyy-MM-dd"
                                    placeholder="选择日期">
                    </el-date-picker>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="submitForm('user')">修改</el-button>
                    <el-button @click="resetForm('user')">重置</el-button>
                </el-form-item>
            </el-form>
        </div>

        <script type="text/javascript">
            var app = new Vue({
                el: '#app',
                data() {
                    return {
                        labelPosition: 'top',
                        user: {
                            user_id: '',
                            user_age: '',
                            user_sex: '',
                            birthday: '',
                        }
                    };
                },
                methods: {
                    submitForm(formName) {
                        this.$refs[formName].validate((valid) => {
                            if (valid) {
                                console.log(this.user.valueOf());
                                submit();
                            } else {
                                return false;
                            }
                        });
                    },
                    resetForm(formName) {
                        this.$refs[formName].resetFields();
                    }
                },
            })
        </script>
    </body>
</html>
