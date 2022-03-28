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
                                <div id="DragList">
                                    <el-table
                                            :data="DragList"
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
                                                prop="d_approve"
                                                label="状态"
                                                width="200">
                                            <template slot-scope="scope">
                                                <el-tag
                                                        :type="scope.row.d_approve == '1' ? 'success' : 'danger'"
                                                        disable-transitions>{{scope.row.d_approve|isvFilter}}
                                                </el-tag>
                                            </template>
                                        </el-table-column>
                                    </el-table>
                                </div>

                            </div>
                            <div v-show="index==3">
                                <el-collapse v-model="activeNames" @change="handleChange">
                                    <el-collapse-item title="未分配的志愿者" name="1">
                                        <div>与现实生活一致：与现实生活的流程、逻辑保持一致，遵循用户习惯的语言和概念；</div>
                                        <div>在界面中一致：所有的元素和结构需保持一致，比如：设计样式、图标和文本、元素的位置等。</div>
                                    </el-collapse-item>
                                    <el-collapse-item title="反馈 Feedback" name="2">
                                        <div>控制反馈：通过界面样式和交互动效让用户可以清晰的感知自己的操作；</div>
                                        <div>页面反馈：操作后，通过页面元素的变化清晰地展现当前状态。</div>
                                    </el-collapse-item>
                                    <el-collapse-item title="效率 Efficiency" name="3">
                                        <div>简化流程：设计简洁直观的操作流程；</div>
                                        <div>清晰明确：语言表达清晰且表意明确，让用户快速理解进而作出决策；</div>
                                        <div>帮助用户识别：界面简单直白，让用户快速识别而非回忆，减少用户记忆负担。</div>
                                    </el-collapse-item>
                                    <el-collapse-item title="可控 Controllability" name="4">
                                        <div>用户决策：根据场景可给予用户操作建议或安全提示，但不能代替用户进行决策；</div>
                                        <div>结果可控：用户可以自由的进行操作，包括撤销、回退和终止当前操作等。</div>
                                    </el-collapse-item>
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
                        value: '',
                        direction: 'rtl',
                        drawer: false,
                        drawer2: false,
                        drawer3: false,
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
                    };
                },
                methods: {
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
                    select(index, indexPath) {
                        app.index = index;
                    },
                    onSubmit() {
                        addResearcher();
                    },
                    handleChange(val) {
                        console.log(val);
                    },
                    putDrag() {
                        putADrag();
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
                },
                filters: {
                    isvFilter(value) {
                        if (value === 0)
                            return '审核中'
                        else if (value === 1)
                            return '通过'
                        else
                            return '未通过'
                    },
                },
                created: function () {
                    getResearcherList();
                    getDragList();
                }
            })
        </script>
    </body>
</html>
