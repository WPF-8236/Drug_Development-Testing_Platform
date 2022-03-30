<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
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
        <link rel="stylesheet" type="text/css" href="u_css/message.css"/>
        <script src="u_js/date.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/jquery-3.6.0.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="lib-master/index.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript">
            function getMessage(m_mark) {
                console.log(m_mark);
                $.ajax({
                    url: "Message/getMessageBym_mark",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {'m_mark': JSON.stringify(m_mark)},
                    success: function (reps) {
                        console.log(reps);
                        app.messages = reps;
                    },
                    error: function () {
                        alert('error');
                    }
                })
            }

            function selectDrag(key, value) {
                console.log(key + " " + value);
                $.ajax({
                    url: "Message/getDraglist",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    data: {'key': JSON.stringify(key), 'value': JSON.stringify(value)},
                    success: function (reps) {
                        console.log(reps);
                        app.drag = reps;
                        this.mainTableKey = Math.random();
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
                    <div id="btn" class="btn">
                        <span>药物信息</span>
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
                    <el-tabs type="border-card" @tab-click="messageClick">
                        <el-tab-pane label="药物公布">
                            <el-collapse v-model="activeName" accordion>
                                <el-collapse-item v-for="" title="一致性 Consistency" name="1">
                                    <el-timeline reverse="false">
                                        <el-timeline-item
                                                v-for="(activity, index) in activities"
                                                :key="index"
                                                :timestamp="activity.timestamp">
                                            {{activity.content}}
                                        </el-timeline-item>
                                    </el-timeline>
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

                        </el-tab-pane>
                        <el-tab-pane label="药物查询">
                            <div style="margin-top: 15px;" id="d_find">
                                <el-input placeholder="请输入内容" v-model="input3" class="input-with-select">
                                    <el-select v-model="select" slot="prepend" placeholder="请选择">
                                        <el-option label="商品名" value="1"></el-option>
                                        <el-option label="通用名" value="2"></el-option>
                                        <el-option label="批准号" value="3"></el-option>
                                    </el-select>
                                    <el-button slot="append" icon="el-icon-search" onclick="app.findDrag()"></el-button>
                                </el-input>
                            </div>
                            <el-table
                                    :key="mainTableKey"
                                    :data="drag"
                                    style="width: 100%"
                                    :row-class-name="tableRowClassName">
                                <el-table-column
                                        prop="d_trade_name"
                                        label="商品名"
                                        width="180">
                                </el-table-column>
                                <el-table-column
                                        prop="d_generic_name"
                                        label="通用名"
                                        width="180">
                                </el-table-column>
                                <el-table-column
                                        prop="d_specification"
                                        label="规格"
                                        width="180">
                                </el-table-column>
                                <el-table-column
                                        prop="d_attending"
                                        label="主治功能"
                                        width="850">
                                </el-table-column>
                                <el-table-column
                                        prop="d_state"
                                        label="种类"
                                        width="150"
                                        :formatter="stateFormat1">
                                </el-table-column>
                                <el-table-column
                                        prop="d_approve"
                                        label="状态"
                                        :formatter="stateFormat2">
                                </el-table-column>
                            </el-table>
                        </el-tab-pane>
                        <el-tab-pane label="药物科普">
                            <div id="messages">
                                <div v-for="message in messages" id="message">
                                    <div id="message-title">
                                        {{message.m_title}}
                                    </div>
                                    <div id="message-img">
                                        <img src="./img/药物1.jfif" height="100px">
                                    </div>
                                    <div id="message-1">
                                        <div id="message-summary">
                                            {{message.m_summary}}
                                        </div>
                                        <div id="message-type">
                                            {{message.m_type}}
                                        </div>
                                    </div>
                                    <div id="message-2">
                                        <div id="message-time">
                                            <span>时间：</span>
                                            {{message.m_time | dateFilter}}
                                        </div>
                                        <div class="clear"></div>
                                        <div id="message-read">
                                            <span>阅读数：</span>
                                            {{message.m_read}}
                                        </div>
                                        <div class="clear"></div>
                                        <div id="message-author">
                                            <span>作者：</span>
                                            {{message.m_author}}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </el-tab-pane>
                        <el-tab-pane label="药物对比">
                            <div id="d_contrast">
                                <el-row :gutter="20">
                                    <el-col :span="10">
                                        <div id="d_contrast_left">
                                            <el-select v-model="value1" placeholder="请选择">
                                                <el-option
                                                        v-for="item in drag"
                                                        :key="item.d_id"
                                                        :label="item.d_generic_name"
                                                        :value="item">
                                                </el-option>
                                            </el-select>
                                            <el-descriptions class="margin-top" :column="1">
                                                <el-descriptions-item label="药品商品名">{{value1.d_trade_name}}
                                                </el-descriptions-item>
                                                <el-descriptions-item label="药品通用名">{{value1.d_generic_name}}
                                                </el-descriptions-item>
                                                <el-descriptions-item label="药品规格">{{value1.d_specification}}
                                                </el-descriptions-item>
                                                <el-descriptions-item label="药品主治功能">{{value1.d_attending}}
                                                </el-descriptions-item>
                                                <el-descriptions-item label="药品禁忌">{{value1.d_taboo}}
                                                </el-descriptions-item>
                                                <el-descriptions-item label="药品不良反应">{{value1.d_adverse_reactions}}
                                                </el-descriptions-item>
                                                <el-descriptions-item label="药品保质期">{{value1.d_shelf_life}}
                                                </el-descriptions-item>
                                                <el-descriptions-item label="备注">
                                                    <el-tag size="small" v-if="value1.d_mark==1">甲类OTC</el-tag>
                                                    <el-tag size="small" v-if="value1.d_mark==2">乙类OTC</el-tag>
                                                    <el-tag size="small" v-if="value1.d_mark==3">保健品</el-tag>
                                                </el-descriptions-item>
                                                <el-descriptions-item label="备注">
                                                    <el-tag size="small" v-if="value1.d_approve==1">批准</el-tag>
                                                    <el-tag size="small" v-if="value1.d_approve==0">未批准</el-tag>
                                                </el-descriptions-item>
                                            </el-descriptions>
                                        </div>
                                    </el-col>
                                    <el-col :span="10">
                                        <div id="d_contrast_right">
                                            <el-select v-model="value2" placeholder="请选择">
                                                <el-option
                                                        v-for="item in drag"
                                                        :key="item.d_id"
                                                        :label="item.d_generic_name"
                                                        :value="item">
                                                </el-option>
                                            </el-select>
                                            <el-descriptions class="margin-top" :column="1">
                                                <el-descriptions-item label="药品商品名">{{value2.d_trade_name}}
                                                </el-descriptions-item>
                                                <el-descriptions-item label="药品通用名">{{value2.d_generic_name}}
                                                </el-descriptions-item>
                                                <el-descriptions-item label="药品规格">{{value2.d_specification}}
                                                </el-descriptions-item>
                                                <el-descriptions-item label="药品主治功能">{{value2.d_attending}}
                                                </el-descriptions-item>
                                                <el-descriptions-item label="药品禁忌">{{value2.d_taboo}}
                                                </el-descriptions-item>
                                                <el-descriptions-item label="药品不良反应">{{value2.d_adverse_reactions}}
                                                </el-descriptions-item>
                                                <el-descriptions-item label="药品保质期">{{value2.d_shelf_life}}
                                                </el-descriptions-item>
                                                <el-descriptions-item label="备注">
                                                    <el-tag size="small" v-if="value2.d_mark==1">甲类OTC</el-tag>
                                                    <el-tag size="small" v-if="value2.d_mark==2">乙类OTC</el-tag>
                                                    <el-tag size="small" v-if="value2.d_mark==3">保健品</el-tag>
                                                </el-descriptions-item>
                                                <el-descriptions-item label="备注">
                                                    <el-tag size="small" v-if="value2.d_approve==1">批准</el-tag>
                                                    <el-tag size="small" v-if="value2.d_approve==0">未批准</el-tag>
                                                </el-descriptions-item>
                                            </el-descriptions>
                                        </div>
                                    </el-col>
                                </el-row>
                            </div>
                        </el-tab-pane>
                        <el-tab-pane label="药物调查">
                            <div id="d_survey">
                                <el-select v-model="survey.s_d_id" placeholder="请选择">
                                    <el-option
                                            v-for="item in drag"
                                            :key="item.d_id"
                                            :label="item.d_generic_name"
                                            :value="item.d_id">
                                    </el-option>
                                </el-select>
                                <el-form ref="survey" label-position="top" :model="survey" label-width="100px">
                                    <el-form-item label="1.您的姓名：">
                                        <el-input v-model="survey.s_name"></el-input>
                                    </el-form-item>
                                    <el-form-item label="2.您的性别:">
                                        <el-radio-group v-model="survey.s_sex">
                                            <el-radio label="男"></el-radio>
                                            <el-radio label="女"></el-radio>
                                        </el-radio-group>
                                    </el-form-item>
                                    <el-form-item label="3.您在药店买药时会在药店人员的建议下买药吗?">
                                        <el-radio-group v-model="survey.s_field1">
                                            <el-radio label="会"></el-radio>
                                            <el-radio label="不会"></el-radio>
                                        </el-radio-group>
                                    </el-form-item>
                                    <el-form-item label="4.您最近一个月中去过几次医院或药店:">
                                        <el-radio-group v-model="survey.s_field2">
                                            <el-radio label="1~2"></el-radio>
                                            <el-radio label="3~4"></el-radio>
                                            <el-radio label="5~6"></el-radio>
                                        </el-radio-group>
                                    </el-form-item>
                                    <el-form-item label="5.您感觉身体不适时会通过哪个途径解决?:">
                                        <el-radio-group v-model="survey.s_field3">
                                            <el-radio label="自行买药"></el-radio>
                                            <el-radio label="医院就医"></el-radio>
                                            <el-radio label="观察一段时间再决定"></el-radio>
                                            <el-radio label="其他"></el-radio>
                                        </el-radio-group>
                                    </el-form-item>
                                    <el-form-item label="6.买药品时,您会关注药品说明书么?:">
                                        <el-radio-group v-model="survey.s_field4">
                                            <el-radio label="会"></el-radio>
                                            <el-radio label="不会"></el-radio>
                                            <el-radio label="偶尔会"></el-radio>
                                        </el-radio-group>
                                    </el-form-item>
                                    <el-form-item label="7.您买药时会受到药品广告的影响么?:">
                                        <el-radio-group v-model="survey.s_field5">
                                            <el-radio label="会"></el-radio>
                                            <el-radio label="不会"></el-radio>
                                            <el-radio label="影响不大"></el-radio>
                                        </el-radio-group>
                                    </el-form-item>
                                    <el-form-item label="8.当您的病有多种药物疗法治疗时,您会选择?:">
                                        <el-radio-group v-model="survey.s_field6">
                                            <el-radio label="一种药治疗"></el-radio>
                                            <el-radio label="两种药治疗"></el-radio>
                                            <el-radio label="多种药联合治疗"></el-radio>
                                        </el-radio-group>
                                    </el-form-item>
                                    <el-form-item label="9.您选购药品一般会考虑哪些因素?:">
                                        <el-checkbox-group v-model="survey.s_field7">
                                            <el-checkbox label="疗效"></el-checkbox>
                                            <el-checkbox label="品牌知名度"></el-checkbox>
                                            <el-checkbox label="价格和味道"></el-checkbox>
                                            <el-checkbox label="广告效果"></el-checkbox>
                                            <el-checkbox label="企业形象和信誉"></el-checkbox>
                                            <el-checkbox label="产品安全性"></el-checkbox>
                                            <el-checkbox label="售后服务"></el-checkbox>
                                        </el-checkbox-group>
                                    </el-form-item>
                                    <el-form-item label="10.目前市场上出售的药品，您认为最能让您放心购买的是哪类药?:">
                                        <el-checkbox-group v-model="survey.s_field8">
                                            <el-checkbox label="成人感冒药"></el-checkbox>
                                            <el-checkbox label="儿童感冒药"></el-checkbox>
                                            <el-checkbox label="肠胃药"></el-checkbox>
                                            <el-checkbox label="眼睛用药"></el-checkbox>
                                            <el-checkbox label="妇科用药"></el-checkbox>
                                            <el-checkbox label="消炎药"></el-checkbox>
                                            <el-checkbox label="外伤用药"></el-checkbox>
                                            <el-checkbox label="皮肤病用药"></el-checkbox>
                                            <el-checkbox label="无药品信任"></el-checkbox>
                                            <el-checkbox label="其他"></el-checkbox>
                                        </el-checkbox-group>
                                    </el-form-item>
                                    <el-form-item label="11.影响您选择药店的首要因素是?药店品牌?:">
                                        <el-checkbox-group v-model="survey.s_field9">
                                            <el-checkbox label="药企品牌"></el-checkbox>
                                            <el-checkbox label="距离远近"></el-checkbox>
                                            <el-checkbox label="药品价格"></el-checkbox>
                                            <el-checkbox label="无所谓"></el-checkbox>
                                        </el-checkbox-group>
                                    </el-form-item>
                                    <el-form-item label="12.你认为市场上的常用药价是否合理?">
                                        <el-input v-model="survey.s_field10"></el-input>
                                    </el-form-item>
                                    <el-form-item>
                                        <el-button type="primary" @click="onSubmit">立即创建</el-button>
                                        <el-button>取消</el-button>
                                    </el-form-item>
                                </el-form>
                            </div>
                        </el-tab-pane>
                        <el-backtop target=".el-tabs" bottom="100" style="background-color: #f2f5f6;
        box-shadow: 0 0 6px rgba(0,0,0, .12);"></el-backtop>
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
                        activeName: '1',
                        messages: [],
                        input3: '',
                        select: '',
                        drag: [],
                        mainTableKey: 1,
                        value1: '',
                        value2: '',
                        survey: {
                            s_d_id: '',
                            s_name: '',
                            s_sex: '',
                            s_field1: '',
                            s_field2: '',
                            s_field3: '',
                            s_field4: '',
                            s_field5: '',
                            s_field6: '',
                            s_field7: [],
                            s_field8: [],
                            s_field9: [],
                            s_field10: '',
                        },
                        activities: [{
                            content: '活动按期开始',
                            timestamp: '2018-04-15'
                        }, {
                            content: '通过审核',
                            timestamp: '2018-04-13'
                        }, {
                            content: '创建成功',
                            timestamp: '2018-04-11'
                        }]
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
                    messageClick(tab, event) {
                        if (tab.index == 2)
                            getMessage(1);
                        console.log(tab, event);
                    },
                    tableRowClassName({row, rowIndex}) {
                        if (row.d_approve === 0) {
                            return 'warning-row';
                        } else {
                            return 'success-row';
                        }
                    },
                    findDrag() {
                        selectDrag(this.select, this.input3);
                    },
                    stateFormat1(row, column) {
                        if (row.d_state === 0) {
                            return '处方药'
                        } else if (row.d_state === 1) {
                            return '非处方药'
                        } else {
                            return '其他'
                        }
                    },
                    stateFormat2(row, column) {
                        if (row.d_approve === 1) {
                            return '通过批准'
                        } else {
                            return '未通过批注'
                        }
                    },
                    onSubmit() {
                        console.log('submit!');
                    },
                },
                created: function () {
                    getMessage(1);
                },
            })
        </script>
    </body>
</html>
