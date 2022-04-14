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
            function addEnterprise() {
                $.ajax({
                    url: "Admin/addEnterprise",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"addEnterprise": JSON.stringify(this.app.addEnterprise)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Admin.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function getRecruitList() {
                $.ajax({
                    url: "recruit/getRecruitList",
                    contentType: 'application/json;charset=UTF-8',
                    success: function (reps) {
                        console.log(reps)
                        app.recruitList = reps;
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function getEnterpriseList() {
                $.ajax({
                    url: "Admin/getEnterpriseList",
                    contentType: 'application/json;charset=UTF-8',
                    success: function (reps) {
                        console.log(reps)
                        app.enterpriseList = reps;
                        app.enterprisePage.total = app.enterpriseList.length;
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function getDragList() {
                $.ajax({
                    url: "Admin/getDragList",
                    contentType: 'application/json;charset=UTF-8',
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

            function changeRecruitListisv(rl_id, trg) {
                $.ajax({
                    url: "Admin/changeRecruitListisv",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"rl_id": JSON.stringify(rl_id), "trg": JSON.stringify(trg)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Admin.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function updateARlUE(rl_id, rl_u_id) {
                $.ajax({
                    url: "Admin/updateARlUE",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"rl_id": JSON.stringify(rl_id), "rl_u_id": JSON.stringify(rl_u_id)},
                    success: function (reps) {
                        alert(reps.valueOf());
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function changeDragDApprove(d_id, trg) {
                $.ajax({
                    url: "Admin/changeDragDApprove",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"d_id": JSON.stringify(d_id), "trg": JSON.stringify(trg)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Admin.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function changeMessageMMark(m_id, trg) {
                $.ajax({
                    url: "Admin/changeMessageMMark",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"m_id": JSON.stringify(m_id), "trg": JSON.stringify(trg)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Admin.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function updateAEnterprise() {
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

            function getPhyExam(pe_rl_id) {
                $.ajax({
                    url: "Admin/getPhyExam",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"pe_rl_id": JSON.stringify(pe_rl_id)},
                    success: function (reps) {
                        app.PhyExam = reps;
                        app.PhyExam.pe_skin = reps.pe_skin.toString();
                        app.PhyExam.pe_lymph_nodes = reps.pe_lymph_nodes.toString();
                        app.PhyExam.pe_neck = reps.pe_neck.toString();
                        app.PhyExam.pe_chest = reps.pe_chest.toString();
                        app.PhyExam.pe_abdomen = reps.pe_abdomen.toString();
                        app.PhyExam.pe_spine = reps.pe_spine.toString();
                        app.PhyExam.pe_limbs = reps.pe_limbs.toString();
                        app.PhyExam.pe_ECG = reps.pe_ECG.toString();
                        app.PhyExam.pe_blood_routine = reps.pe_blood_routine.toString();
                        app.PhyExam.pe_urine_routine = reps.pe_urine_routine.toString();
                        app.PhyExam.pe_blood_chemistry = reps.pe_blood_chemistry.toString();
                        app.PhyExam.pe_coagulation = reps.pe_coagulation.toString();
                        app.PhyExam.pe_pregnancy = reps.pe_pregnancy.toString();
                        app.PhyExam.pe_smoking = reps.pe_smoking.toString();
                        app.PhyExam.pe_drinking = reps.pe_drinking.toString();

                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function getMessageList() {
                $.ajax({
                    url: "Admin/getMessageList",
                    contentType: 'application/json;charset=UTF-8',
                    success: function (reps) {
                        console.log(reps)
                        app.MessageList = reps;
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
                                        <span slot="title">药物公司管理</span>
                                    </el-menu-item>
                                    <el-menu-item index="2">
                                        <i class="el-icon-document"></i>
                                        <span slot="title">药物申请管理</span>
                                    </el-menu-item>
                                    <el-menu-item index="3">
                                        <i class="el-icon-setting"></i>
                                        <span slot="title">志愿者申请管理</span>
                                    </el-menu-item>
                                    <el-menu-item index="4">
                                        <i class="el-icon-setting"></i>
                                        <span slot="title">公开平台信息管理</span>
                                    </el-menu-item>
                                </el-menu>
                            </el-col>
                        </el-row>
                    </el-aside>
                    <el-container>
                        <el-main>
                            <div v-show="index==1">
                                <div id="addEnterprise">
                                    <el-form ref="addEnterprise" :model="addEnterprise" label-width="100px">
                                        <el-row :gutter="24">
                                            <el-col :span="6">
                                                <div class="grid-content bg-purple">
                                                    <el-form-item label="公司编号:">
                                                        <el-input v-model="addEnterprise.e_id"></el-input>
                                                    </el-form-item>
                                                </div>
                                            </el-col>
                                            <el-col :span="6">
                                                <div class="grid-content bg-purple">
                                                    <el-form-item label="公司名称:">
                                                        <el-input v-model="addEnterprise.e_name"></el-input>
                                                    </el-form-item>
                                                </div>
                                            </el-col>
                                            <el-col :span="6">
                                                <div class="grid-content bg-purple">
                                                    <el-form-item label="公司密码:">
                                                        <el-input v-model="addEnterprise.e_password"></el-input>
                                                    </el-form-item>
                                                </div>
                                            </el-col>
                                            <el-col :span="6">
                                                <div class="grid-content bg-purple">
                                                    <el-form-item>
                                                        <el-button type="primary" @click="onSubmit">立即创建</el-button>
                                                    </el-form-item>
                                                </div>
                                            </el-col>
                                        </el-row>
                                    </el-form>
                                </div>
                                <div id="enterpriseList">
                                    <el-table
                                            :data="enterpriseList.slice((enterprisePage.currentPage-1)*enterprisePage.pageSize,enterprisePage.currentPage*enterprisePage.pageSize)"
                                            border
                                            style="width: 100%">
                                        <el-table-column
                                                fixed
                                                prop="e_id"
                                                label="公司编号"
                                                width="180">
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
                                    <div class="block" style="margin-top:15px;">
                                        <el-pagination
                                                @size-change="handleSizeChange1"
                                                @current-change="handleCurrentChange1"
                                                :current-page.sync="enterprisePage.currentPage"
                                                :page-sizes="[5, 10, 15, 20, 25]"
                                                :page-size="enterprisePage.pageSize"
                                                layout="total, sizes, prev, pager, next, jumper"
                                                :total="enterprisePage.total">
                                        </el-pagination>
                                    </div>
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
                                                <el-button type="primary" @click="updateAEnterprise">修改信息</el-button>
                                            </el-form>
                                        </div>
                                    </el-drawer>
                                </div>
                            </div>
                            <div v-show="index==2">
                                <div id="DragList">
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
                                                width="200"
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
                                                label="操作"
                                                width="200"
                                                prop="isv">
                                            <template slot-scope="scope" v-if="scope.row.d_approve===0">
                                                <el-button @click="handleClick5(scope.row)" type="text" size="small">不通过
                                                </el-button>
                                                <el-button @click="handleClick6(scope.row)" type="text" size="small">
                                                    通过
                                                </el-button>
                                            </template>
                                        </el-table-column>
                                    </el-table>
                                </div>
                                <div class="block" style="margin-top:15px;">
                                    <el-pagination
                                            @size-change="handleSizeChange2"
                                            @current-change="handleCurrentChange2"
                                            :current-page.sync="DragListPage.currentPage"
                                            :page-sizes="[5, 10, 15, 20, 25]"
                                            :page-size="DragListPage.pageSize"
                                            layout="total, sizes, prev, pager, next, jumper"
                                            :total="DragListPage.total">
                                    </el-pagination>
                                </div>
                            </div>
                            <div v-show="index==3">
                                <div id="recruitlist">
                                    <el-table
                                            :data="recruitList"
                                            border
                                            style="width: 100%"
                                            :row-class-name="tableRowClassName1">
                                        <el-table-column
                                                fixed
                                                prop="rl_user_name"
                                                label="姓名"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="rl_user_sex"
                                                label="性别"
                                                :formatter="sexTypeFormatter"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="rl_user_phone"
                                                label="联系电话"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="rl_user_height"
                                                label="身高"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="rl_user_weight"
                                                label="体重"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="rl_address"
                                                label="住址"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="rl_issmoke"
                                                label="是否抽烟"
                                                :formatter="smokeTypeFormatter"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                label="体检数据"
                                                width="100">
                                            <template slot-scope="scope">
                                                <el-button @click="handleClick7(scope.row)" type="text" size="small">查看
                                                </el-button>
                                            </template>
                                        </el-table-column>
                                        <el-table-column
                                                label="操作"
                                                width="100"
                                                prop="isv">
                                            <template slot-scope="scope" v-if="scope.row.isv==0">
                                                <el-button @click="handleClick3(scope.row)" type="text" size="small">不通过
                                                </el-button>
                                                <el-button @click="handleClick4(scope.row)" type="text" size="small">
                                                    通过
                                                </el-button>
                                            </template>
                                        </el-table-column>
                                    </el-table>
                                    <el-drawer
                                            title="体检数据"
                                            :visible.sync="drawer1"
                                            :direction="direction">
                                        <div id="PhyExam">
                                            <el-form :label-position="labelPosition" label-width="100px"
                                                     :model="PhyExam">
                                                <el-divider>生命体征（包括体温、脉搏及血压）</el-divider>

                                                <el-form-item label="体温">
                                                    <el-input v-model="PhyExam.pe_body_temperature" disabled>
                                                        <i slot="suffix"
                                                           style="font-style:normal;margin-right: 20px;">℃</i>
                                                    </el-input>
                                                </el-form-item>
                                                <el-form-item label="脉搏">
                                                    <el-input v-model="PhyExam.pe_pulse" disabled>
                                                        <i slot="suffix" style="font-style:normal;margin-right: 20px;">次/分</i>
                                                    </el-input>
                                                </el-form-item>
                                                <el-form-item label="血压">
                                                    <el-input v-model="PhyExam.pe_blood_pressure" disabled>
                                                        <i slot="suffix" style="font-style:normal;margin-right: 20px;">mmHg</i>
                                                    </el-input>
                                                </el-form-item>
                                                <el-divider>体格检查</el-divider>
                                                <el-form-item label="皮肤">
                                                    <el-radio v-model="PhyExam.pe_skin" v-if="PhyExam.pe_skin==0"
                                                              label="0" border>正常
                                                    </el-radio>
                                                    <el-radio v-model="PhyExam.pe_skin" v-else label="1" border>异常
                                                    </el-radio>
                                                </el-form-item>
                                                <el-form-item label="淋巴结">
                                                    <el-radio v-model="PhyExam.pe_lymph_nodes" label="0"
                                                              v-if="PhyExam.pe_lymph_nodes==0" border>正常
                                                    </el-radio>
                                                    <el-radio v-model="PhyExam.pe_lymph_nodes" v-else label="1" border>
                                                        异常
                                                    </el-radio>
                                                </el-form-item>
                                                <el-form-item label="头颈">
                                                    <el-radio v-model="PhyExam.pe_neck" label="0"
                                                              v-if="PhyExam.pe_neck==0" border>正常
                                                    </el-radio>
                                                    <el-radio v-model="PhyExam.pe_neck" label="1" v-else border>异常
                                                    </el-radio>
                                                </el-form-item>
                                                <el-form-item label="胸部">
                                                    <el-radio v-model="PhyExam.pe_chest" label="0"
                                                              v-if="PhyExam.pe_chest==0" border>正常
                                                    </el-radio>
                                                    <el-radio v-model="PhyExam.pe_chest" label="1" v-else border>异常
                                                    </el-radio>
                                                </el-form-item>
                                                <el-form-item label="腹部">
                                                    <el-radio v-model="PhyExam.pe_abdomen" label="0"
                                                              v-if="PhyExam.pe_abdomen==0" border>正常
                                                    </el-radio>
                                                    <el-radio v-model="PhyExam.pe_abdomen" label="1" v-else border>异常
                                                    </el-radio>
                                                </el-form-item>
                                                <el-form-item label="脊椎">
                                                    <el-radio v-model="PhyExam.pe_spine" label="0"
                                                              v-if="PhyExam.pe_spine==0" border>正常
                                                    </el-radio>
                                                    <el-radio v-model="PhyExam.pe_spine" label="1" v-else border>异常
                                                    </el-radio>
                                                </el-form-item>
                                                <el-form-item label="四肢">
                                                    <el-radio v-model="PhyExam.pe_limbs" label="0"
                                                              v-if="PhyExam.pe_limbs==0" border>正常
                                                    </el-radio>
                                                    <el-radio v-model="PhyExam.pe_limbs" label="1" v-else border>异常
                                                    </el-radio>
                                                </el-form-item>
                                                <el-form-item label="其他">
                                                    <el-input v-model="PhyExam.pe_other" disabled></el-input>
                                                </el-form-item>
                                                <el-form-item label="身高">
                                                    <el-input v-model="PhyExam.pe_height" disabled>
                                                        <i slot="suffix" style="font-style:normal;margin-right: 20px;">CM</i>
                                                    </el-input>
                                                </el-form-item>
                                                <el-form-item label="体重">
                                                    <el-input v-model="PhyExam.pe_weight" disabled>
                                                        <i slot="suffix" style="font-style:normal;margin-right: 20px;">KG</i>
                                                    </el-input>
                                                </el-form-item>
                                                <el-divider>导联心电图、血常规、尿常规等</el-divider>
                                                <el-form-item label="导联心电图">
                                                    <el-radio v-model="PhyExam.pe_ECG" label="0"
                                                              v-if="PhyExam.pe_ECG==0" border>正常
                                                    </el-radio>
                                                    <el-radio v-model="PhyExam.pe_ECG" label="1" v-else border>异常
                                                    </el-radio>
                                                </el-form-item>
                                                <el-form-item label="血常规">
                                                    <el-radio v-model="PhyExam.pe_blood_routine" label="0"
                                                              v-if="PhyExam.pe_blood_routine==0" border>正常
                                                    </el-radio>
                                                    <el-radio v-model="PhyExam.pe_blood_routine" label="1" v-else
                                                              border>异常
                                                    </el-radio>
                                                </el-form-item>
                                                <el-form-item label="尿常规">
                                                    <el-radio v-model="PhyExam.pe_urine_routine" label="0"
                                                              v-if="PhyExam.pe_urine_routine==0" border>正常
                                                    </el-radio>
                                                    <el-radio v-model="PhyExam.pe_urine_routine" label="1" v-else
                                                              border>异常
                                                    </el-radio>
                                                </el-form-item>
                                                <el-form-item label="血生化">
                                                    <el-radio v-model="PhyExam.pe_blood_chemistry" label="0"
                                                              v-if="PhyExam.pe_blood_chemistry==0" border>正常
                                                    </el-radio>
                                                    <el-radio v-model="PhyExam.pe_blood_chemistry" label="1" v-else
                                                              border>异常
                                                    </el-radio>
                                                </el-form-item>
                                                <el-form-item label="凝血功能">
                                                    <el-radio v-model="PhyExam.pe_coagulation" label="0"
                                                              v-if="PhyExam.pe_coagulation==0" border>正常
                                                    </el-radio>
                                                    <el-radio v-model="PhyExam.pe_coagulation" label="1" v-else border>
                                                        异常
                                                    </el-radio>
                                                </el-form-item>
                                                <el-divider></el-divider>
                                                <el-form-item label="妊娠检查">
                                                    <el-radio v-model="PhyExam.pe_pregnancy" label="0"
                                                              v-if="PhyExam.pe_pregnancy==0" border>正常
                                                    </el-radio>
                                                    <el-radio v-model="PhyExam.pe_pregnancy" label="1" v-else border>异常
                                                    </el-radio>
                                                </el-form-item>
                                                <el-form-item label="吸烟">
                                                    <el-radio v-model="PhyExam.pe_smoking" label="0"
                                                              v-if="PhyExam.pe_smoking==0" border>否
                                                    </el-radio>
                                                    <el-radio v-model="PhyExam.pe_smoking" label="1" v-else border>是
                                                    </el-radio>
                                                </el-form-item>
                                                <el-form-item label="喝酒">
                                                    <el-radio v-model="PhyExam.pe_drinking" label="0"
                                                              v-if="PhyExam.pe_drinking==0" border>否
                                                    </el-radio>
                                                    <el-radio v-model="PhyExam.pe_drinking" label="1" v-else border>是
                                                    </el-radio>
                                                </el-form-item>
                                            </el-form>
                                        </div>
                                    </el-drawer>
                                </div>
                            </div>
                            <div v-show="index==4">
                                <div id="MessageListDiv">
                                    <el-table
                                            :data="MessageList"
                                            border
                                            style="width:100%"
                                            :row-class-name="tableRowClassName2">
                                        <el-table-column
                                                prop="m_id"
                                                label="文章ID"
                                                width="200">
                                        </el-table-column>
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
                                                prop="m_author"
                                                label="文章作者"
                                                width="200">
                                        </el-table-column>
                                        <el-table-column
                                                prop="m_mark"
                                                label="操作"
                                                width="200">
                                            <template slot-scope="scope" v-if="scope.row.m_mark==0">
                                                <el-button @click="handleClick8(scope.row)" type="text" size="small">不通过
                                                </el-button>
                                                <el-button @click="handleClick9(scope.row)" type="text" size="small">
                                                    通过
                                                </el-button>
                                            </template>
                                        </el-table-column>
                                    </el-table>
                                </div>
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
                        enterprisePage: {
                            currentPage: 1,
                            total: '',
                            pageSize: 5,
                        },
                        DragListPage: {
                            currentPage: 1,
                            total: '',
                            pageSize: 5,
                        },
                        direction: 'rtl',
                        drawer: false,
                        drawer1: false,
                        activeName: 'second',
                        index: '1',
                        labelPosition: 'left',
                        recruitList: [],
                        addEnterprise: {
                            e_name: '',
                            e_id: '',
                            e_password: ''
                        },
                        DragList: [],
                        enterpriseList: [{
                            e_id: '',
                            e_name: '',
                            e_password: '',
                            e_phone: '',
                            e_email: '',
                            e_address: ''
                        },],
                        updateEnterprise: {
                            e_id: '',
                            e_name: '',
                            e_password: '',
                            e_phone: '',
                            e_email: '',
                            e_address: ''
                        },
                        PhyExam: {
                            pe_id: '',
                            pe_u_id: '',
                            pe_rl_id: '',
                            pe_ra_id: '',
                            pe_e_id: '',
                            pe_body_temperature: '',
                            pe_pulse: '',
                            pe_blood_pressure: '',
                            pe_skin: '',
                            pe_lymph_nodes: '',
                            pe_neck: '',
                            pe_chest: '',
                            pe_abdomen: '',
                            pe_spine: '',
                            pe_limbs: '',
                            pe_other: '',
                            pe_height: '',
                            pe_weight: '',
                            pe_ECG: '',
                            pe_blood_routine: '',
                            pe_urine_routine: '',
                            pe_blood_chemistry: '',
                            pe_coagulation: '',
                            pe_pregnancy: '',
                            pe_smoking: '',
                            pe_drinking: '',
                        },
                        MessageList: [],
                    };
                },
                filters: {
                    sexFilter(value) {
                        if (value === 0)
                            return '男'
                        else
                            return '女'
                    },
                },
                methods: {
                    handleSizeChange1(val) {
                        console.log(`每页 ${val} 条`);
                        this.enterprisePage.currentPage = 1;
                        this.enterprisePage.pageSize = val;
                    },
                    handleCurrentChange1(val) {
                        console.log(`当前页: ${val}`);
                        this.enterprisePage.currentPage = val;
                    },
                    handleSizeChange2(val) {
                        console.log(`每页 ${val} 条`);
                        this.DragListPage.currentPage = 1;
                        this.DragListPage.pageSize = val;
                    },
                    handleCurrentChange2(val) {
                        console.log(`当前页: ${val}`);
                        this.DragListPage.currentPage = val;
                    },
                    m_typeFormatter(row, colum) {
                        if (row.m_type == 0)
                            return '药物知识'
                        else if (row.d_mark == 1)
                            return '药物发布'
                        else
                            return '公司新闻'
                    },
                    tableRowClassName({row, rowIndex}) {
                        if (row.d_approve === 0) {
                            return 'warning-row';
                        } else if (row.d_approve === 1) {
                            return 'success-row';
                        } else {
                            return 'error-row'
                        }
                    },
                    tableRowClassName2({row, rowIndex}) {
                        if (row.m_mark === 0) {
                            return 'warning-row';
                        } else if (row.m_mark === 1) {
                            return 'success-row';
                        } else {
                            return 'error-row'
                        }
                    },
                    tableRowClassName1({row, rowIndex}) {
                        if (row.isv == 0) {
                            return 'warning-row';
                        } else if (row.isv == 1) {
                            return 'success-row';
                        } else {
                            return 'error-row'
                        }
                    },
                    d_mark_typeFormatter(row, colum) {
                        if (row.d_mark == 1)
                            return '甲类OTC'
                        else if (row.d_mark == 2)
                            return '乙类OTC'
                        else
                            return '保健品'
                    },
                    sexTypeFormatter(row, column) {
                        if (row.rl_user_sex === 0)
                            return '男'
                        else
                            return '女'
                    },
                    smokeTypeFormatter(row, column) {
                        if (row.rl_issmoke === 0)
                            return '否'
                        else
                            return '是'
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
                        deleteEnterprise(row.e_id);
                    },
                    handleClick2(row) {
                        this.drawer = 'true';
                        this.updateEnterprise = row

                    },
                    handleClick3(row) {
                        changeRecruitListisv(row.rl_id, 2);
                    },
                    handleClick4(row) {
                        updateARlUE(row.rl_id, row.rl_u_id);
                        changeRecruitListisv(row.rl_id, 1);
                    },
                    handleClick5(row) {
                        changeDragDApprove(row.d_id, 2);
                    },
                    handleClick6(row) {
                        changeDragDApprove(row.d_id, 1);
                    },
                    handleClick7(row) {
                        getPhyExam(row.rl_id);
                        this.drawer1 = true;
                    },
                    handleClick8(row) {
                        changeMessageMMark(row.m_id, 2);
                    },
                    handleClick9(row) {
                        changeMessageMMark(row.m_id, 1);
                    },
                    select(index, indexPath) {
                        app.index = index;
                    },
                    onSubmit() {
                        addEnterprise();
                    },
                },
                created: function () {
                    getEnterpriseList();
                    getRecruitList();
                    getDragList();
                    getMessageList();
                }
            })
        </script>
    </body>
</html>
