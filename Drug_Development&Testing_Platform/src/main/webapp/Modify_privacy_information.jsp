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
                    url: 'user/updateModifyPrivacyInformation',
                    dataType: "json",
                    contentType: 'application/json;charset=UTF-8',
                    data: {'user': JSON.stringify(this.app.user)},
                    /*data: {'user': this.app.user},*/
                    success: function (resp) {
                        alert(resp.valueOf());
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
        <div id="app" style="margin-right: auto;margin-left: auto;width: 500px;">
            <el-form :label-position="labelPosition" label-width="80px" :model="user" ref="user">
                <el-form-item label="用户真实姓名" prop="user_name">
                    <el-input v-model="user.user_name"></el-input>
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
                            user_name: '',
                            document_type: '',
                            identification_number: '',
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
