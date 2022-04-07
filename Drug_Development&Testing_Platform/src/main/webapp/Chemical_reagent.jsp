<%@ page import="com.WPF.domain.Researcher" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
    Researcher researcher = (Researcher) session.getAttribute("researcher");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>化学药物（制剂）</title>
        <base href="<%=basePath%>">
        <meta charset="utf-8">
        <script src="js/vue.min.js" type="text/javascript" charset="utf-8"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="lib-master/theme-chalk/index.css"/>
        <link rel="stylesheet" type="text/css" href="u_css/footer.css"/>
        <link rel="stylesheet" type="text/css" href="u_css/researcher.css"/>
        <script src="u_js/date.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/jquery-3.6.0.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="lib-master/index.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript">
            function getDragList() {
                $.ajax({
                    url: "enterprise/getDragListWithApprove",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"e_id": JSON.stringify(document.getElementById("e_id").textContent)},
                    success: function (reps) {
                        console.log(reps)
                        app.DragList = reps;
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function getVolunteers() {
                console.log(document.getElementById("ra_id").textContent)
                $.ajax({
                    url: "researcher/getVolunteers",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"ra_id": JSON.stringify(document.getElementById("ra_id").textContent)},
                    success: function (reps) {
                        console.log(reps)
                        app.volunteers = reps;
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function submitCRF() {
                app.DC.c_ra_id = document.getElementById("ra_id").textContent;
                $.ajax({
                    url: "researcher/submitCRF",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {
                        "DC": JSON.stringify(this.app.DC),
                        "crf_blood_routine": JSON.stringify(this.app.crf_blood_routine),
                        "crf_urine_routine": JSON.stringify(this.app.crf_urine_routine),
                        "crf_bowel_routine": JSON.stringify(this.app.crf_bowel_routine),
                        "crf_blood_chemistry": JSON.stringify(this.app.crf_blood_chemistry),
                        "crf_ecog": JSON.stringify(this.app.crf_ecog),
                        "crf_vital_signs": JSON.stringify(this.app.crf_vital_signs),
                        "crf_physical_examination": JSON.stringify(this.app.crf_physical_examination),
                    },
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./Chemical_reagent.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function getCRFList() {
                $.ajax({
                    url: "researcher/getCRFListByRaId",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"ra_id": JSON.stringify(document.getElementById("ra_id").textContent)},
                    success: function (reps) {
                        console.log(reps)
                        app.CRFList = reps;
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function getPDF(c_id) {
                window.location.href = "jasper/exportPdf?c_id=" + c_id + "&type=pdf"
            }
        </script>
    </head>
    <body>
        <div class="param" id="e_id">${researcher.ra_e_id}</div>
        <div class="param" id="ra_id">${researcher.ra_id}</div>
        <div id="app">
            <el-container>
                <el-header>
                    <div id="header" onclick="window.location.href = './index.jsp'">庵东镇药物研发试测平台</div>
                    <div id="btn-7" class="btn-s">
                        <span onclick="">你好，${researcher.ra_name}</span>
                    </div>
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
                                        <span slot="title">药物测试数据录入</span>
                                    </el-menu-item>
                                    <el-menu-item index="2">
                                        <i class="el-icon-document"></i>
                                        <span slot="title">测试报告查看</span>
                                    </el-menu-item>
                                </el-menu>
                            </el-col>
                        </el-row>
                    </el-aside>
                    <el-container>
                        <el-main>
                            <div v-show="index==1">
                                <div id="addTest">
                                    <el-row :gutter="20">
                                        <el-col :span="6">
                                            <div class="grid-content bg-purple">
                                                志愿者：
                                                <el-select v-model="DC.c_user_id" placeholder="请选择"
                                                           style="width: 200px">
                                                    <el-option
                                                            v-for="item in volunteers"
                                                            :key="item.user_id"
                                                            :label="item.user_name"
                                                            :value="item.user_id">
                                                    </el-option>
                                                </el-select>
                                            </div>
                                        </el-col>
                                        <el-col :span="6">
                                            <div class="grid-content bg-purple">
                                                测试药物：
                                                <el-select v-model="DC.d_id" placeholder="请选择" style="width: 200px">
                                                    <el-option
                                                            v-for="item in DragList"
                                                            :key="item.d_id"
                                                            :label="item.d_trade_name"
                                                            :value="item.d_id">
                                                    </el-option>
                                                </el-select>
                                            </div>
                                        </el-col>
                                        <el-col :span="6">
                                            <div class="grid-content bg-purple">
                                                提交时间：
                                                <el-date-picker
                                                        v-model="DC.c_date"
                                                        type="date"
                                                        placeholder="选择日期"
                                                        value-format="yyyy-MM-dd"
                                                        style="width: 200px">
                                                </el-date-picker>
                                            </div>
                                        </el-col>
                                        <el-col :span="6">
                                            <div class="grid-content bg-purple">
                                                <el-button type="primary" onclick="submitCRF()">提交数据</el-button>
                                            </div>
                                        </el-col>
                                    </el-row>
                                </div>
                                <div id="formTab">
                                    <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
                                        <el-tab-pane label="血常规" name="crf_blood_routine">
                                            <el-form ref="crf_blood_routine" :model="crf_blood_routine"
                                                     label-width="80px"
                                                     style="width: 1200px;margin-left: auto;margin-right: auto;">
                                                <el-row :gutter="20" style="text-align:left">
                                                    <el-col :span="6">
                                                        <div class="grid-content bg-purple">
                                                            本周第一次检查测试时间：
                                                            <el-date-picker
                                                                    v-model="crf_blood_routine.c_date_one"
                                                                    type="date"
                                                                    placeholder="选择日期"
                                                                    value-format="yyyy-MM-dd"
                                                                    style="width: 200px">
                                                            </el-date-picker>
                                                        </div>
                                                    </el-col>
                                                </el-row>
                                                <table class="table table-bordered" style="height: 100px">
                                                    <tr>
                                                        <th>测定项目</th>
                                                        <th>测定值</th>
                                                        <th>临床意义*</th>
                                                    </tr>
                                                    <tr>
                                                        <td>血红蛋白Hb（g/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_routine.c_one_Hb"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_routine.c_one_Hb_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>红细胞RBC（X 10<sup>12</sup>/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_routine.c_one_RBC"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_routine.c_one_RBC_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>血小板PLT（X10<sup>9</sup>/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_routine.c_one_PLT"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_routine.c_one_PLT_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>白细胞WBC（X10<sup>9</sup>/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_routine.c_one_WBC"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_routine.c_one_WBC_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>中性粒细胞计数NEU（X10<sup>9</sup>/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_routine.c_one_NEU"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_routine.c_one_NEU_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>淋巴细胞计数LYM（X10<sup>9</sup>/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_routine.c_one_LYM"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_routine.c_one_LYM_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </el-form>
                                            <div></div>
                                            <el-form ref="crf_blood_routine" :model="crf_blood_routine"
                                                     label-width="80px"
                                                     style="width: 1200px;margin-left: auto;margin-right: auto;">
                                                <el-row :gutter="20" style="text-align:left">
                                                    <el-col :span="6">
                                                        <div class="grid-content bg-purple">
                                                            本周第二次检查测试时间：
                                                            <el-date-picker
                                                                    v-model="crf_blood_routine.c_date_two"
                                                                    type="date"
                                                                    placeholder="选择日期"
                                                                    value-format="yyyy-MM-dd"
                                                                    style="width: 200px">
                                                            </el-date-picker>
                                                        </div>
                                                    </el-col>
                                                </el-row>
                                                <table class="table table-bordered" style="height: 100px">
                                                    <tr>
                                                        <th>测定项目</th>
                                                        <th>测定值</th>
                                                        <th>临床意义*</th>
                                                    </tr>
                                                    <tr>
                                                        <td>血红蛋白Hb（g/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_routine.c_two_Hb"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_routine.c_two_Hb_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>红细胞RBC（X 10<sup>12</sup>/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_routine.c_two_RBC"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_routine.c_two_RBC_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>血小板PLT（X10<sup>9</sup>/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_routine.c_two_PLT"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_routine.c_two_PLT_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>白细胞WBC（X10<sup>9</sup>/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_routine.c_two_WBC"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_routine.c_two_WBC_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>中性粒细胞计数NEU（X10<sup>9</sup>/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_routine.c_two_NEU"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_routine.c_two_NEU_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>淋巴细胞计数LYM（X10<sup>9</sup>/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_routine.c_two_LYM"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_routine.c_two_LYM_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </el-form>
                                            *临床意义:1.正常;2.异常无临床意义;3.异常有临床意义;4.未查
                                        </el-tab-pane>
                                        <el-tab-pane label="尿常规" name="crf_urine_routine">
                                            <el-form ref="crf_blood_routine" :model="crf_urine_routine"
                                                     label-width="80px"
                                                     style="width: 1200px;margin-left: auto;margin-right: auto;">
                                                <el-row :gutter="20" style="text-align:left">
                                                    <el-col :span="6">
                                                        <div class="grid-content bg-purple">
                                                            检查日期：
                                                            <el-date-picker
                                                                    v-model="crf_urine_routine.c_date"
                                                                    type="date"
                                                                    placeholder="选择日期"
                                                                    value-format="yyyy-MM-dd"
                                                                    style="width: 200px">
                                                            </el-date-picker>
                                                        </div>
                                                    </el-col>
                                                </el-row>
                                                <table class="table table-bordered" style="height: 100px">
                                                    <tr>
                                                        <th>测定项目</th>
                                                        <th>测定值</th>
                                                        <th>临床意义*</th>
                                                    </tr>
                                                    <tr>
                                                        <td>尿蛋白（g/L或定性）</td>
                                                        <td>
                                                            <el-input v-model="crf_urine_routine.c_up"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_urine_routine.c_up_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>RBC（定量或定性）</td>
                                                        <td>
                                                            <el-input v-model="crf_urine_routine.c_RBC"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_urine_routine.c_RBC_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>WBC（定量或定性）</td>
                                                        <td>
                                                            <el-input v-model="crf_urine_routine.c_WBC"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_urine_routine.c_WBC_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>24小时尿蛋白定量（g/24小时）</td>
                                                        <td>
                                                            <el-input v-model="crf_urine_routine.c_up24"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_urine_routine.c_up24_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </el-form>
                                            *临床意义:1.正常;2.异常无临床意义;3.异常有临床意义;4.未查
                                        </el-tab-pane>
                                        <el-tab-pane label="大便常规" name="crf_bowel_routine">
                                            <el-form ref="crf_bowel_routine" :model="crf_bowel_routine"
                                                     label-width="80px"
                                                     style="width: 1200px;margin-left: auto;margin-right: auto;">
                                                <el-row :gutter="20" style="text-align:left">
                                                    <el-col :span="6">
                                                        <div class="grid-content bg-purple">
                                                            检查日期：
                                                            <el-date-picker
                                                                    v-model="crf_bowel_routine.c_date"
                                                                    type="date"
                                                                    placeholder="选择日期"
                                                                    value-format="yyyy-MM-dd"
                                                                    style="width: 200px">
                                                            </el-date-picker>
                                                        </div>
                                                    </el-col>
                                                </el-row>
                                                <table class="table table-bordered" style="height: 100px">
                                                    <tr>
                                                        <th>测定项目</th>
                                                        <th>测定值</th>
                                                        <th>临床意义*</th>
                                                    </tr>
                                                    <tr>
                                                        <td>隐血</td>
                                                        <td>
                                                            <el-input v-model="crf_bowel_routine.c_ob"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_bowel_routine.c_ob_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </el-form>
                                            *临床意义:1.正常;2.异常无临床意义;3.异常有临床意义;4.未查
                                        </el-tab-pane>
                                        <el-tab-pane label="血生化" name="crf_blood_chemistry">
                                            <el-form ref="crf_blood_chemistry" :model="crf_blood_chemistry"
                                                     label-width="80px"
                                                     style="width: 1200px;margin-left: auto;margin-right: auto;">
                                                <el-row :gutter="20" style="text-align:left">
                                                    <el-col :span="6">
                                                        <div class="grid-content bg-purple">
                                                            检查日期：
                                                            <el-date-picker
                                                                    v-model="crf_blood_chemistry.c_date"
                                                                    type="date"
                                                                    placeholder="选择日期"
                                                                    value-format="yyyy-MM-dd"
                                                                    style="width: 200px">
                                                            </el-date-picker>
                                                        </div>
                                                    </el-col>
                                                </el-row>
                                                <table class="table table-bordered" style="height: 100px">
                                                    <tr>
                                                        <th>测定项目</th>
                                                        <th>测定值</th>
                                                        <th>临床意义*</th>
                                                    </tr>
                                                    <tr>
                                                        <td>总胆红素TBIL（μmol/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_chemistry.c_TBIL"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_chemistry.c_TBIL_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>直接胆红素DBIL（μmol/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_chemistry.c_DBIL"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_chemistry.c_DBIL_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>间接胆红素IBIL（μmol/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_chemistry.c_IBIL"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_chemistry.c_IBIL_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>谷丙转氨酶ALT（U/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_chemistry.c_ALT"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_chemistry.c_ALT_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>谷草转氨酶AST（U/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_chemistry.c_AST"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_chemistry.c_AST_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>碱性磷酸酶AKP（U/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_chemistry.c_AKP"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_chemistry.c_AKP_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>γ-谷氨酰转肽酶γ-GT（U/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_chemistry.c_GT"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_chemistry.c_GT_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>总蛋白TP（g/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_chemistry.c_TP"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_chemistry.c_TP_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>白蛋白ALB（g/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_chemistry.c_ALB"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_chemistry.c_ALB_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>尿素氮BUN（mmol/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_chemistry.c_BUN"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_chemistry.c_BUN_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>肌酐Cr（μmol/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_chemistry.c_Cr"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_chemistry.c_Cr_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>血糖GLU（mmol/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_chemistry.c_GLU"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_chemistry.c_GLU_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>血钾K（mmol/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_chemistry.c_K"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_chemistry.c_K_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>血钠Na（mmol/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_chemistry.c_Na"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_chemistry.c_Na_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>血氯Cl（mmol/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_chemistry.c_Cl"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_chemistry.c_Cl_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>血钙Ca（mmol/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_chemistry.c_Ca"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_chemistry.c_Ca_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>血镁Mg（mmol/L）</td>
                                                        <td>
                                                            <el-input v-model="crf_blood_chemistry.c_Mg"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-select v-model="crf_blood_chemistry.c_Mg_n"
                                                                       placeholder="请选择">
                                                                <el-option
                                                                        v-for="item in options"
                                                                        :key="item.value"
                                                                        :label="item.label"
                                                                        :value="item.value">
                                                                </el-option>
                                                            </el-select>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </el-form>
                                            *临床意义:1.正常;2.异常无临床意义;3.异常有临床意义;4.未查
                                        </el-tab-pane>
                                        <el-tab-pane label="ECOG" name="crf_ecog">
                                            <el-form ref="crf_ecog" :model="crf_ecog"
                                                     label-width="80px"
                                                     style="width: 1200px;margin-left: auto;margin-right: auto;">
                                                <el-row :gutter="20" style="text-align:left">
                                                    <el-col :span="6">
                                                        <div class="grid-content bg-purple">
                                                            检查日期：
                                                            <el-date-picker
                                                                    v-model="crf_ecog.c_date"
                                                                    type="date"
                                                                    placeholder="选择日期"
                                                                    value-format="yyyy-MM-dd"
                                                                    style="width: 200px">
                                                            </el-date-picker>
                                                        </div>
                                                    </el-col>
                                                </el-row>
                                                <table class="table table-bordered" style="height: 100px">
                                                    <tr>
                                                        <th>领域（维度）</th>
                                                        <th>性质</th>
                                                        <th>条目数</th>
                                                        <th>得分全距（R）</th>
                                                        <th>计分</th>
                                                    </tr>
                                                    <tr>
                                                        <td>躯体功能</td>
                                                        <td>功能型</td>
                                                        <td>5</td>
                                                        <td>3</td>
                                                        <td>
                                                            <el-input v-model="crf_ecog.c_filed1"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>角色功能</td>
                                                        <td>功能型</td>
                                                        <td>2</td>
                                                        <td>3</td>
                                                        <td>
                                                            <el-input v-model="crf_ecog.c_filed2"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>情绪功能</td>
                                                        <td>功能型</td>
                                                        <td>4</td>
                                                        <td>3</td>
                                                        <td>
                                                            <el-input v-model="crf_ecog.c_filed3"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>认知功能</td>
                                                        <td>功能型</td>
                                                        <td>2</td>
                                                        <td>3</td>
                                                        <td>
                                                            <el-input v-model="crf_ecog.c_filed4"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>社会功能</td>
                                                        <td>功能型</td>
                                                        <td>2</td>
                                                        <td>3</td>
                                                        <td>
                                                            <el-input v-model="crf_ecog.c_filed5"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>疲倦</td>
                                                        <td>症状型</td>
                                                        <td>3</td>
                                                        <td>3</td>
                                                        <td>
                                                            <el-input v-model="crf_ecog.c_filed6"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>恶心和呕吐</td>
                                                        <td>症状型</td>
                                                        <td>2</td>
                                                        <td>3</td>
                                                        <td>
                                                            <el-input v-model="crf_ecog.c_filed7"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>疼痛</td>
                                                        <td>症状型</td>
                                                        <td>2</td>
                                                        <td>3</td>
                                                        <td>
                                                            <el-input v-model="crf_ecog.c_filed8"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>气促</td>
                                                        <td>症状型</td>
                                                        <td>1</td>
                                                        <td>3</td>
                                                        <td>
                                                            <el-input v-model="crf_ecog.c_filed9"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>失眠</td>
                                                        <td>症状型</td>
                                                        <td>1</td>
                                                        <td>3</td>
                                                        <td>
                                                            <el-input v-model="crf_ecog.c_filed10"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>食欲丧失</td>
                                                        <td>症状型</td>
                                                        <td>1</td>
                                                        <td>3</td>
                                                        <td>
                                                            <el-input v-model="crf_ecog.c_filed11"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>便秘</td>
                                                        <td>症状型</td>
                                                        <td>1</td>
                                                        <td>3</td>
                                                        <td>
                                                            <el-input v-model="crf_ecog.c_filed12"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>腹泻</td>
                                                        <td>症状型</td>
                                                        <td>1</td>
                                                        <td>3</td>
                                                        <td>
                                                            <el-input v-model="crf_ecog.c_filed13"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>经济困难</td>
                                                        <td>症状型</td>
                                                        <td>1</td>
                                                        <td>3</td>
                                                        <td>
                                                            <el-input v-model="crf_ecog.c_filed14"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">总健康状况</td>
                                                        <td>2</td>
                                                        <td>6</td>
                                                        <td>
                                                            <el-input v-model="crf_ecog.c_filed15"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">标准化得分-功能邻域</td>
                                                        <td colspan="2">
                                                            <el-input v-model="crf_ecog.c_filed16"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">标准化得分-症状领域和总体健康状况领域</td>
                                                        <td colspan="2">
                                                            <el-input v-model="crf_ecog.c_filed17"></el-input>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </el-form>
                                        </el-tab-pane>
                                        <el-tab-pane label="生命体征" name="crf_vital_signs">
                                            <el-form ref="crf_ecog" :model="crf_ecog"
                                                     label-width="80px"
                                                     style="width: 1200px;margin-left: auto;margin-right: auto;">
                                                <el-row :gutter="20" style="text-align:left">
                                                    <el-col :span="6">
                                                        <div class="grid-content bg-purple">
                                                            检查日期：
                                                            <el-date-picker
                                                                    v-model="crf_vital_signs.c_date"
                                                                    type="date"
                                                                    placeholder="选择日期"
                                                                    value-format="yyyy-MM-dd"
                                                                    style="width: 200px">
                                                            </el-date-picker>
                                                        </div>
                                                    </el-col>
                                                </el-row>
                                                <table class="table table-bordered" style="height: 100px">
                                                    <tr>
                                                        <th>体温（℃）</th>
                                                        <th>心率（次/分）</th>
                                                        <th>呼吸频率（次/分）</th>
                                                        <th>血压（mmHg）</th>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <el-input v-model="crf_vital_signs.c_BT"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-input v-model="crf_vital_signs.c_HR"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-input v-model="crf_vital_signs.c_RR"></el-input>
                                                        </td>
                                                        <td>
                                                            <el-input v-model="crf_vital_signs.c_BP"></el-input>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </el-form>
                                        </el-tab-pane>
                                        <el-tab-pane label="体格检查" name="crf_physical_examination">
                                            <el-form ref="crf_physical_examination" :model="crf_physical_examination"
                                                     label-width="80px"
                                                     style="width: 1200px;margin-left: auto;margin-right: auto;">
                                                <el-row :gutter="20" style="text-align:left">
                                                    <el-col :span="6">
                                                        <div class="grid-content bg-purple">
                                                            检查日期：
                                                            <el-date-picker
                                                                    v-model="crf_physical_examination.c_date"
                                                                    type="date"
                                                                    placeholder="选择日期"
                                                                    value-format="yyyy-MM-dd"
                                                                    style="width: 200px">
                                                            </el-date-picker>
                                                        </div>
                                                    </el-col>
                                                </el-row>
                                                <table class="table table-bordered" style="height: 100px">
                                                    <tr>
                                                        <th>检查项目</th>
                                                        <th>正常</th>
                                                        <th>异常</th>
                                                        <th>未查</th>
                                                        <th>如体检有异常，请说明</th>
                                                    </tr>
                                                    <tr>
                                                        <td>一般情况</td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_generally"
                                                                      label="1"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_generally"
                                                                      label="2"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_generally"
                                                                      label="3"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-input
                                                                    v-model="crf_physical_examination.c_generally"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>皮肤粘膜</td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_SaMM"
                                                                      label="1"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_SaMM"
                                                                      label="2"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_SaMM"
                                                                      label="3"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-input
                                                                    v-model="crf_physical_examination.c_SaMM"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>头部</td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_head"
                                                                      label="1"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_head"
                                                                      label="2"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_head"
                                                                      label="3"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-input
                                                                    v-model="crf_physical_examination.c_head"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>颈部</td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_neck"
                                                                      label="1"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_neck"
                                                                      label="2"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_neck"
                                                                      label="3"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-input
                                                                    v-model="crf_physical_examination.c_neck"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>胸部</td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_chest"
                                                                      label="1"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_chest"
                                                                      label="2"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_chest"
                                                                      label="3"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-input
                                                                    v-model="crf_physical_examination.c_chest"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>腹部</td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_abdomen"
                                                                      label="1"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_abdomen"
                                                                      label="2"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_abdomen"
                                                                      label="3"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-input
                                                                    v-model="crf_physical_examination.c_abdomen"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>脊柱/四肢</td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_SaE"
                                                                      label="1"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_SaE"
                                                                      label="2"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_SaE"
                                                                      label="3"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-input
                                                                    v-model="crf_physical_examination.c_SaE"></el-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>其他</td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_other"
                                                                      label="1"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_other"
                                                                      label="2"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-radio v-model="crf_physical_examination.c_other"
                                                                      label="3"></el-radio>
                                                        </td>
                                                        <td>
                                                            <el-input
                                                                    v-model="crf_physical_examination.c_other"></el-input>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </el-form>
                                        </el-tab-pane>
                                    </el-tabs>
                                </div>
                            </div>
                            <div v-show="index==2">
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
                                            <el-button @click="handleClick1(scope.row)" type="text" size="small">查看
                                            </el-button>
                                        </template>
                                    </el-table-column>
                                </el-table>
                            </div>
                        </el-main>
                        <el-footer>
                            &copy; 2022 毕业设计 | Design by 201805020527王潘锋
                        </el-footer>
                    </el-container>
                </el-container>
            </el-container>
        </div>
        <script type="text/javascript">
            var app = new Vue({
                el: '#app',
                data() {
                    return {
                        options: [{
                            value: '1',
                            label: '1'
                        }, {
                            value: '2',
                            label: '2'
                        }, {
                            value: '3',
                            label: '3'
                        }, {
                            value: '4',
                            label: '4'
                        }],
                        activeName: 'crf_blood_routine',
                        volunteers: [],
                        DragList: [],
                        DC: {
                            d_id: '',
                            c_id: '',
                            c_user_id: '',
                            c_ra_id: '',
                            c_date: '',
                        },
                        CRFList: [],
                        crf_blood_routine: {
                            c_id: '',
                            c_user_id: '',
                            c_ra_id: '',
                            c_date_one: '',
                            c_one_Hb: '',
                            c_one_Hb_n: '',
                            c_one_RBC_n: '',
                            c_one_RBC: '',
                            c_one_PLT: '',
                            c_one_PLT_n: '',
                            c_one_WBC: '',
                            c_one_WBC_n: '',
                            c_one_NEU: '',
                            c_one_NEU_n: '',
                            c_one_LYM: '',
                            c_one_LYM_n: '',
                            c_date_two: '',
                            c_two_Hb: '',
                            c_two_Hb_n: '',
                            c_two_RBC: '',
                            c_two_RBC_n: '',
                            c_two_PLT: '',
                            c_two_PLT_n: '',
                            c_two_WBC: '',
                            c_two_WBC_n: '',
                            c_two_NEU: '',
                            c_two_NEU_n: '',
                            c_two_LYM: '',
                            c_two_LYM_n: '',
                        },
                        crf_urine_routine: {
                            c_id: '',
                            c_user_id: '',
                            c_ra_id: '',
                            c_date: '',
                            c_up: '',
                            c_up_n: '',
                            c_RBC: '',
                            c_RBC_n: '',
                            c_WBC: '',
                            c_WBC_n: '',
                            c_up24: '',
                            c_up24_n: '',
                        },
                        crf_bowel_routine: {
                            c_id: '',
                            c_user_id: '',
                            c_ra_id: '',
                            c_date: '',
                            c_ob: '',
                            c_ob_n: '',
                        },
                        crf_blood_chemistry: {
                            c_id: '',
                            c_user_id: '',
                            c_ra_id: '',
                            c_date: '',
                            c_TBIL: '',
                            c_TBIL_n: '',
                            c_DBIL: '',
                            c_DBIL_n: '',
                            c_IBIL: '',
                            c_IBIL_n: '',
                            c_ALT: '',
                            c_ALT_n: '',
                            c_AST: '',
                            c_AST_n: '',
                            c_AKP: '',
                            c_AKP_n: '',
                            c_GT: '',
                            c_GT_n: '',
                            c_TP: '',
                            c_TP_n: '',
                            c_ALB: '',
                            c_ALB_n: '',
                            c_BUN: '',
                            c_BUN_n: '',
                            c_Cr: '',
                            c_Cr_n: '',
                            c_GLU: '',
                            c_GLU_n: '',
                            c_K: '',
                            c_K_n: '',
                            c_Na: '',
                            c_Na_n: '',
                            c_Cl: '',
                            c_Cl_n: '',
                            c_Ca: '',
                            c_Ca_n: '',
                            c_Mg: '',
                            c_Mg_n: '',
                        },
                        crf_ecog: {
                            c_id: '',
                            c_user_id: '',
                            c_ra_id: '',
                            c_date: '',
                            c_filed1: '',
                            c_filed2: '',
                            c_filed3: '',
                            c_filed4: '',
                            c_filed5: '',
                            c_filed6: '',
                            c_filed7: '',
                            c_filed8: '',
                            c_filed9: '',
                            c_filed10: '',
                            c_filed11: '',
                            c_filed12: '',
                            c_filed13: '',
                            c_filed14: '',
                            c_filed15: '',
                            c_filed16: '',
                            c_filed17: '',
                        },
                        crf_vital_signs: {
                            c_id: '',
                            c_user_id: '',
                            c_ra_id: '',
                            c_date: '',
                            c_BT: '',
                            c_HR: '',
                            c_RR: '',
                            c_BP: '',
                        },
                        crf_physical_examination: {
                            c_id: '',
                            c_user_id: '',
                            c_ra_id: '',
                            c_date: '',
                            c_generally: '',
                            c_SaMM: '',
                            c_head: '',
                            c_neck: '',
                            c_chest: '',
                            c_abdomen: '',
                            c_SaE: '',
                            c_other: '',
                        },
                        index: '1',
                    };
                },
                filters: {
                    dateFilter(value) {
                        var date = new Date(value);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
                        Y = date.getFullYear() + '-';
                        M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
                        D = date.getDate() + ' ';
                        h = date.getHours() + ':';
                        m = date.getMinutes() + ':';
                        s = date.getSeconds();
                        return Y + M + D + h + m + s;
                    },
                },
                methods: {
                    handleOpen(key, keyPath) {
                        console.log(key, keyPath);
                    },
                    select(index, indexPath) {
                        app.index = index;
                    },
                    handleClose(key, keyPath) {
                        console.log(key, keyPath);
                    },
                    handleClick(tab, event) {
                    },
                    handleClick1(row) {
                        getPDF(row.c_id);
                    },
                },
                created: function () {
                    getDragList();
                    getVolunteers();
                    getCRFList();
                },
            })
        </script>
    </body>
</html>
