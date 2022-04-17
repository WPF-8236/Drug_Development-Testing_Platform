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
            function addResearcher() {
                console.log(this.app.addResearcher)
                $.ajax({
                    url: "enterprise/addResearcher",
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

            function getResearcherList() {
                $.ajax({
                    url: "enterprise/getResearcherList",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"ra_e_id": JSON.stringify(document.getElementById("e_id").textContent)},
                    success: function (reps) {
                        console.log(reps)
                        app.researcherList = reps;
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function getDragList() {
                $.ajax({
                    url: "enterprise/getDragList",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"e_id": JSON.stringify(document.getElementById("e_id").textContent)},
                    success: function (reps) {
                        console.log(reps)
                        app.DragList = reps;
                        app.DragListPage.total = app.DragList.length;
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }


            function deleteResearcher(ra_id) {
                $.ajax({
                    url: "enterprise/deleteResearcher",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"ra_id": JSON.stringify(ra_id)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Enterprise.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function deleteRrecruit(r_id) {
                $.ajax({
                    url: "enterprise/deleteRrecruit",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"r_id": JSON.stringify(r_id)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Enterprise.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function updateAResearcher() {
                console.log(this.app.updateResearcher)
                $.ajax({
                    url: "enterprise/updateResearcher",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"updateResearcher": JSON.stringify(this.app.updateResearcher)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Enterprise.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function changeDrawer() {
                app.drawer2 = true;
                app.Drag.d_e_id = document.getElementById("e_id").textContent;
            }

            function changeDrawer1() {
                app.drawer3 = true;
                app.Recruit.r_e_id = document.getElementById("e_id").textContent;
                app.Recruit.r_institutes = document.getElementById("e_name").textContent;
                app.Recruit.r_address = document.getElementById("e_address").textContent;
            }

            function changeDrawer2() {
                app.drawer6 = true;
                app.Message.m_author = document.getElementById("e_name").textContent;
            }

            function putADrag() {
                console.log(this.app.Drag)
                $.ajax({
                    url: "enterprise/addDrag",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"Drag": JSON.stringify(this.app.Drag)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Enterprise.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function putRecruit() {
                console.log(this.app.Recruit)
                $.ajax({
                    url: "enterprise/addRecruit",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"Recruit": JSON.stringify(this.app.Recruit)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Enterprise.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function updateARrecruit() {
                console.log(this.app.updateRrecruit)
                $.ajax({
                    url: "enterprise/updateARrecruit",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"updateRrecruit": JSON.stringify(this.app.updateRrecruit)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Enterprise.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function getRecruits() {
                $.ajax({
                    url: "enterprise/getRecruits",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"e_id": JSON.stringify(document.getElementById("e_id").textContent)},
                    success: function (reps) {
                        console.log(reps)
                        app.recruitList = reps;
                        app.recruitListPage.total = app.recruitList.length;
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function getVolunteers() {
                $.ajax({
                    url: "enterprise/getVolunteers",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"e_id": JSON.stringify(document.getElementById("e_id").textContent)},
                    success: function (reps) {
                        console.log(reps)
                        app.volunteers = reps;
                        app.VolunteerListPage.total = app.volunteers.length;
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function addURa() {
                $.ajax({
                    url: "enterprise/addURa",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"u_ra": JSON.stringify(this.app.u_ra)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Enterprise.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function getVolunteersByRaId(v_ra_id) {
                $.ajax({
                    url: "enterprise/getVolunteersByRaId",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"v_ra_id": JSON.stringify(v_ra_id)},
                    success: function (reps) {
                        console.log(reps)
                        app.volunteeer_ra = reps;
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function deleteVolunteer() {
                $.ajax({
                    url: "enterprise/deleteVolunteer",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"u_ra": JSON.stringify(this.app.deleteu_ra)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Enterprise.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function onSubmitProgress() {
                console.log(app.addProgress)
                $.ajax({
                    url: "enterprise/onSubmitProgress",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"addProgress": JSON.stringify(this.app.addProgress)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Enterprise.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function getProgressListByDId(dp_d_id) {
                $.ajax({
                    url: "enterprise/getProgressListByDId",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"dp_d_id": JSON.stringify(dp_d_id)},
                    success: function (reps) {
                        console.log(reps)
                        app.ProgressList = reps;
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function deleteProgressByDpId(dp_id) {
                $.ajax({
                    url: "enterprise/deleteProgressByDpId",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"dp_id": JSON.stringify(dp_id)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Enterprise.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function putProgress() {
                $.ajax({
                    url: "enterprise/changeProgress",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"changeProgress": JSON.stringify(this.app.changeProgress)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Enterprise.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function putMessage() {
                $.ajax({
                    url: "enterprise/addMessage",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {
                        "Message": JSON.stringify(this.app.Message),
                        "e_id": JSON.stringify(document.getElementById("e_id").textContent)
                    },
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Enterprise.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function getMessageList() {
                $.ajax({
                    url: "enterprise/getMessageList",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"e_id": JSON.stringify(document.getElementById("e_id").textContent)},
                    success: function (reps) {
                        console.log(reps)
                        app.MessageList = reps;
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function deleteMessageByMId(m_id) {
                $.ajax({
                    url: "enterprise/deleteMessageByMId",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {
                        "m_id": JSON.stringify(m_id),
                    },
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Enterprise.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function changeAMessage() {
                $.ajax({
                    url: "enterprise/changeAMessage",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"Message": JSON.stringify(this.app.changeMessage)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Enterprise.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function changeDrag() {
                $.ajax({
                    url: "enterprise/changeDrag",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"changeDrag": JSON.stringify(this.app.updateDrag)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Enterprise.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function deleteDragByDId(d_id) {
                $.ajax({
                    url: "enterprise/deleteDragByDId",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"d_id": JSON.stringify(d_id)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Enterprise.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function getPDF(c_id) {
                window.location.href = "jasper/exportPdf?c_id=" + c_id + "&type=pdf"
            }

            function getCRFList(d_id) {
                $.ajax({
                    url: "enterprise/getCRFListByDId",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"d_id": JSON.stringify(d_id)},
                    success: function (reps) {
                        console.log(reps)
                        app.CRFList = reps;
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
        <div class="param" id="e_name">${enterprise.e_name}</div>
        <div class="param" id="e_address">${enterprise.e_address}</div>
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
                                    <el-menu-item index="5">
                                        <i class="el-icon-setting"></i>
                                        <span slot="title">药物志愿者招募信息发布</span>
                                    </el-menu-item>
                                    <el-menu-item index="6">
                                        <i class="el-icon-s-order"></i>
                                        <span slot="title">文章信息发布</span>
                                    </el-menu-item>
                                    <el-menu-item index="7">
                                        <i class="el-icon-s-order"></i>
                                        <span slot="title">药物测试报告查看</span>
                                    </el-menu-item>
                                </el-menu>
                            </el-col>
                        </el-row>
                    </el-aside>
                    <el-container>
                        <el-main>
                            <div v-show="index==1">
                                <div id="addResearcher">
                                    <el-form ref="addResearcher" :model="addResearcher" label-width="100px">
                                        <el-row :gutter="30">
                                            <el-col :span="5">
                                                <div class="grid-content bg-purple">
                                                    <el-form-item label="员工编号:">
                                                        <el-input v-model="addResearcher.ra_id"></el-input>
                                                    </el-form-item>
                                                </div>
                                            </el-col>
                                            <el-col :span="5">
                                                <div class="grid-content bg-purple">
                                                    <el-form-item label="员工姓名:">
                                                        <el-input v-model="addResearcher.ra_name"></el-input>
                                                    </el-form-item>
                                                </div>
                                            </el-col>
                                            <el-col :span="5">
                                                <div class="grid-content bg-purple">
                                                    <el-form-item label="员工密码:">
                                                        <el-input v-model="addResearcher.ra_password"></el-input>
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
                                            style="width: 1310px">
                                        <el-table-column
                                                fixed
                                                prop="ra_id"
                                                label="员工编号"
                                                width="300">
                                        </el-table-column>
                                        <el-table-column
                                                prop="ra_name"
                                                label="员工姓名"
                                                width="300">
                                        </el-table-column>
                                        <el-table-column
                                                prop="ra_password"
                                                label="员工密码"
                                                width="300">
                                        </el-table-column>
                                        <el-table-column
                                                prop="ra_d_type"
                                                label="员工任务"
                                                width="300"
                                                :formatter="ra_d_typeFormatter">
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
                                        <div id="updateResearcher">
                                            <el-form :label-position="labelPosition" label-width="100px"
                                                     :model="updateResearcher">
                                                <el-form-item label="员工编号">
                                                    <el-input v-model="updateResearcher.ra_id" disabled></el-input>
                                                </el-form-item>
                                                <el-form-item label="员工名称">
                                                    <el-input v-model="updateResearcher.ra_name"></el-input>
                                                </el-form-item>
                                                <el-form-item label="员工密码">
                                                    <el-input v-model="updateResearcher.ra_password"></el-input>
                                                </el-form-item>
                                                <el-form-item label="研究方向:">
                                                    <el-select v-model="updateResearcher.ra_d_type" placeholder="请选择">
                                                        <el-option
                                                                v-for="item in options"
                                                                :key="item.value"
                                                                :label="item.label"
                                                                :value="item.value">
                                                        </el-option>
                                                    </el-select>
                                                </el-form-item>
                                                <el-button type="primary" @click="updateAResearcher">修改信息</el-button>
                                            </el-form>
                                        </div>
                                    </el-drawer>
                                </div>
                            </div>
                            <div v-show="index==2">
                                <div id="addDrag">
                                    <el-button type="primary" onclick="changeDrawer()">添加药物申请</el-button>
                                </div>
                                <el-drawer
                                        title="申请药物"
                                        :visible.sync="drawer2"
                                        :direction="direction">
                                    <div id="addADrag">
                                        <el-form :label-position="labelPosition" label-width="100px"
                                                 :model="Drag">
                                            <el-form-item label="药品商品名">
                                                <el-input v-model="Drag.d_trade_name"></el-input>
                                            </el-form-item>
                                            <el-form-item label="药品通用名">
                                                <el-input v-model="Drag.d_generic_name"></el-input>
                                            </el-form-item>
                                            <el-form-item label="药品规格">
                                                <el-input v-model="Drag.d_specification"></el-input>
                                            </el-form-item>
                                            <el-form-item label="药品主治功能">
                                                <el-input v-model="Drag.d_attending"></el-input>
                                            </el-form-item>
                                            <el-form-item label="药品标记">
                                                <el-select v-model="Drag.d_mark" placeholder="请选择">
                                                    <el-option
                                                            v-for="item in options1"
                                                            :key="item.value"
                                                            :label="item.label"
                                                            :value="item.value">
                                                    </el-option>
                                                </el-select>
                                            </el-form-item>
                                            <el-form-item label="药品成分">
                                                <el-input v-model="Drag.d_ingredients"></el-input>
                                            </el-form-item>
                                            <el-form-item label="药品性状">
                                                <el-input v-model="Drag.d_characters"></el-input>
                                            </el-form-item>
                                            <el-button type="primary" @click="putDrag">提交申请</el-button>
                                        </el-form>
                                    </div>
                                </el-drawer>
                                <el-divider></el-divider>
                                <div id="DragListDiv">
                                    <el-table
                                            :data="DragList.slice((DragListPage.currentPage-1)*DragListPage.pageSize,DragListPage.currentPage*DragListPage.pageSize)"
                                            border
                                            style="width:100%"
                                            :row-class-name="tableRowClassName">
                                        <el-table-column
                                                prop="d_trade_name"
                                                label="药品商品名"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="d_generic_name"
                                                label="药品通用名"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="d_specification"
                                                label="药品规格"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="d_attending"
                                                label="药品主治功能"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="d_mark"
                                                label="药品标记"
                                                width="150"
                                                :formatter="d_mark_typeFormatter">
                                        </el-table-column>
                                        <el-table-column
                                                prop="d_ingredients"
                                                label="药品成分"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="d_characters"
                                                label="药品性状"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="d_approve"
                                                label="状态"
                                                width="80">
                                            <template slot-scope="scope">
                                                <el-tag
                                                        :type="scope.row.d_approve == '1' ? 'success' : 'danger'"
                                                        disable-transitions>{{scope.row.d_approve|isvFilter}}
                                                </el-tag>
                                            </template>
                                        </el-table-column>
                                        <el-table-column
                                                label="操作"
                                                width="150">
                                            <template slot-scope="scope">
                                                <el-button @click="handleClick11(scope.row)" type="text" size="small">删除
                                                </el-button>
                                                <el-button @click="handleClick12(scope.row)" type="text" size="small"
                                                           v-if="scope.row.d_approve==1">
                                                    更新详细信息
                                                </el-button>
                                            </template>
                                        </el-table-column>
                                    </el-table>
                                </div>
                                <div class="block" style="margin-top:15px;">
                                    <el-pagination
                                            @size-change="handleSizeChange1"
                                            @current-change="handleCurrentChange1"
                                            :current-page.sync="DragListPage.currentPage"
                                            :page-sizes="[5, 10, 15, 20, 25]"
                                            :page-size="DragListPage.pageSize"
                                            layout="total, sizes, prev, pager, next, jumper"
                                            :total="DragListPage.total">
                                    </el-pagination>
                                </div>
                                <el-drawer
                                        title="更新药物详细详细"
                                        :visible.sync="drawer8"
                                        :direction="direction">
                                    <div id="updateADrag">
                                        <el-form :label-position="labelPosition" label-width="100px"
                                                 :model="updateDrag">
                                            <el-form-item label="药品生产厂家">
                                                <el-input v-model="updateDrag.d_manufacturer"></el-input>
                                            </el-form-item>
                                            <el-form-item label="药品批次号">
                                                <el-input v-model="updateDrag.d_batch_number"></el-input>
                                            </el-form-item>
                                            <el-form-item label="药品批准文号">
                                                <el-input v-model="updateDrag.d_approval_number"></el-input>
                                            </el-form-item>
                                            <el-form-item label="药品禁忌">
                                                <el-input type="textarea" v-model="updateDrag.d_taboo"></el-input>
                                            </el-form-item>
                                            <el-form-item label="药品不良反应">
                                                <el-input type="textarea"
                                                          v-model="updateDrag.d_adverse_reactions"></el-input>
                                            </el-form-item>
                                            <el-form-item label="药品保质期">
                                                <el-input v-model="updateDrag.d_shelf_life"></el-input>
                                            </el-form-item>
                                            <el-form-item label="药品注意事项">
                                                <el-input type="textarea" v-model="updateDrag.d_notes"></el-input>
                                            </el-form-item>
                                            <el-form-item label="药品相互作用">
                                                <el-input type="textarea" v-model="updateDrag.d_interaction"></el-input>
                                            </el-form-item>
                                            <el-form-item label="药理">
                                                <el-input type="textarea"
                                                          v-model="updateDrag.d_pharmacological"></el-input>
                                            </el-form-item>
                                            <el-button type="primary" @click="changeDrag">提交</el-button>
                                        </el-form>
                                    </div>
                                </el-drawer>
                            </div>
                            <div v-show="index==3">
                                <el-collapse v-model="activeNames" @change="handleChange" accordion>
                                    <el-collapse-item title="未分配的志愿者" name="1">
                                        <div id="VolunteerList">
                                            <el-table
                                                    :data="volunteers.slice((VolunteerListPage.currentPage-1)*VolunteerListPage.pageSize,VolunteerListPage.currentPage*VolunteerListPage.pageSize)"
                                                    border
                                                    style="width:100%">
                                                <el-table-column
                                                        prop="user_name"
                                                        label="志愿者姓名"
                                                        width="200">
                                                </el-table-column>
                                                <el-table-column
                                                        prop="user_age"
                                                        label="志愿者年龄"
                                                        width="200">
                                                </el-table-column>
                                                <el-table-column
                                                        prop="user_sex"
                                                        label="志愿者性别"
                                                        width="200"
                                                        :formatter="user_sexFormatter">
                                                </el-table-column>
                                                <el-table-column
                                                        prop="rl_title"
                                                        label="招募标题"
                                                        width="200">
                                                </el-table-column>
                                                <el-table-column
                                                        label="分配研究员"
                                                        width="300">
                                                    <template slot-scope="scope">
                                                        <el-form v-model="u_ra" ref="u_ra" label-width="100px">
                                                            <el-select v-model="u_ra.v_ra_id"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in researcherList"
                                                                        :key="item.ra_id"
                                                                        :label="item.ra_name"
                                                                        :value="item.ra_id">
                                                                </el-option>
                                                            </el-select>
                                                        </el-form>
                                                    </template>
                                                </el-table-column>
                                                <el-table-column
                                                        label="操作"
                                                        width="100">
                                                    <template slot-scope="scope">
                                                        <el-button @click="handleClick5(scope.row)" type="text"
                                                                   size="small">分配
                                                        </el-button>
                                                    </template>
                                                </el-table-column>
                                            </el-table>
                                        </div>
                                        <div class="block" style="margin-top:15px;">
                                            <el-pagination
                                                    @size-change="handleSizeChange3"
                                                    @current-change="handleCurrentChange3"
                                                    :current-page.sync="VolunteerListPage.currentPage"
                                                    :page-sizes="[5, 10, 15, 20, 25]"
                                                    :page-size="VolunteerListPage.pageSize"
                                                    layout="total, sizes, prev, pager, next, jumper"
                                                    :total="VolunteerListPage.total">
                                            </el-pagination>
                                        </div>
                                    </el-collapse-item>
                                    <div id="researcherListForVolunteer" v-for="researcher in researcherList">
                                        <el-collapse-item :title="researcher.ra_name" :name="researcher.ra_id">
                                            <div id="VolunteerListBy">
                                                <el-table
                                                        :data="volunteeer_ra"
                                                        border
                                                        style="width:100%">
                                                    <el-table-column
                                                            prop="user_name"
                                                            label="志愿者姓名"
                                                            width="200">
                                                    </el-table-column>
                                                    <el-table-column
                                                            prop="user_age"
                                                            label="志愿者年龄"
                                                            width="200">
                                                    </el-table-column>
                                                    <el-table-column
                                                            prop="user_sex"
                                                            label="志愿者性别"
                                                            width="200"
                                                            :formatter="user_sexFormatter">
                                                    </el-table-column>
                                                    <el-table-column
                                                            prop="rl_title"
                                                            label="招募标题"
                                                            width="200">
                                                    </el-table-column>
                                                    <el-table-column
                                                            label="操作"
                                                            width="100">
                                                        <template slot-scope="scope">
                                                            <el-button @click="handleClick6(scope.row)" type="text"
                                                                       size="small">解除
                                                            </el-button>
                                                        </template>
                                                    </el-table-column>
                                                </el-table>
                                            </div>
                                        </el-collapse-item>
                                    </div>
                                </el-collapse>
                            </div>
                            <div v-show="index==4">
                                <el-collapse v-model="activeName" @change="handleChange2" accordion>
                                    <div id="progressListForDrag" v-for="a in DragList" v-if="a.d_approve==1">
                                        <el-collapse-item :title="a.d_trade_name" :name="a.d_id">
                                            <el-timeline>
                                                <div id="addProgress">
                                                    <el-form ref="addProgress" :model="addProgress" label-width="100px">
                                                        <el-row :gutter="24">
                                                            <el-col :span="6">
                                                                <div class="grid-content bg-purple">
                                                                    <el-form-item label="更新时间:">
                                                                        <el-date-picker
                                                                                v-model="addProgress.dp_data"
                                                                                type="datetime"
                                                                                placeholder="选择日期"
                                                                                value-format="yyyy-MM-dd HH:mm:ss">
                                                                        </el-date-picker>
                                                                    </el-form-item>
                                                                </div>
                                                            </el-col>
                                                            <el-col :span="6">
                                                                <div class="grid-content bg-purple">
                                                                    <el-form-item label="更新备注:">
                                                                        <el-input
                                                                                v-model="addProgress.dp_text"></el-input>
                                                                    </el-form-item>
                                                                </div>
                                                            </el-col>
                                                            <el-col :span="6">
                                                                <div class="grid-content bg-purple">
                                                                    <el-form-item label="更新阶段:">
                                                                        <el-input
                                                                                v-model="addProgress.dp_stage"></el-input>
                                                                    </el-form-item>
                                                                </div>
                                                            </el-col>
                                                            <el-col :span="6">
                                                                <div class="grid-content bg-purple">
                                                                    <el-form-item>
                                                                        <el-button type="primary"
                                                                                   @click="onSubmitProgress">
                                                                            添加
                                                                        </el-button>
                                                                    </el-form-item>
                                                                </div>
                                                            </el-col>
                                                        </el-row>
                                                    </el-form>
                                                </div>
                                                <el-timeline-item
                                                        v-for="(Progress, index) in ProgressList"
                                                        :key="index"
                                                        :timestamp="Progress.dp_data">
                                                    {{Progress.dp_text}}
                                                    <el-tag>{{Progress.dp_stage}}期</el-tag>
                                                    <div>
                                                        <el-button @click="handleClick7(Progress)" type="text"
                                                                   size="small">修改
                                                        </el-button>
                                                        <el-button @click="handleClick8(Progress.dp_id)" type="text"
                                                                   size="small">删除
                                                        </el-button>
                                                    </div>
                                                    <el-drawer
                                                            title="修改进程"
                                                            :visible.sync="drawer5"
                                                            :direction="direction">
                                                        <div id="changeAProgress">
                                                            <el-form :label-position="labelPosition" label-width="100px"
                                                                     :model="changeProgress">
                                                                <el-form-item label="更新时间:">
                                                                    <el-date-picker
                                                                            v-model="changeProgress.dp_data"
                                                                            type="datetime"
                                                                            placeholder="选择日期"
                                                                            value-format="yyyy-MM-dd HH:mm:ss">
                                                                    </el-date-picker>
                                                                </el-form-item>
                                                                <el-form-item label="更新备注">
                                                                    <el-input
                                                                            v-model="changeProgress.dp_text"></el-input>
                                                                </el-form-item>
                                                                <el-form-item label="更新阶段">
                                                                    <el-input
                                                                            v-model="changeProgress.dp_stage"></el-input>
                                                                </el-form-item>
                                                                <el-button type="primary" @click="putProgress">提交修改
                                                                </el-button>
                                                            </el-form>
                                                        </div>
                                                    </el-drawer>
                                                </el-timeline-item>
                                            </el-timeline>
                                        </el-collapse-item>
                                    </div>
                                </el-collapse>
                            </div>
                            <div v-show="index==5">
                                <div id="addRecruit">
                                    <el-button type="primary" onclick="changeDrawer1()">添加支援招募申请</el-button>
                                </div>
                                <el-drawer
                                        title="申请志愿招募"
                                        :visible.sync="drawer3"
                                        :direction="direction">
                                    <div id="addARecruit">
                                        <el-form :label-position="labelPosition" label-width="100px"
                                                 :model="Recruit">
                                            <el-form-item label="招募标题">
                                                <el-input v-model="Recruit.r_title"></el-input>
                                            </el-form-item>
                                            <el-form-item label="招募药物名称">
                                                <el-select v-model="Recruit.r_drag_name" placeholder="请选择">
                                                    <el-option
                                                            v-for="item in DragList"
                                                            :key="item.d_id"
                                                            :label="item.d_trade_name"
                                                            :value="item.d_trade_name">
                                                    </el-option>
                                                </el-select>
                                            </el-form-item>
                                            <el-form-item label="招募药物效果">
                                                <el-input v-model="Recruit.r_drag_attending"></el-input>
                                            </el-form-item>
                                            <el-form-item label="招募性别">
                                                <el-select v-model="Recruit.r_sex" placeholder="请选择">
                                                    <el-option
                                                            v-for="item in options2"
                                                            :key="item.value"
                                                            :label="item.label"
                                                            :value="item.value">
                                                    </el-option>
                                                </el-select>
                                            </el-form-item>
                                            <el-form-item label="招募年龄">
                                                <el-input v-model="Recruit.r_year"></el-input>
                                            </el-form-item>
                                            <el-form-item label="招募BMI指数">
                                                <el-input v-model="Recruit.r_bmi"></el-input>
                                            </el-form-item>
                                            <el-form-item label="招募实验分期">
                                                <el-input v-model="Recruit.r_stage"></el-input>
                                            </el-form-item>
                                            <el-form-item label="招募类型">
                                                <el-select v-model="Recruit.r_type" placeholder="请选择">
                                                    <el-option
                                                            v-for="item in options3"
                                                            :key="item.value"
                                                            :label="item.label"
                                                            :value="item.value">
                                                    </el-option>
                                                </el-select>
                                            </el-form-item>
                                            <el-form-item label="招募时间">
                                                <el-date-picker
                                                        v-model="Recruit.r_time"
                                                        type="date"
                                                        placeholder="选择日期"
                                                        value-format="yyyy-MM-dd">
                                                </el-date-picker>
                                            </el-form-item>
                                            <el-form-item label="招募人数">
                                                <el-input v-model="Recruit.r_number"></el-input>
                                            </el-form-item>
                                            <el-form-item label="招募费用">
                                                <el-input v-model="Recruit.r_money"></el-input>
                                            </el-form-item>
                                            <el-form-item label="招募细节">
                                                <el-input
                                                        type="textarea"
                                                        :rows="2"
                                                        placeholder="请输入内容"
                                                        v-model="Recruit.r_detial">
                                                </el-input>
                                            </el-form-item>
                                            <el-button type="primary" @click="putRecruit">提交申请</el-button>
                                        </el-form>
                                    </div>
                                </el-drawer>
                                <el-divider></el-divider>
                                <div id="recruitListDiv">
                                    <el-table
                                            :data="recruitList.slice((recruitListPage.currentPage-1)*recruitListPage.pageSize,recruitListPage.currentPage*recruitListPage.pageSize)"
                                            border
                                            style="width: 100%">
                                        <el-table-column
                                                prop="r_title"
                                                label="招募标题"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="r_drag_name"
                                                label="招募药物名称"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="r_drag_attending"
                                                label="招募药物效果"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="r_sex"
                                                label="招募性别"
                                                width="100"
                                                :formatter="r_sexFormatter">
                                        </el-table-column>
                                        <el-table-column
                                                prop="r_year"
                                                label="招募年龄"
                                                width="100">
                                        </el-table-column>
                                        <el-table-column
                                                prop="r_bmi"
                                                label="招募BMI指数"
                                                width="100">
                                        </el-table-column>
                                        <el-table-column
                                                prop="r_stage"
                                                label="招募实验分期"
                                                width=" 100">
                                        </el-table-column>
                                        <el-table-column
                                                prop="r_type"
                                                label="招募类型"
                                                width=" 100"
                                                :formatter="r_typeFormatter">
                                        </el-table-column>
                                        <el-table-column
                                                prop="r_time"
                                                label="招募时间"
                                                width=" 100">
                                        </el-table-column>
                                        <el-table-column
                                                prop="r_number"
                                                label="招募人数"
                                                width=" 100">
                                        </el-table-column>
                                        <el-table-column
                                                prop="r_money"
                                                label="招募报酬"
                                                width=" 100">
                                        </el-table-column>
                                        <el-table-column
                                                label="招募细节"
                                                width=" 100">
                                            <template slot-scope="scope">
                                                <el-button @click="open(scope.row)" type="text" size="small">详情
                                                </el-button>
                                            </template>
                                        </el-table-column>
                                        <el-table-column
                                                label="操作"
                                                width="100">
                                            <template slot-scope="scope">
                                                <el-button @click="handleClick3(scope.row)" type="text" size="small">删除
                                                </el-button>
                                                <el-button @click="handleClick4(scope.row)" type="text" size="small">
                                                    编辑
                                                </el-button>
                                            </template>
                                        </el-table-column>
                                    </el-table>
                                    <div class="block" style="margin-top:15px;">
                                        <el-pagination
                                                @size-change="handleSizeChange2"
                                                @current-change="handleCurrentChange2"
                                                :current-page.sync="recruitListPage.currentPage"
                                                :page-sizes="[5, 10, 15, 20, 25]"
                                                :page-size="recruitListPage.pageSize"
                                                layout="total, sizes, prev, pager, next, jumper"
                                                :total="recruitListPage.total">
                                        </el-pagination>
                                    </div>
                                    <el-drawer
                                            title="编辑信息"
                                            :visible.sync="drawer4"
                                            :direction="direction">
                                        <div id="updateRrecruit">
                                            <el-form :label-position="labelPosition" label-width="100px"
                                                     :model="updateRrecruit">
                                                <el-form-item label="招募标题">
                                                    <el-input v-model="updateRrecruit.r_title"></el-input>
                                                </el-form-item>
                                                <el-form-item label="招募药物名称">
                                                    <el-select v-model="updateRrecruit.r_drag_name" placeholder="请选择">
                                                        <el-option
                                                                v-for="item in DragList"
                                                                :key="item.d_id"
                                                                :label="item.d_trade_name"
                                                                :value="item.d_trade_name">
                                                        </el-option>
                                                    </el-select>
                                                </el-form-item>
                                                <el-form-item label="招募药物效果">
                                                    <el-input v-model="updateRrecruit.r_drag_attending"></el-input>
                                                </el-form-item>
                                                <el-form-item label="招募性别">
                                                    <el-select v-model="updateRrecruit.r_sex" placeholder="请选择">
                                                        <el-option
                                                                v-for="item in options2"
                                                                :key="item.value"
                                                                :label="item.label"
                                                                :value="item.value">
                                                        </el-option>
                                                    </el-select>
                                                </el-form-item>
                                                <el-form-item label="招募年龄">
                                                    <el-input v-model="updateRrecruit.r_year"></el-input>
                                                </el-form-item>
                                                <el-form-item label="招募BMI指数">
                                                    <el-input v-model="updateRrecruit.r_bmi"></el-input>
                                                </el-form-item>
                                                <el-form-item label="招募实验分期">
                                                    <el-input v-model="updateRrecruit.r_stage"></el-input>
                                                </el-form-item>
                                                <el-form-item label="招募类型">
                                                    <el-select v-model="updateRrecruit.r_type" placeholder="请选择">
                                                        <el-option
                                                                v-for="item in options3"
                                                                :key="item.value"
                                                                :label="item.label"
                                                                :value="item.value">
                                                        </el-option>
                                                    </el-select>
                                                </el-form-item>
                                                <el-form-item label="招募时间">
                                                    <el-date-picker
                                                            v-model="updateRrecruit.r_time"
                                                            type="date"
                                                            placeholder="选择日期"
                                                            value-format="yyyy-MM-dd">
                                                    </el-date-picker>
                                                </el-form-item>
                                                <el-form-item label="招募人数">
                                                    <el-input v-model="updateRrecruit.r_number"></el-input>
                                                </el-form-item>
                                                <el-form-item label="招募费用">
                                                    <el-input v-model="updateRrecruit.r_money"></el-input>
                                                </el-form-item>
                                                <el-form-item label="招募细节">
                                                    <el-input
                                                            type="textarea"
                                                            :rows="2"
                                                            placeholder="请输入内容"
                                                            v-model="updateRrecruit.r_detial">
                                                    </el-input>
                                                </el-form-item>
                                                <el-button type="primary" @click="updateARrecruit">修改信息</el-button>
                                            </el-form>
                                        </div>
                                    </el-drawer>
                                </div>
                            </div>
                            <div v-show="index==6">
                                <div id="addMessage">
                                    <el-button type="primary" onclick="changeDrawer2()">添加药物文章</el-button>
                                </div>
                                <el-drawer
                                        title="添加文章"
                                        :visible.sync="drawer6"
                                        :direction="direction">
                                    <div id="addAMessage">
                                        <el-form :label-position="labelPosition" label-width="100px"
                                                 :model="Message">
                                            <el-form-item label="文章标题">
                                                <el-input v-model="Message.m_title"></el-input>
                                            </el-form-item>
                                            <el-form-item label="文章摘要">
                                                <el-input type="textarea" v-model="Message.m_summary"></el-input>
                                            </el-form-item>
                                            <el-form-item label="文章类型">
                                                <el-select v-model="Message.m_type" placeholder="请选择">
                                                    <el-option
                                                            v-for="item in options4"
                                                            :key="item.value"
                                                            :label="item.label"
                                                            :value="item.value">
                                                    </el-option>
                                                </el-select>
                                            </el-form-item>
                                            <el-form-item label="文章内容">
                                                <el-input type="textarea" v-model="Message.m_content"></el-input>
                                            </el-form-item>
                                            <el-button type="primary" @click="putMessage">提交申请</el-button>
                                        </el-form>
                                    </div>
                                </el-drawer>
                                <el-divider></el-divider>
                                <div id="MessageListDiv">
                                    <el-table
                                            :data="MessageList"
                                            border
                                            style="width:100%"
                                            :row-class-name="tableRowClassName1">
                                        <el-table-column
                                                prop="m_title"
                                                label="文章标题"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="m_summary"
                                                label="文章摘要"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="m_content"
                                                label="文章内容"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="m_type"
                                                label="文章类型"
                                                width="200"
                                                :formatter="m_typeFormatter">
                                        </el-table-column>
                                        <el-table-column
                                                prop="m_time"
                                                label="发布时间"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="m_read"
                                                label="阅读数目"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="m_mark"
                                                label="状态"
                                                width="200">
                                            <template slot-scope="scope">
                                                <el-tag
                                                        :type="scope.row.m_mark == '1' ? 'success' : 'danger'"
                                                        disable-transitions>{{scope.row.m_mark|isvFilter}}
                                                </el-tag>
                                            </template>
                                        </el-table-column>
                                        <el-table-column
                                                prop="m_mark"
                                                label="操作"
                                                width="200">
                                            <template slot-scope="scope">
                                                <el-button @click="handleClick9(scope.row)" type="text" size="small">删除
                                                </el-button>
                                                <el-button @click="handleClick10(scope.row)" type="text" size="small">
                                                    编辑
                                                </el-button>
                                            </template>
                                        </el-table-column>
                                    </el-table>
                                    <el-drawer
                                            title="修改文章"
                                            :visible.sync="drawer7"
                                            :direction="direction">
                                        <div id="changeMessage">
                                            <el-form :label-position="labelPosition" label-width="100px"
                                                     :model="changeMessage">
                                                <el-form-item label="文章标题">
                                                    <el-input v-model="changeMessage.m_title"></el-input>
                                                </el-form-item>
                                                <el-form-item label="文章摘要">
                                                    <el-input type="textarea"
                                                              v-model="changeMessage.m_summary"></el-input>
                                                </el-form-item>
                                                <el-form-item label="文章类型">
                                                    <el-select v-model="changeMessage.m_type" placeholder="请选择">
                                                        <el-option
                                                                v-for="item in options4"
                                                                :key="item.value"
                                                                :label="item.label"
                                                                :value="item.value">
                                                        </el-option>
                                                    </el-select>
                                                </el-form-item>
                                                <el-form-item label="文章内容">
                                                    <el-input type="textarea"
                                                              v-model="changeMessage.m_content"></el-input>
                                                </el-form-item>
                                                <el-button type="primary" @click="changeAMessage">修改</el-button>
                                            </el-form>
                                        </div>
                                    </el-drawer>
                                </div>
                            </div>
                            <div v-show="index==7">
                                <el-collapse v-model="activeName" @change="handleChange3" accordion>
                                    <div id="CRFReportForDrag" v-for="a in DragList" v-if="a.d_approve==1">
                                        <el-collapse-item :title="a.d_trade_name" :name="a.d_id">
                                            <el-table
                                                    :data="CRFList"
                                                    style="width: 820px">
                                                <el-table-column
                                                        prop="c_id"
                                                        label="报告编号"
                                                        width="180">
                                                </el-table-column>
                                                <el-table-column
                                                        prop="user_name"
                                                        label="志愿者姓名"
                                                        width="180">
                                                </el-table-column>
                                                <el-table-column
                                                        prop="ra_name"
                                                        label="研究员姓名"
                                                        width="180">
                                                </el-table-column>
                                                <el-table-column
                                                        prop="c_date"
                                                        label="报告提交时间"
                                                        width="180">
                                                </el-table-column>
                                                <el-table-column
                                                        label="操作"
                                                        width="100">
                                                    <template slot-scope="scope">
                                                        <el-button @click="handleClick13(scope.row)" type="text"
                                                                   size="small">查看
                                                        </el-button>
                                                    </template>
                                                </el-table-column>
                                            </el-table>
                                        </el-collapse-item>
                                    </div>
                                </el-collapse>
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
                        recruitListPage: {
                            currentPage: 1,
                            total: '',
                            pageSize: 5,
                        },
                        VolunteerListPage: {
                            currentPage: 1,
                            total: '',
                            pageSize: 5,
                        },
                        DragListPage: {
                            currentPage: 1,
                            total: '',
                            pageSize: 5,
                        },
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
                        options1: [{
                            value: '1',
                            label: '甲类OTC'
                        }, {
                            value: '2',
                            label: '乙类OTC'
                        }, {
                            value: '3',
                            label: '保健品'
                        }],
                        options2: [{
                            value: '0',
                            label: '男'
                        }, {
                            value: '1',
                            label: '女'
                        }, {
                            value: '2',
                            label: '男女不限'
                        }],
                        options3: [{
                            value: '0',
                            label: '健康志愿者'
                        }, {
                            value: '1',
                            label: '患病志愿者'
                        }],
                        options4: [{
                            value: '0',
                            label: '药物知识'
                        }, {
                            value: '1',
                            label: '药物发布'
                        }, {
                            value: '2',
                            label: '公司新闻'
                        }],
                        value: '',
                        direction: 'rtl',
                        drawer: false,
                        drawer2: false,
                        drawer3: false,
                        drawer4: false,
                        drawer5: false,
                        drawer6: false,
                        drawer7: false,
                        drawer8: false,
                        recruitList: [],
                        activeName: 'second',
                        index: '1',
                        labelPosition: 'left',
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
                        updateResearcher: {
                            ra_id: '',
                            ra_name: '',
                            ra_password: '',
                            ra_e_id: document.getElementById("e_id").textContent,
                            ra_d_type: '',
                        },
                        activeNames: ['1'],
                        DragList: [],
                        Drag: {
                            d_id: '',
                            d_e_id: '',
                            d_trade_name: '',
                            d_generic_name: '',
                            d_specification: '',
                            d_manufacturer: '',
                            d_batch_number: '',
                            d_approval_number: '',
                            d_attending: '',
                            d_taboo: '',
                            d_adverse_reactions: '',
                            d_shelf_life: '',
                            d_state: '',
                            d_approve: '',
                            d_mark: '',
                            d_notes: '',
                            d_ingredients: '',
                            d_characters: '',
                            d_interaction: '',
                            d_pharmacological: '',
                        },
                        updateDrag: {
                            d_id: '',
                            d_e_id: '',
                            d_trade_name: '',
                            d_generic_name: '',
                            d_specification: '',
                            d_manufacturer: '',
                            d_batch_number: '',
                            d_approval_number: '',
                            d_attending: '',
                            d_taboo: '',
                            d_adverse_reactions: '',
                            d_shelf_life: '',
                            d_state: '',
                            d_approve: '',
                            d_mark: '',
                            d_notes: '',
                            d_ingredients: '',
                            d_characters: '',
                            d_interaction: '',
                            d_pharmacological: '',
                        },
                        Recruit: {
                            r_id: '',
                            r_e_id: '',
                            r_title: '',
                            r_drag_name: '',
                            r_drag_attending: '',
                            r_institutes: '',
                            r_sex: '',
                            r_year: '',
                            r_bmi: '',
                            r_stage: '',
                            r_type: '',
                            r_address: '',
                            r_time: '',
                            r_number: '',
                            r_money: '',
                            r_detial: '',
                        },
                        updateRrecruit: '',
                        volunteers: [],
                        volunteeer_ra: [],
                        u_ra: {
                            v_user_id: '',
                            v_ra_id: '',
                            v_rl_id: '',
                        },
                        deleteu_ra: {
                            v_user_id: '',
                            v_ra_id: '',
                            v_rl_id: '',
                        },
                        ProgressList: [],
                        addProgress: {
                            dp_id: '',
                            dp_d_id: '',
                            dp_data: '',
                            dp_text: '',
                            dp_stage: '',
                        },
                        Progress: {
                            dp_id: '',
                            dp_d_id: '',
                            dp_data: '',
                            dp_text: '',
                            dp_stage: '',
                        },
                        changeProgress: {
                            dp_id: '',
                            dp_d_id: '',
                            dp_data: '',
                            dp_text: '',
                            dp_stage: '',
                        },
                        dp_id: '',
                        Message: {
                            m_id: '',
                            m_summary: '',
                            m_title: '',
                            m_content: '',
                            m_mark: '',
                            m_type: '',
                            m_time: '',
                            m_read: '',
                            m_author: '',
                        },
                        MessageList: [],
                        changeMessage: {
                            m_id: '',
                            m_summary: '',
                            m_title: '',
                            m_content: '',
                            m_mark: '',
                            m_type: '',
                            m_time: '',
                            m_read: '',
                            m_author: '',
                        },
                        CRFList: [],
                    };
                },
                methods: {
                    handleSizeChange1(val) {
                        console.log(`每页 ${val} 条`);
                        this.DragListPage.currentPage = 1;
                        this.DragListPage.pageSize = val;
                    },
                    handleCurrentChange1(val) {
                        console.log(`当前页: ${val}`);
                        this.DragListPage.currentPage = val;
                    },
                    handleSizeChange2(val) {
                        console.log(`每页 ${val} 条`);
                        this.recruitListPage.currentPage = 1;
                        this.recruitListPage.pageSize = val;
                    },
                    handleCurrentChange2(val) {
                        console.log(`当前页: ${val}`);
                        this.recruitListPage.currentPage = val;
                    },
                    handleSizeChange3(val) {
                        console.log(`每页 ${val} 条`);
                        this.VolunteerListPage.currentPage = 1;
                        this.VolunteerListPage.pageSize = val;
                    },
                    handleCurrentChange3(val) {
                        console.log(`当前页: ${val}`);
                        this.VolunteerListPage.currentPage = val;
                    },
                    r_typeFormatter(row, colum) {
                        if (row.r_type == 0)
                            return '健康志愿者'
                        else
                            return '患病志愿者'
                    },
                    r_sexFormatter(row, colum) {
                        if (row.r_sex == 0)
                            return '男性'
                        else if (row.r_sex == 1)
                            return '女性'
                        else
                            return '男女不限'
                    },
                    user_sexFormatter(row, colum) {
                        if (row.user_sex == 0)
                            return '男性'
                        else if (row.user_sex == 1)
                            return '女性'
                        else
                            return '男女不限'
                    },
                    ra_d_typeFormatter(row, column) {
                        if (row.ra_d_type == 1)
                            return '化学药物(制剂)'
                        else if (row.ra_d_type == 2)
                            return '生物制品'
                        else if (row.ra_d_type == 3)
                            return '新型疫苗'
                        else if (row.ra_d_type == 4)
                            return '靶向药物'
                        else
                            return '慢性病防止药物'
                    },
                    d_mark_typeFormatter(row, colum) {
                        if (row.d_mark == 1)
                            return '甲类OTC'
                        else if (row.d_mark == 2)
                            return '乙类OTC'
                        else
                            return '保健品'
                    },
                    m_typeFormatter(row, colum) {
                        if (row.m_type == 0)
                            return '药物知识'
                        else if (row.d_mark == 1)
                            return '药物发布'
                        else
                            return '公司新闻'
                    },
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
                        deleteResearcher(row.ra_id);
                    },
                    handleClick2(row) {
                        this.drawer = 'true';
                        this.updateResearcher = row

                    },
                    handleClick3(row) {
                        deleteRrecruit(row.r_id);
                    },
                    handleClick4(row) {
                        this.drawer4 = true
                        this.updateRrecruit = row;
                        this.updateRrecruit.r_sex = row.r_sex.toString();
                        this.updateRrecruit.r_type = row.r_type.toString();
                    },
                    handleClick5(row) {
                        this.u_ra.v_user_id = row.user_id;
                        this.u_ra.v_rl_id = row.rl_id;
                        addURa();
                    },
                    handleClick6(row) {
                        app.deleteu_ra.v_user_id = row.user_id;
                        deleteVolunteer();
                    },
                    handleClick7(p) {
                        this.drawer5 = true;
                        this.changeProgress.dp_id = p.dp_id;
                        this.changeProgress.dp_d_id = p.dp_d_id;
                        this.changeProgress.dp_data = p.dp_data;
                        this.changeProgress.dp_text = p.dp_text;
                        this.changeProgress.dp_stage = p.dp_stage;
                    },
                    handleClick8(row) {
                        deleteProgressByDpId(row);
                    },
                    handleClick9(row) {
                        deleteMessageByMId(row.m_id);
                    },
                    handleClick10(row) {
                        this.drawer7 = true;
                        this.changeMessage.m_id = row.m_id
                        this.changeMessage.m_summary = row.m_summary
                        this.changeMessage.m_title = row.m_title
                        this.changeMessage.m_content = row.m_content
                        this.changeMessage.m_mark = 0
                        this.changeMessage.m_type = row.m_type
                        this.changeMessage.m_time = row.m_time
                        this.changeMessage.m_read = row.m_read
                        this.changeMessage.m_author = row.m_author
                    },
                    handleClick11(row) {
                        deleteDragByDId(row.d_id);
                    },
                    handleClick12(row) {
                        this.drawer8 = true;
                        this.updateDrag.d_id = row.d_id;
                        this.updateDrag.d_e_id = row.d_e_id;
                        this.updateDrag.d_trade_name = row.d_trade_name;
                        this.updateDrag.d_generic_name = row.d_generic_name;
                        this.updateDrag.d_manufacturer = row.d_manufacturer;
                        this.updateDrag.d_batch_number = row.d_batch_number;
                        this.updateDrag.d_approval_number = row.d_approval_number;
                        this.updateDrag.d_attending = row.d_attending;
                        this.updateDrag.d_taboo = row.d_taboo;
                        this.updateDrag.d_adverse_reactions = row.d_adverse_reactions;
                        this.updateDrag.d_shelf_life = row.d_shelf_life;
                        this.updateDrag.d_state = row.d_state;
                        this.updateDrag.d_approve = row.d_approve;
                        this.updateDrag.d_mark = row.d_mark;
                        this.updateDrag.d_notes = row.d_notes;
                        this.updateDrag.d_ingredients = row.d_ingredients;
                        this.updateDrag.d_characters = row.d_characters;
                        this.updateDrag.d_interaction = row.d_interaction;
                        this.updateDrag.d_pharmacological = row.d_pharmacological;
                        console.log(this.updateDrag);
                    },
                    handleClick13(row) {
                        getPDF(row.c_id);
                    },
                    open(row) {
                        this.$alert(row.r_detial);
                    },
                    select(index, indexPath) {
                        app.index = index;
                    },
                    onSubmit() {
                        addResearcher();
                    },
                    handleChange(val) {
                        app.deleteu_ra.v_ra_id = val;
                        getVolunteersByRaId(val);
                    },
                    handleChange2(val) {
                        app.addProgress.dp_d_id = val;
                        getProgressListByDId(val);
                    },
                    handleChange3(val) {
                        getCRFList(val)
                    },
                    putDrag() {
                        putADrag();
                    },
                    tableRowClassName({row, rowIndex}) {
                        if (row.d_approve == 0) {
                            return 'warning-row';
                        } else if (row.d_approve == 1) {
                            return 'success-row';
                        } else {
                            return 'error-row'
                        }
                    },
                    tableRowClassName1({row, rowIndex}) {
                        if (row.m_mark == 0) {
                            return 'warning-row';
                        } else if (row.m_mark == 1) {
                            return 'success-row';
                        } else {
                            return 'error-row'
                        }
                    },
                },
                filters: {
                    isvFilter(value) {
                        if (value === 0)
                            return '审核中'
                        else if (value === 1)
                            return '通过'
                        else
                            return '未通过'
                    }
                    ,
                }
                ,
                created: function () {
                    getResearcherList();
                    getDragList();
                    getRecruits();
                    getVolunteers();
                    getMessageList();
                }
            })
        </script>
    </body>
</html>
