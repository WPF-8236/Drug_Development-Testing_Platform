<%@ page import="com.WPF.domain.User" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
    User user = (User) session.getAttribute("user");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>药物信息</title>
        <base href="<%=basePath%>">
        <meta charset="utf-8">
        <script src="js/vue.min.js" type="text/javascript" charset="utf-8"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="lib-master/theme-chalk/index.css"/>
        <link rel="stylesheet" type="text/css" href="u_css/footer.css"/>
        <link rel="stylesheet" type="text/css" href="u_css/volunteer.css"/>
        <link rel="stylesheet" type="text/css" href="u_css/page.css"/>
        <script src="u_js/date.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/jquery-3.6.0.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="lib-master/index.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript">
            function getRecruit() {
                $.ajax({
                    url: "recruit/getRecruit",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {},
                    success: function (reps) {
                        console.log(reps);
                        app.recruits = reps;
                        app.recruitsPage.total = app.recruits.length;
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function changeDrawer2() {
                app.drawer2 = 'true';
                app.recruitList.rl_title = app.recruit_detial.r_title;
                app.recruitList.rl_u_id = document.getElementById("user_id").textContent;
                app.recruitList.rl_user_name = document.getElementById("user_name").textContent;
                app.recruitList.rl_user_sex = document.getElementById("user_sex").textContent;
                app.recruitList.rl_user_phone = document.getElementById("phone_number").textContent;
                app.recruitList.rl_user_identification_number = document.getElementById("identification_number").textContent;
                app.recruitList.rl_address = document.getElementById("address").textContent;
            }

            function submitRecruitList() {
                $.ajax({
                    url: "recruit/submitRecruitList",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"recruitList": JSON.stringify(this.app.recruitList)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Volunteer.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }
        </script>
    </head>
    <body>
        <div class="param" id="user_name">${user.user_name}</div>
        <div class="param" id="user_id">${user.user_id}</div>
        <div class="param" id="user_sex">${user.user_sex}</div>
        <div class="param" id="phone_number">${user.phone_number}</div>
        <div class="param" id="address">${user.address}</div>
        <div class="param" id="identification_number">${user.identification_number}</div>
        <div id="app">
            <el-container>
                <el-header>
                    <div id="btn" class="btn">
                        <span>志愿者招募</span>
                    </div>
                    <div id="header" onclick="window.location.href = './index.jsp'">庵东镇药物研发试测平台</div>
                    <div id="btn-7" class="btn-s">
                        <span onclick="window.location.href = './Information.jsp'">你好，${user.user_name}</span>
                    </div>
                    <div id="btn-6" class="btn-s">
                        <span onclick="window.location.href = './logout.jsp'">登出</span>
                    </div>
                </el-header>
                <el-main class="el-tabs">
                    <el-tabs type="border-card">
                        <el-tab-pane label="健康志愿者招募">
                            <div class="contbox"
                                 v-for="recruit in recruits.slice((recruitsPage.currentPage-1)*recruitsPage.pageSize,recruitsPage.currentPage*recruitsPage.pageSize)"
                                 v-if="recruit.r_type==0">
                                <div class="contlist contlist1">
                                    <div class="list_more" @click="drawer = true;recruit_detial = recruit">查看详情</div>
                                    <div class="contlist_left"><h3><a>{{recruit.r_title}}</a></h3>
                                        <p>适应症<span>{{recruit.r_drag_attending}}</span> <span class="fenge">|&nbsp;&nbsp;</span>
                                            地点
                                            <span>{{recruit.r_institutes}}</span></p>
                                        <p>研究机构<span>{{recruit.r_institutes}}</span></p>
                                        <p>体检时间<span>{{recruit.r_time}}</span><span class="fenge">|&nbsp;&nbsp;</span>补偿<span>{{recruit.r_money}}</span>
                                        </p>
                                        <p>招募人数<span>{{recruit.r_number}}</span> <span
                                                class="fenge">|&nbsp;&nbsp;</span>试验阶段<span>{{recruit.r_stage}}期</span>
                                        </p></div>
                                    <div class="list_status">正在招募</div>
                                </div>
                            </div>
                        </el-tab-pane>
                        <el-tab-pane label="患者招募">
                            <div class="contbox"
                                 v-for="recruit in recruits.slice((recruitsPage.currentPage-1)*recruitsPage.pageSize,recruitsPage.currentPage*recruitsPage.pageSize)"
                                 v-if="recruit.r_type==1">
                                <div class="contlist contlist1">
                                    <div class="list_more" @click="drawer = true; recruit_detial = recruit">查看详情</div>
                                    <div class="contlist_left"><h3><a>{{recruit.r_title}}</a></h3>
                                        <p>适应症<span>{{recruit.r_drag_attending}}</span> <span class="fenge">|&nbsp;&nbsp;</span>
                                            地点
                                            <span>{{recruit.r_institutes}}</span></p>
                                        <p>研究机构<span>{{recruit.r_institutes}}</span></p>
                                        <p>体检时间<span>{{recruit.r_time}}</span><span class="fenge">|&nbsp;&nbsp;</span>补偿<span>{{recruit.r_money}}</span>
                                        </p>
                                        <p>招募人数<span>{{recruit.r_number}}</span> <span
                                                class="fenge">|&nbsp;&nbsp;</span>试验阶段<span>{{recruit.r_stage}}期</span>
                                        </p></div>
                                    <div class="list_status">正在招募</div>
                                </div>
                            </div>
                        </el-tab-pane>
                        <div class="block" style="margin-top:15px;">
                            <el-pagination
                                    @size-change="handleSizeChange1"
                                    @current-change="handleCurrentChange1"
                                    :current-page.sync="recruitsPage.currentPage"
                                    :page-sizes="[5, 10, 15, 20, 25]"
                                    :page-size="recruitsPage.pageSize"
                                    layout="total, sizes, prev, pager, next, jumper"
                                    :total="recruitsPage.total">
                            </el-pagination>
                            <el-drawer
                                    title="详细信息"
                                    :visible.sync="drawer"
                                    :direction="direction">
                            <span>
                                <div id="main">
				                    <div class="inner">
                                        <div id="project_head">
                                            <div class="qa qatitle">
                                                <header id="name">{{recruit_detial.r_title}}</header>
                                            </div>
                                            <div class="qa">
                                                <a id="medicineName"
                                                   class="headtag">药物名称:{{recruit_detial.r_drag_name}}</a>
                                                <a id="adaptiveSymptom" class="headtag">适应症:{{recruit_detial.r_drag_attending}}</a>
                                                <a id="researchIntituteCodes" class="headtag">研究机构:{{recruit_detial.r_institutes}}</a>
                                            </div>
                                            <div class="qa">
                                                <a id="sexRequirement" class="tag">性别要求:{{recruit_detial.r_sex | sexFilter}}</a>
                                                <a id="ageLimit" class="tag">年龄限制:{{recruit_detial.r_year}}</a>
                                                <a id="bmi" class="tag">体重指数:{{recruit_detial.r_bmi}}</a>
                                            </div>
                                            <div class="qa">
                                                <a id="priod" class="tag">试验分期:{{recruit_detial.r_stage}}期</a>
                                                <a id="type"
                                                   class="tag">受试者类型:{{recruit_detial.r_type | typeFilter}}</a>
                                            </div>
                                        </div>
                                        <div class="detail">
                                            {{recruit_detial.r_detial}}
                                        </div>
                                        <input id="onlinereg" type="button" value="在线报名" class="special"
                                               onclick="changeDrawer2()">
                                    </div>
                                </div>
                            </span>
                            </el-drawer>
                            <el-drawer
                                    title="在线报名"
                                    :visible.sync="drawer2"
                                    :direction="direction">
                                <div id="recruitList">
                                    <el-form :label-position="labelPosition" label-width="100px" :model="recruitList">
                                        <el-form-item label="报名项目">
                                            <el-input v-model="recruitList.rl_title" disabled></el-input>
                                        </el-form-item>
                                        <el-form-item label="姓名">
                                            <el-input v-model="recruitList.rl_user_name" disabled></el-input>
                                        </el-form-item>
                                        <el-form-item label="性别">
                                            <el-input v-if="recruitList.rl_user_sex" value="男" disabled></el-input>
                                            <el-input v-else value="女" disabled></el-input>
                                        </el-form-item>
                                        <el-form-item label="手机号">
                                            <el-input v-model="recruitList.rl_user_phone" disabled></el-input>
                                        </el-form-item>
                                        <el-form-item label="身份证">
                                            <el-input v-model="recruitList.rl_user_identification_number"
                                                      disabled></el-input>
                                        </el-form-item>
                                        <el-form-item label="身高（cm）">
                                            <el-input v-model="recruitList.rl_user_height"></el-input>
                                        </el-form-item>
                                        <el-form-item label="体重（kg）">
                                            <el-input v-model="recruitList.rl_user_weight"></el-input>
                                        </el-form-item>
                                        <el-form-item label="地址">
                                            <el-input v-model="recruitList.rl_address" disabled></el-input>
                                        </el-form-item>
                                        <el-form-item label="是否吸烟">
                                            <el-radio v-model="recruitList.rl_issmoke" label="1">是</el-radio>
                                            <el-radio v-model="recruitList.rl_issmoke" label="0">否</el-radio>
                                        </el-form-item>
                                        <el-form-item label="备注">
                                            <el-input type="textarea" :row="3" v-model="recruitList.rl_text"></el-input>
                                        </el-form-item>

                                        <el-button type="primary" @click="putRecruit">提交报名</el-button>
                                    </el-form>
                                </div>
                            </el-drawer>
                            <el-backtop target=".el-tabs" bottom="100" style="background-color: #f2f5f6;
        box-shadow: 0 0 6px rgba(0,0,0, .12);"></el-backtop>
                        </div>
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
                        recruitsPage: {
                            currentPage: 1,
                            total: '',
                            pageSize: 25,
                        },
                        labelPosition: 'left',
                        recruits: [],
                        drawer: false,
                        drawer2: false,
                        direction: 'rtl',
                        recruit_detial: {
                            r_title: '',
                        },
                        recruitList: {
                            rl_u_id: '',
                            rl_title: '',
                            rl_user_name: '',
                            rl_user_sex: '',
                            rl_user_phone: '',
                            rl_user_identification_number: '',
                            rl_user_height: '',
                            rl_user_weight: '',
                            rl_address: '',
                            rl_issmoke: '',
                            rl_text: '',
                        },

                    };
                },
                filters: {
                    sexFilter(value) {
                        if (value === 0)
                            return '男'
                        else if (value === 1)
                            return '女';
                        else
                            return '男女不限'
                    },
                    typeFilter(value) {
                        if (value === 0)
                            return '健康志愿者'
                        else
                            return '患者志愿者'
                    }
                },
                methods: {
                    handleSizeChange1(val) {
                        console.log(`每页 ${val} 条`);
                        this.recruitsPage.currentPage = 1;
                        this.recruitsPage.pageSize = val;
                    },
                    handleCurrentChange1(val) {
                        console.log(`当前页: ${val}`);
                        this.recruitsPage.currentPage = val;
                    },
                    putRecruit() {
                        submitRecruitList()
                    }
                },
                created: function () {
                    getRecruit()

                },
            })
        </script>
    </body>
</html>
