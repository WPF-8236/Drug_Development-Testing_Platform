<%@ page import="com.WPF.domain.User" %>
<%@ page import="com.WPF.domain.Researcher" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
    Researcher researcher = (Researcher) session.getAttribute("researcher");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>志愿者体检</title>
        <base href="<%=basePath%>">
        <meta charset="utf-8">
        <script src="js/vue.min.js" type="text/javascript" charset="utf-8"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="lib-master/theme-chalk/index.css"/>
        <link rel="stylesheet" type="text/css" href="u_css/footer.css"/>
        <link rel="stylesheet" type="text/css" href="u_css/volunteerc.css"/>
        <link rel="stylesheet" type="text/css" href="u_css/page.css"/>
        <script src="u_js/date.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/jquery-3.6.0.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="lib-master/index.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript">
            function getRecruitList() {
                $.ajax({
                    url: "recruit/getRecruitList2",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"ra_e_id": JSON.stringify(document.getElementById("ra_e_id").textContent)},
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

            function addPhyExam() {
                console.log(app.PhyExam)
                $.ajax({
                    url: "researcher/addPhyExam",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {"PhyExam": JSON.stringify(this.app.PhyExam)},
                    success: function (reps) {
                        alert(reps.valueOf());
                        window.location.href = "./VolunteerCheck.jsp";
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

        </script>
    </head>
    <body>
        <div class="param" id="ra_id">${researcher.ra_id}</div>
        <div class="param" id="ra_e_id">${researcher.ra_e_id}</div>
        <div id="app">
            <el-container>
                <el-header>
                    <div id="btn" class="btn">
                        <span>志愿者体检</span>
                    </div>
                    <div id="header" onclick="window.location.href = './index.jsp'">庵东镇药物研发试测平台</div>
                    <div id="btn-7" class="btn-s">
                        <span>你好，${researcher.ra_name}</span>
                    </div>
                    <div id="btn-6" class="btn-s">
                        <span onclick="window.location.href = './logout.jsp'">登出</span>
                    </div>
                </el-header>
                <el-main class="el-tabs">
                    <div id="recruitlist">
                        <el-table
                                :data="recruitList.slice((recruitListPage.currentPage-1)*recruitListPage.pageSize,recruitListPage.currentPage*recruitListPage.pageSize)"
                                border
                                style="width: 1600px;margin-right: auto;margin-left: auto"
                                :row-class-name="tableRowClassName">
                            <el-table-column
                                    prop="rl_user_name"
                                    label="姓名"
                                    width="150">
                            </el-table-column>
                            <el-table-column
                                    prop="rl_title"
                                    label="招募标题"
                                    width="200">
                            </el-table-column>
                            <el-table-column
                                    prop="rl_user_sex"
                                    label="性别"
                                    :formatter="sexTypeFormatter"
                                    width="100">
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
                                    label="操作"
                                    width="100"
                                    prop="isv">
                                <template slot-scope="scope" v-show="scope.row.ispe===0">
                                    <el-button @click="handleClick(scope.row)" type="text" size="small">体检
                                    </el-button>
                                </template>
                            </el-table-column>
                        </el-table>
                        <div class="block" style="margin-top:15px;">
                            <el-pagination
                                    @size-change="handleSizeChange1"
                                    @current-change="handleCurrentChange1"
                                    :current-page.sync="recruitListPage.currentPage"
                                    :page-sizes="[5, 10, 15, 20, 25]"
                                    :page-size="recruitListPage.pageSize"
                                    layout="total, sizes, prev, pager, next, jumper"
                                    :total="recruitListPage.total">
                            </el-pagination>
                        </div>
                        <el-drawer
                                title="体检数据"
                                :visible.sync="drawer"
                                :direction="direction">
                            <div id="addPhyExam">
                                <el-form :label-position="labelPosition" label-width="100px"
                                         :model="PhyExam">
                                    <el-divider>生命体征（包括体温、脉搏及血压）</el-divider>
                                    <el-form-item label="体温">
                                        <el-input v-model="PhyExam.pe_body_temperature">
                                            <i slot="suffix" style="font-style:normal;margin-right: 20px;">℃</i>
                                        </el-input>
                                    </el-form-item>
                                    <el-form-item label="脉搏">
                                        <el-input v-model="PhyExam.pe_pulse">
                                            <i slot="suffix" style="font-style:normal;margin-right: 20px;">次/分</i>
                                        </el-input>
                                    </el-form-item>
                                    <el-form-item label="血压">
                                        <el-input v-model="PhyExam.pe_blood_pressure">
                                            <i slot="suffix" style="font-style:normal;margin-right: 20px;">mmHg</i>
                                        </el-input>
                                    </el-form-item>
                                    <el-divider>体格检查</el-divider>
                                    <el-form-item label="皮肤">
                                        <el-radio v-model="PhyExam.pe_skin" label="0" border>正常</el-radio>
                                        <el-radio v-model="PhyExam.pe_skin" label="1" border>异常</el-radio>
                                    </el-form-item>
                                    <el-form-item label="淋巴结">
                                        <el-radio v-model="PhyExam.pe_lymph_nodes" label="0" border>正常</el-radio>
                                        <el-radio v-model="PhyExam.pe_lymph_nodes" label="1" border>异常</el-radio>
                                    </el-form-item>
                                    <el-form-item label="头颈">
                                        <el-radio v-model="PhyExam.pe_neck" label="0" border>正常</el-radio>
                                        <el-radio v-model="PhyExam.pe_neck" label="1" border>异常</el-radio>
                                    </el-form-item>
                                    <el-form-item label="胸部">
                                        <el-radio v-model="PhyExam.pe_chest" label="0" border>正常</el-radio>
                                        <el-radio v-model="PhyExam.pe_chest" label="1" border>异常</el-radio>
                                    </el-form-item>
                                    <el-form-item label="腹部">
                                        <el-radio v-model="PhyExam.pe_abdomen" label="0" border>正常</el-radio>
                                        <el-radio v-model="PhyExam.pe_abdomen" label="1" border>异常</el-radio>
                                    </el-form-item>
                                    <el-form-item label="脊椎">
                                        <el-radio v-model="PhyExam.pe_spine" label="0" border>正常</el-radio>
                                        <el-radio v-model="PhyExam.pe_spine" label="1" border>异常</el-radio>
                                    </el-form-item>
                                    <el-form-item label="四肢">
                                        <el-radio v-model="PhyExam.pe_limbs" label="0" border>正常</el-radio>
                                        <el-radio v-model="PhyExam.pe_limbs" label="1" border>异常</el-radio>
                                    </el-form-item>
                                    <el-form-item label="其他">
                                        <el-input v-model="PhyExam.pe_other"></el-input>
                                    </el-form-item>
                                    <el-form-item label="身高">
                                        <el-input v-model="PhyExam.pe_height">
                                            <i slot="suffix" style="font-style:normal;margin-right: 20px;">CM</i>
                                        </el-input>
                                    </el-form-item>
                                    <el-form-item label="体重">
                                        <el-input v-model="PhyExam.pe_weight">
                                            <i slot="suffix" style="font-style:normal;margin-right: 20px;">KG</i>
                                        </el-input>
                                    </el-form-item>
                                    <el-divider>导联心电图、血常规、尿常规等</el-divider>
                                    <el-form-item label="导联心电图">
                                        <el-radio v-model="PhyExam.pe_ECG" label="0" border>正常</el-radio>
                                        <el-radio v-model="PhyExam.pe_ECG" label="1" border>异常</el-radio>
                                    </el-form-item>
                                    <el-form-item label="血常规">
                                        <el-radio v-model="PhyExam.pe_blood_routine" label="0" border>正常</el-radio>
                                        <el-radio v-model="PhyExam.pe_blood_routine" label="1" border>异常</el-radio>
                                    </el-form-item>
                                    <el-form-item label="尿常规">
                                        <el-radio v-model="PhyExam.pe_urine_routine" label="0" border>正常</el-radio>
                                        <el-radio v-model="PhyExam.pe_urine_routine" label="1" border>异常</el-radio>
                                    </el-form-item>
                                    <el-form-item label="血生化">
                                        <el-radio v-model="PhyExam.pe_blood_chemistry" label="0" border>正常</el-radio>
                                        <el-radio v-model="PhyExam.pe_blood_chemistry" label="1" border>异常</el-radio>
                                    </el-form-item>
                                    <el-form-item label="凝血功能">
                                        <el-radio v-model="PhyExam.pe_coagulation" label="0" border>正常</el-radio>
                                        <el-radio v-model="PhyExam.pe_coagulation" label="1" border>异常</el-radio>
                                    </el-form-item>
                                    <el-divider></el-divider>
                                    <el-form-item label="妊娠检查">
                                        <el-radio v-model="PhyExam.pe_pregnancy" label="0" border>正常</el-radio>
                                        <el-radio v-model="PhyExam.pe_pregnancy" label="1" border>异常</el-radio>
                                    </el-form-item>
                                    <el-form-item label="吸烟">
                                        <el-radio v-model="PhyExam.pe_smoking" label="0" border>否</el-radio>
                                        <el-radio v-model="PhyExam.pe_smoking" label="1" border>是</el-radio>
                                    </el-form-item>
                                    <el-form-item label="喝酒">
                                        <el-radio v-model="PhyExam.pe_drinking" label="0" border>否</el-radio>
                                        <el-radio v-model="PhyExam.pe_drinking" label="1" border>是</el-radio>
                                    </el-form-item>
                                    <el-button type="primary" @click="addPhyExam">提交信息</el-button>
                                </el-form>
                            </div>
                        </el-drawer>
                    </div>
                </el-main>
                <el-footer> &copy; 2022 毕业设计 | Design by 201805020527王潘锋</el-footer>
            </el-container>
        </div>
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
                        drawer: false,
                        labelPosition: 'left',
                        direction: 'rtl',
                        recruitList: [],
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
                    };
                },
                filters: {},
                methods: {
                    handleSizeChange1(val) {
                        console.log(`每页 ${val} 条`);
                        this.recruitListPage.currentPage = 1;
                        this.recruitListPage.pageSize = val;
                    },
                    handleCurrentChange1(val) {
                        console.log(`当前页: ${val}`);
                        this.recruitListPage.currentPage = val;
                    },
                    handleClick(row) {
                        this.drawer = 'true';
                        this.PhyExam.pe_rl_id = row.rl_id;
                        this.PhyExam.pe_u_id = row.rl_u_id;
                        this.PhyExam.pe_ra_id = document.getElementById("ra_id").textContent;
                        this.PhyExam.pe_e_id = document.getElementById("ra_e_id").textContent;
                    },
                    tableRowClassName({row, rowIndex}) {
                        if (row.isv === 0) {
                            return 'warning-row';
                        } else if (row.isv === 1) {
                            return 'success-row';
                        } else {
                            return 'error-row'
                        }
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
                },
                created: function () {
                    getRecruitList();
                },
            })
        </script>
    </body>
</html>
